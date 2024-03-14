//package 0x0e1fc4384d277b9eaa0052269beafb0274affd19246bc1cffe84ca32e69b6d28
module satoshi_flip::single_player_satoshi {

    use std::string::{Self, String};
    use std::vector;

    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::sui::SUI;
    use sui::bls12381::bls12381_min_pk_verify;
    use sui::object::{Self, UID, ID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::event::emit;
    use sui::hash::{blake2b256};
    use sui::dynamic_object_field::{Self as dof};

    use satoshi_flip::counter_nft::{Self, Counter};
    use satoshi_flip::house_data::{Self as hd, HouseData};

    // 常量定义
    const EPOCHS_CANCEL_AFTER: u64 = 7;
    const GAME_RETURN: u8 = 2;
    const PLAYER_WON_STATE: u8 = 1;
    const HOUSE_WON_STATE: u8 = 2;
    const CHALLENGED_STATE: u8 = 3;
    const HEADS: vector<u8> = b"H";
    const TAILS: vector<u8> = b"T";

    const EStakeTooLow: u64 = 0;
    const EStakeTooHigh: u64 = 1;
    const EInvalidBlsSig: u64 = 2;
    const ECanNotChallengeYet: u64 = 3;
    const EInvalidGuess: u64 = 4;
    const EInsufficientHouseBalance: u64 = 5;
    const EGameDoesNotExist: u64 = 6;

    // 事件：游戏 ID、玩家地址、VRF 输入、猜测、用户赌注和手续费
    struct NewGame has copy, drop {
        game_id: ID,
        player: address,
        vrf_input: vector<u8>,
        guess: String,
        user_stake: u64,
        fee_bp: u16
    }

    // 事件：游戏结果带有游戏 ID 和状态信息
    struct Outcome has copy, drop {
        game_id: ID,
        status: u8
    }

    // 游戏
    struct Game has key, store {
        id: UID,
        guess_placed_epoch: u64,
        total_stake: Balance<SUI>,
        guess: String,
        player: address,
        vrf_input: vector<u8>,
        fee_bp: u16
    }

    //开始游戏
    public fun start_game(guess: String, counter: &mut Counter, coin: Coin<SUI>, house_data: &mut HouseData, ctx: &mut TxContext): ID {
        let fee_bp = hd::base_fee_in_bp(house_data);
        let (id, new_game) = internal_start_game(guess, counter, coin, house_data, fee_bp, ctx);

        dof::add(hd::borrow_mut(house_data), id, new_game);
        id
    }

    // 结束游戏的公共函数，接收游戏 ID、BLS 签名和 HouseData 信息
    public fun finish_game(game_id: ID, bls_sig: vector<u8>, house_data: &mut HouseData, ctx: &mut TxContext) {
        assert!(game_exists(house_data, game_id), EGameDoesNotExist);

        let Game {
            id,
            guess_placed_epoch: _,
            total_stake,
            guess,
            player,
            vrf_input,
            fee_bp
        } = dof::remove<ID, Game>(hd::borrow_mut(house_data), game_id);

        object::delete(id);

        // 检查签名确保随机
        let is_sig_valid = bls12381_min_pk_verify(&bls_sig, &hd::public_key(house_data), &vrf_input);
        assert!(is_sig_valid, EInvalidBlsSig);
        let hashed_beacon = blake2b256(&bls_sig);

        // 计算赢家
        //该函数检查玩家的猜测（正面 0） 或反面 （1） 是否与house的猜测相同。这是通过获取随机向量的第一个字节并检查它是否可以被 2 整除来完成的。如果是，那就是正面，如果不是，那就是反面
        let first_byte = *vector::borrow(&hashed_beacon, 0);
        let player_won = map_guess(guess) == (first_byte % 2);

        // 发布奖金
        let status = if (player_won) {

            let stake_amount = balance::value(&total_stake);
            let fee_amount = fee_amount(stake_amount, fee_bp);
            let fees = balance::split(&mut total_stake, fee_amount);
            balance::join(hd::borrow_fees_mut(house_data), fees);
            transfer::public_transfer(coin::from_balance(total_stake, ctx), player);
            PLAYER_WON_STATE
        } else {
            balance::join(hd::borrow_balance_mut(house_data), total_stake);
            HOUSE_WON_STATE
        };

        emit(Outcome {
            game_id,
            status
        });
    }

   
    public fun dispute_and_win(house_data: &mut HouseData, game_id: ID, ctx: &mut TxContext) {
        assert!(game_exists(house_data, game_id), EGameDoesNotExist);

        let Game {
            id,
            guess_placed_epoch,
            total_stake,
            guess: _,
            player,
            vrf_input: _,
            fee_bp: _
        } = dof::remove(hd::borrow_mut(house_data), game_id);

        object::delete(id);

        let caller_epoch = tx_context::epoch(ctx);
        let cancel_epoch = guess_placed_epoch + EPOCHS_CANCEL_AFTER;

        assert!(cancel_epoch <= caller_epoch, ECanNotChallengeYet);

        transfer::public_transfer(coin::from_balance(total_stake, ctx), player);

        emit(Outcome {
            game_id,
            status: CHALLENGED_STATE
        });
    }

    // 获取游戏猜测时间的公共函数
    public fun guess_placed_epoch(game: &Game): u64 {
        game.guess_placed_epoch
    }

    // 获取游戏赌注的公共函数
    public fun stake(game: &Game): u64 {
        balance::value(&game.total_stake)
    }

    // 获取游戏猜测的公共函数
    public fun guess(game: &Game): u8 {
        map_guess(game.guess)
    }

    // 获取游戏玩家地址的公共函数
    public fun player(game: &Game): address {
        game.player
    }

    // 获取游戏 VRF 输入的公共函数
    public fun vrf_input(game: &Game): vector<u8> {
        game.vrf_input
    }

    // 获取游戏手续费百分比的公共函数
    public fun fee_in_bp(game: &Game): u16 {
        game.fee_bp
    }

    // 计算手续费金额的公共函数
    // （ stake / 2 ）* fee / 10000
    public fun fee_amount(game_stake: u64, fee_in_bp: u16): u64 {
        ((((game_stake / (GAME_RETURN as u64)) as u128) * (fee_in_bp as u128) / 10_000) as u64)
    }

    // 判断游戏是否存在的公共函数
    public fun game_exists(house_data: &HouseData, game_id: ID): bool {
        dof::exists_(hd::borrow(house_data), game_id)
    }

    // 获取游戏信息的引用的公共函数
    public fun borrow_game(game_id: ID, house_data: &HouseData): &Game {
        assert!(game_exists(house_data, game_id), EGameDoesNotExist);
        dof::borrow(hd::borrow(house_data), game_id)
    }

    // 内部函数，接收猜测、计数器、代币、HouseData 信息、手续费百分比和上下文信息
    fun internal_start_game(guess: String, counter: &mut Counter, coin: Coin<SUI>, house_data: &mut HouseData, fee_bp: u16, ctx: &mut TxContext): (ID, Game) {
        map_guess(guess);
        let user_stake = coin::value(&coin);
        assert!(user_stake <= hd::max_stake(house_data), EStakeTooHigh);
        assert!(user_stake >= hd::min_stake(house_data), EStakeTooLow);
        assert!(hd::balance(house_data) >= user_stake, EInsufficientHouseBalance);

        let total_stake = balance::split(hd::borrow_balance_mut(house_data), user_stake);
        coin::put(&mut total_stake, coin);

        let vrf_input = counter_nft::get_vrf_input_and_increment(counter);

        let id = object::new(ctx);
        let game_id = object::uid_to_inner(&id);

        let new_game = Game {
            id,
            guess_placed_epoch: tx_context::epoch(ctx),
            total_stake,
            guess,
            player: tx_context::sender(ctx),
            vrf_input,
            fee_bp
        };

        emit(NewGame {
            game_id,
            player: tx_context::sender(ctx),
            vrf_input,
            guess,
            user_stake,
            fee_bp
        });

        (game_id, new_game)
    }

    // 确保输入为"H"或"T",将字符串 "HEADS" 映射为数字 0，将字符串 "TAILS" 映射为数字 1
    fun map_guess(guess: String): u8 {
        assert!(string::bytes(&guess) == &HEADS || string::bytes(&guess) == &TAILS, EInvalidGuess);

        if (string::bytes(&guess) == &HEADS) {
            0
        } else {
            1
        }
    }
}


//0x23d52eb24d1f596aa125b922d11c2eca78ae0ca36e39b6054a1effd188163d67
