// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0
module tictactoe::game {
    use sui::object::{Self, UID,ID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::package;
    use std::string::utf8;
    use sui::display;
    use sui::event::emit;
    use sui::hash::{blake2b256};
    use sui::bcs::{Self};
    use std::vector;

    const GameNoOnePlay: u8 = 0u8;
    const GameAgent: u8 = 1u8;
    const GamePlayer: u8 = 2u8;

    /// The state of the game.
    struct TicTacToeState has key {
        id: UID, //unique id of the game
        count: u64, //how many times the game has been played
        state_score:vector<u8>, // game state score,state:(decimal to vector index)(state ternary to decimal), score:decimal(0-100)
    }
    fun state_score_init(state:&mut TicTacToeState){
        let i = 0;
        // 222222222 equals 19682
        while (i < 19683) {
            vector::push_back(&mut state.state_score, 50);
            i = i + 1;
        };
    }

    /// vector<u8> to u64
    fun hash(rand:&vector<u8>):u64{
        use std::debug;
        let random_bytes = blake2b256(rand);
        // debug::print(&random_bytes);
        let random_num: u64 = 0;
        let i = 0;
        while (i < vector::length(&random_bytes)) {
            random_num = (random_num << 8) | (*vector::borrow(&random_bytes,i) as u64);
            i = i + 1;
        };
        random_num
    }

    /// Get all the scores from the index of the score, and state, and then find the highest score, 
    /// and then from the index of the score that is equal to the highest of those scores,
    /// take a random index value and convert it to ternary, and back
    const SelectMaxScoreIndexs: u8 = 1u8;
    const SelectMinScoreIndexs: u8 = 2u8;
    const SelectRandomScoreIndexs: u8 = 0u8;
    const NotSelectIdxs: u64 = 0u64;
    fun state_score_select(state:&TicTacToeState,select_score_flag:u8,scores_idxs:&vector<u64>):vector<u8>{
        use std::debug;
        assert!(vector::length(scores_idxs)>0, NotSelectIdxs);
        // debug::print(&select_score_flag);
        let select_score = 0;
        let select_idxs:vector<u64> = vector[];
        // loop all scores_idxs
        let i = 0;
        while (i < vector::length(scores_idxs)) {
            // get index
            let idx = *vector::borrow(scores_idxs, i);
            // debug::print(&idx);
            // debug::print(&vector::length(&state.state_score));
            // get score
            let score = *vector::borrow(&state.state_score, idx);
            // if score > select_score,update select_score and select_idxs
            if (select_score_flag==SelectMaxScoreIndexs && score > select_score) {
                select_score = score;
                select_idxs = vector[idx];
            } else if (select_score_flag==SelectMinScoreIndexs && score < select_score) {
                select_score = score;
                select_idxs = vector[idx];
            } else if (select_score_flag==SelectRandomScoreIndexs || score == select_score) {
                vector::push_back(&mut select_idxs, idx);
            };
            i = i + 1;
        };
        // debug::print(&select_idxs);
        let s:vector<u8> = vector[];
        vector::append(&mut s, bcs::to_bytes(state));
        vector::append(&mut s, bcs::to_bytes(scores_idxs));
        // compute a random num by timestamp_ms
        let result_idx = *vector::borrow(&select_idxs, ((hash(&s) % vector::length(&select_idxs)) as u64));
        decimal_to_ternary((result_idx as u64))
    }
    #[test]
    public fun test_state_score_select(){
        use std::debug;
        let ctx = tx_context::dummy();
        let game_state_obj = TicTacToeState {
            id: object::new(&mut ctx),
            count: 3, // change count that state_score_select  max score can change
            state_score:vector[],
        };
        state_score_init(&mut game_state_obj);
        let scores_idxs = vector[0,1,2];
        
        vector::append(&mut game_state_obj.state_score, vector[100]);
        vector::swap_remove(&mut game_state_obj.state_score, 1);
        // use state_score_select
        let result = state_score_select(&game_state_obj,0,&scores_idxs);
        debug::print(&result);
        let s = ternary_to_decimal(result);
        debug::print(&s);
        
        let dummy_address = @0xCAFE;
        transfer::transfer(game_state_obj, dummy_address);
    }

    /// get indexs with states form `game state score`
    fun state_scores_idxs(states:&vector<vector<u8>>):vector<u64>{
        let i = 0;
        let idxs:vector<u64> = vector[];
        while (i < vector::length(states)) {
            let state:vector<u8> = *vector::borrow(states, i);
            vector::push_back(&mut idxs, (ternary_to_decimal(state) as u64));
            i = i + 1;
        };
        idxs
    }
    #[test]
    public fun test_state_scores_idxs(){
        use std::debug;
        let ctx = tx_context::dummy();
        let game_state_obj = TicTacToeState {
            id: object::new(&mut ctx),
            count: 0,
            state_score:vector[],
        };
        state_score_init(&mut game_state_obj);
        let states:vector<vector<u8>> = vector[
            vector[0,0,0,0,0,0,0,0,0],
            vector[1,1,1,1,1,1,1,1,1],
            vector[2,2,2,2,2,2,2,2,2],
        ];
        let idxs = state_scores_idxs(&states);
        debug::print(&idxs);
        
        let dummy_address = @0xCAFE;
        transfer::transfer(game_state_obj, dummy_address);
    }

    struct GAME has drop {}

    /// init the game package
    fun init(witness: GAME, ctx:&mut TxContext){
        let keys = vector[
            utf8(b"token_id"), // id of the NFT
            utf8(b"round"),// Round
            utf8(b"wins"), // wins game round 
            utf8(b"image_url"), // game nft image url
        ];

        let values = vector[
            utf8(b"TicTacToe #{tokenId}"),
            utf8(b"Round {round}"),
            utf8(b"Wins {wins}"),
            utf8(b"{image_url}"),
        ];

        let publisher = package::claim(witness,ctx);
        let display = display::new_with_fields<GameNFT>(&publisher, keys, values, ctx);
        display::update_version(&mut display);
        // Creating and sending the Publisher object to the sender.
        transfer::public_transfer(publisher, tx_context::sender(ctx));
        // Creating and sending the GameDisplay object to the sender.
        transfer::public_transfer(display, tx_context::sender(ctx));

        // create TicTacToeState
        let game_state_obj = TicTacToeState {
            id: object::new(ctx),
            count: 0,
            state_score:vector[],
        };
        state_score_init(&mut game_state_obj);
        transfer::share_object(game_state_obj);
    
    }
    /// TicTacToe Game data
    struct GameNFT has key,store{
        id: UID,
        tokenId: u64, // id of the NFT
        round: u16, // Round
        wins: u16, // win rate 
        image_url: std::ascii::String, // url of the NFT image
    
        /// temp state
        turn: u8, // turn player,0:nothing,1:player1,2:player2
        state: u8, // game state,0:active,1:tie,2:win,3:lose
        game_id: ID,
        board: vector<u8>,// game board store ternary
    }

    /// if poeple whant to mint NFT,need to start a tic-tac-toe game
    entry public fun mint(state:&mut TicTacToeState,ctx: &mut TxContext){
        let sender = tx_context::sender(ctx);
        state.count = state.count + 1;
        let game_nft = createNewGameNFT(state.count,ctx);
        game_nft.round = game_nft.round+1;

        game_nft.turn = GameAgent;
        let agent_move = agent_select_move(state,&game_nft,0u8);
        game_nft.board = fill_teranry(agent_move,9u64);
        game_nft.turn = GamePlayer;

        emit(NewGame {
            game_id: game_nft.game_id,
            round: game_nft.round,
            player: tx_context::sender(ctx),
            board: game_nft.board,
        });
        transfer::public_transfer(game_nft, sender);
    }

    /// create a init game data
    public fun createNewGameNFT(state_count:u64, ctx: &mut TxContext): GameNFT {
        let id = object::new(ctx);
        let game_id = object::uid_to_inner(&id);
        GameNFT {
            id: id,// unique id of the game
            tokenId: state_count,// id of the NFT
            round:0,// Round
            wins:0, // wins game round
            image_url: std::ascii::string(b"https://avatars.githubusercontent.com/GHChrissu"),

            // temp state
            turn:GameNoOnePlay,// turn player
            state:GameActive, // game state,0:active,1:tie,2:win
            game_id:game_id,
            board: vector[0,0,0,0,0,0,0,0,0],// game board store ternary
        }
    }
    #[test]
    public fun test_create_game() {
        use std::debug;
        // Create a dummy TxContext and address for testing
        let ctx = tx_context::dummy();
        let dummy_address = @0xCAFE;

        // Create a State
        let game_state_obj = TicTacToeState {
            id: object::new(&mut ctx),
            count: 0,
            state_score:vector[],
        };
        debug::print(&game_state_obj); 
        assert!(game_state_obj.count ==  0, 1);

        let game_data = createNewGameNFT(game_state_obj.count, &mut ctx);
        debug::print(&game_data); 
        assert!(game_data.tokenId == game_state_obj.count, 1);

        // play(&mut game_state_obj,&mut game_data,&mut ctx);
        debug::print(&game_data);
        debug::print(&game_state_obj);

        transfer::transfer(game_data, dummy_address);
        transfer::transfer(game_state_obj, dummy_address);
    }

    struct NewGame has copy, drop {
        game_id: ID,
        round: u16,
        player: address,
        board: vector<u8>,
    }
    struct GameView has copy, drop {
        game_id: ID,
        round: u16,
        state: u8,
        player: address,
        board: vector<u8>,
        turn: u8,
    }
    struct Outcome has copy, drop {
        game_id: ID,
        round: u16,
        wins: u16,
        state: u8, // 0:active,1:tie,2:win
        board: vector<u8>,
    }

    /// print game board
    fun print_board(game_nft:&GameNFT){
        use std::debug;
        let board = game_nft.board;
        let i = 0;
        let row = b"\n\t";
        while (i < 9) {
            let piece = *vector::borrow(&board, i);
            if (piece == 0) {
                vector::append(&mut row, b"-\t");
            } else if (piece == 1) {
                vector::append(&mut row, b"X\t");
            } else if (piece == 2) {
                vector::append(&mut row, b"O\t");
            };
            i = i + 1;
            if (i%3 == 0){
                vector::append(&mut row, b"\n\t");
            }
        };
        debug::print(&utf8(row));
    }
    #[test]
    public fun test_print_board() {
        use std::debug;
        // Create a dummy TxContext and address for testing
        let ctx = tx_context::dummy();
        // Create a State
        let game_state_obj = TicTacToeState {
            id: object::new(&mut ctx),
            count: 0,
            state_score:vector[],
        };

        let game_data = createNewGameNFT(game_state_obj.count, &mut ctx);
        print_board(&game_data);

        let dummy_address = @0xCAFE;
        transfer::transfer(game_data, dummy_address);
        transfer::transfer(game_state_obj, dummy_address);
    }

    /// check game board location can move
    fun allowed_moves(game_nft:&GameNFT):vector<vector<u8>>{
        use std::debug;
        let board = game_nft.board;
        let can_moves: vector<vector<u8>> = vector[];
        let i = 0;
        while (i < 9) {
            let piece = *vector::borrow(&board, i);
            if (piece == 0) {
                let can_move = board;
                // debug::print(&can_move);
                vector::append(&mut can_move, vector[game_nft.turn]);
                vector::swap_remove(&mut can_move, i);
                // debug::print(&can_move);
                vector::push_back(&mut can_moves, can_move);
            };
            i = i + 1;
        };
        can_moves
    }
    #[test]
    fun test_allowed_moves(){
        use std::debug;
        // Create a dummy TxContext and address for testing
        let ctx = tx_context::dummy();
        // Create a State
        let game_state_obj = TicTacToeState {
            id: object::new(&mut ctx),
            count: 0,
            state_score:vector[],
        };

        let game_data = createNewGameNFT(game_state_obj.count, &mut ctx);
        
        game_data.turn = GameAgent;
        let can_moves = allowed_moves(&game_data);
        debug::print(&can_moves);

        let dummy_address = @0xCAFE;
        transfer::transfer(game_data, dummy_address);
        transfer::transfer(game_state_obj, dummy_address);
    }

    /// agent select move that max score to win
    fun agent_select_move(state:&TicTacToeState,game_nft:&GameNFT,epsilon:u8):vector<u8>{
        use std::debug;
        let can_moves = allowed_moves(game_nft);
        let can_moves_idxs = state_scores_idxs(&can_moves);
        // set epsilon
        let s:vector<u8> = vector[];
        vector::append(&mut s, bcs::to_bytes(state));
        vector::append(&mut s, bcs::to_bytes(game_nft));
        let random_value = ((hash(&s) % 127) as u8);
        let result  = vector[];
        if ( random_value <= epsilon ) {
            result = state_score_select(state,SelectRandomScoreIndexs,&can_moves_idxs);
        }else{
            result = state_score_select(state,SelectMaxScoreIndexs,&can_moves_idxs);
        };
        // debug::print(&result);
        let s = ternary_to_decimal(result);
        // debug::print(&s);
        result
    }
    #[test]
    fun test_agent_select_move(){
        use std::debug;
        // Create a dummy TxContext and address for testing
        let ctx = tx_context::dummy();
        // Create a State
        let game_state_obj = TicTacToeState {
            id: object::new(&mut ctx),
            count: 0,
            state_score:vector[],
        };
        state_score_init(&mut game_state_obj);

        let game_data = createNewGameNFT(game_state_obj.count, &mut ctx);
        
        game_data.turn = GameAgent;
        let result = agent_select_move(&game_state_obj,&game_data,100);
        debug::print(&result);
        let result = agent_select_move(&game_state_obj,&game_data,1);
        debug::print(&result);
        let result = agent_select_move(&game_state_obj,&game_data,100);
        debug::print(&result);
        let result = agent_select_move(&game_state_obj,&game_data,1);
        debug::print(&result);

        let dummy_address = @0xCAFE;
        transfer::transfer(game_data, dummy_address);
        transfer::transfer(game_state_obj, dummy_address);
    }

    /// return winner
    /// 0:Tie,GamePlayer,GameAgent
    const UnknowWhoWin: u8 = 0u8;
    fun check_winner(board_state:vector<u8>):u8{
        let win_state_idxs = vector[
            vector[0,1,2],
            vector[3,4,5],
            vector[6,7,8],
            vector[0,3,6],
            vector[1,4,7],
            vector[2,5,8],
            vector[0,4,8],
            vector[2,4,6],
        ];
        let i = 0;
        while (i < vector::length(&win_state_idxs)) {
            let win_state_idx = *vector::borrow(&win_state_idxs, i);
            let win_state = vector[
                *vector::borrow(&board_state, *vector::borrow(&win_state_idx, 0)),
                *vector::borrow(&board_state, *vector::borrow(&win_state_idx, 1)),
                *vector::borrow(&board_state, *vector::borrow(&win_state_idx, 2)),
            ];
            if (win_state == vector[GameAgent,GameAgent,GameAgent]) {
                return GameAgent
            } else if (win_state == vector[GamePlayer,GamePlayer,GamePlayer]) {
                return GamePlayer
            };
            i = i + 1;
        };
        UnknowWhoWin
    }

    #[test]
    public fun test_check_winner(){
        use std::debug;
        let board_state = vector[0,0,0,0,0,0,0,0,0];
        let winner = check_winner(board_state);
        debug::print(&winner);
        assert!(winner == 0, 1);

        let board_state = vector[1,1,1,0,0,0,0,0,0];
        let winner = check_winner(board_state);
        debug::print(&winner);
        assert!(winner == GameAgent, 1);

        let board_state = vector[2,2,2,0,0,0,0,0,0];
        let winner = check_winner(board_state);
        debug::print(&winner);
        assert!(winner == GamePlayer, 1);

        let board_state = vector[0,0,0,1,1,1,0,0,0];
        let winner = check_winner(board_state);
        debug::print(&winner);
        assert!(winner == GameAgent, 1);

        let board_state = vector[0,0,0,2,2,2,0,0,0];
        let winner = check_winner(board_state);
        debug::print(&winner);
        assert!(winner == GamePlayer, 1);

        let board_state = vector[0,0,0,0,0,0,1,1,1];
        let winner = check_winner(board_state);
        debug::print(&winner);
        assert!(winner == GameAgent, 1);

        let board_state = vector[0,0,0,0,0,0,2,2,2];
        let winner = check_winner(board_state);
        debug::print(&winner);
        assert!(winner == GamePlayer, 1);

        let board_state = vector[1,0,0,1,0,0,1,0,0];
        let winner = check_winner(board_state);
        debug::print(&winner);
        assert!(winner == GameAgent, 1);

        let board_state = vector[2,0,0,2,0,0,2,0,0];
        let winner = check_winner(board_state);
        debug::print(&winner);
        assert!(winner == GamePlayer, 1);

        let board_state = vector[0,1,0,0,1,0,0,1,0];
        let winner = check_winner(board_state);
        debug::print(&winner);
        assert!(winner == GameAgent, 1);
    }
    
    /// valid player select move
    /// 0:can not move,1:can move state,2:game over
    const CanNotMove: u8 = 0u8;
    const CanMove: u8 = 1u8;
    const NoPositionMove: u8 = 2u8;
    fun valid_move(game_nft:&GameNFT,next_move_state:vector<u8>):u8{
        use std::debug;
        let allowed_moves = allowed_moves(game_nft);
        if (vector::length(&allowed_moves) == 0) {
            return NoPositionMove
        };
        if (vector::contains(&allowed_moves, &next_move_state)){
            return CanMove
        };
        CanNotMove
    }

    const GameActive: u8 = 0u8;
    const GameTie: u8 = 1u8;
    const GamePlayerWin: u8 = 2u8;
    const GamePlayerLose: u8 = 3u8;
    fun make_move(state:&mut TicTacToeState,game_nft:&mut GameNFT,next_move_state:vector<u8>,ctx: &mut TxContext){
        use std::debug;
        let next_board_state = fill_teranry(next_move_state,9u64);
        let vms = valid_move(game_nft,next_board_state);
        if (vms==CanMove){
            let st_board = game_nft.board;
            // can move to next_move_state
            game_nft.board = next_board_state;
            let winner = check_winner(next_board_state);
            if (winner == GameAgent) {
                game_nft.state = GamePlayerLose;
                game_nft.turn = GameNoOnePlay;
                //agent_win,agent get reward
                rewards(state,st_board,game_nft.board,100,GetReward);
            } else if (winner == GamePlayer) {
                game_nft.state = GamePlayerWin;
                game_nft.wins=game_nft.wins+1;
                game_nft.turn = GameNoOnePlay;
                //agent_win,agent get reward
                rewards(state,st_board,game_nft.board,0,GetReward);
            } else {
                // unknown who win
                if (vector::length(&allowed_moves(game_nft))==0) {
                    // game is tie
                    game_nft.state = GameTie;
                    game_nft.turn = GameNoOnePlay;
                    
                    //agent_win,agent get reward
                    rewards(state,st_board,game_nft.board,50,GetReward);
                } else {
                    // game is active
                    game_nft.state = GameActive;
                    if (game_nft.turn == GameAgent) {
                        game_nft.turn = GamePlayer;
                    } else if (game_nft.turn == GamePlayer) {
                        game_nft.turn = GameAgent;
                    };
                };
            }
        };

        // debug::print(game_nft);
        if (game_nft.turn == GameNoOnePlay){
            emit(Outcome {
                game_id:game_nft.game_id,
                round:game_nft.round,
                wins:game_nft.wins,
                state:game_nft.state,
                board:game_nft.board,
            });
            
            // create next game
            let id = object::new(ctx);
            game_nft.game_id = object::uid_to_inner(&id);
            game_nft.round=game_nft.round+1;
            // new game init turn is agent  
            game_nft.turn = GameAgent;
            game_nft.board = vector[0,0,0,0,0,0,0,0,0];
            let agent_move = agent_select_move(state,game_nft,12);
            game_nft.board = fill_teranry(agent_move,9u64);
            game_nft.turn = GamePlayer;
            object::delete(id);

            emit(NewGame {
                game_id: game_nft.game_id,
                round: game_nft.round,
                player: tx_context::sender(ctx),
                board: game_nft.board,
            });
        };
    }
    
    // set rewards
    const GetReward: u8 = 0u8;
    const GetPenalty: u8 = 1u8;
    public fun rewards(state:&mut TicTacToeState,st_board:vector<u8>,next_board:vector<u8>,reward:u8,get_flag:u8){
        use std::debug;
        let st_idx = ternary_to_decimal(st_board);
        let next_board_value = *vector::borrow(&mut state.state_score,ternary_to_decimal(next_board));
        let st_value = vector::borrow_mut(&mut state.state_score,st_idx);
      
        // debug::print(&(*st_value));
        // debug::print(&next_board_value);
        // debug::print(&reward);
        // Q(St,At)<-Q(St,At)+a*(Rt+Q(S_t+1,A_t+1)-Q(St,At))
        if (get_flag==GetReward){
            if ((reward+next_board_value)<*st_value){
                *st_value = 0;
            }else{
                *st_value = *st_value+(reward+next_board_value-*st_value)/2;
            }
        }else if (get_flag==GetPenalty){
            *st_value = *st_value+(next_board_value-*st_value-reward)/2;
        };
        // debug::print(&(*st_value));
    }

    #[test]
    public fun test_rewards(){
        use std::debug;
        let ctx = tx_context::dummy();
        let game_state_obj = TicTacToeState {
            id: object::new(&mut ctx),
            count: 0,
            state_score:vector[],
        };
        state_score_init(&mut game_state_obj);
        let st_board = vector[0,0,0,0,0,0,0,0,0];
        let next_board = vector[1,0,0,0,0,0,0,0,0];
        let reward = 50;
        rewards(&mut game_state_obj,st_board,next_board,reward,GetReward);
        // debug::print(&game_state_obj.state_score);

        let dummy_address = @0xCAFE;
        transfer::transfer(game_state_obj, dummy_address);
    }

    // play tic-tac-toe game
    entry public fun play(state:&mut TicTacToeState,game_nft:&mut GameNFT,player_move:vector<u8>,ctx: &mut TxContext){
        let sender = tx_context::sender(ctx);
        emit(GameView {
            game_id: game_nft.game_id,
            round: game_nft.round,
            state: game_nft.state,
            player: tx_context::sender(ctx),
            board: player_move,
            turn: game_nft.turn,
        });
        let st_board = game_nft.board;
        // player move
        make_move(state,game_nft,player_move,ctx);
        // agent move
        if (game_nft.turn == GameAgent) {
            //player move pass,and not win
            rewards(state,st_board,game_nft.board,50,GetReward);

            // agent play
            let agent_move = agent_select_move(state,game_nft,12);
            emit(GameView {
                game_id: game_nft.game_id,
                round: game_nft.round,
                state: game_nft.state,
                player: tx_context::sender(ctx),
                board: agent_move,
                turn: game_nft.turn,
            });
            make_move(state,game_nft,agent_move,ctx);
        };
    }

    #[test]
    public fun test_play() {
        use std::debug;
        // Create a dummy TxContext and address for testing
        let ctx = tx_context::dummy();
        // Create a State
        let game_state_obj = TicTacToeState {
            id: object::new(&mut ctx),
            count: 0,
            state_score:vector[],
        };
        state_score_init(&mut game_state_obj);

        let game_data = createNewGameNFT(game_state_obj.count, &mut ctx);
        game_data.turn = GameAgent;
        let player_move = vector[0,0,0,0,0,0,0,0,0];

        debug::print(&game_data);
        play(&mut game_state_obj,&mut game_data,player_move,&mut ctx);
        debug::print(&game_data);

        let dummy_address = @0xCAFE;
        transfer::transfer(game_data, dummy_address);
        transfer::transfer(game_state_obj, dummy_address);
    }

    #[test]
    public fun test_many_play() {
        use std::debug;
        // Create a dummy TxContext and address for testing
        let ctx = tx_context::dummy();
        // Create a State
        let state = TicTacToeState {
            id: object::new(&mut ctx),
            count: 0,
            state_score:vector[],
        };
        state_score_init(&mut state);

        let game_nft = createNewGameNFT(state.count, &mut ctx);
        game_nft.round = game_nft.round+1;
        game_nft.turn = GameAgent;
        let agent_move = agent_select_move(&state,&game_nft,0u8);
        game_nft.board = fill_teranry(agent_move,9u64);
        game_nft.turn = GamePlayer;

        let i = 10000;
        while (i>0){
            debug::print(&i);
            let player_move = agent_select_move(&state,&game_nft,127u8);
            // debug::print(&player_move);
            print_board(&game_nft);
            play(&mut state,&mut game_nft,player_move,&mut ctx);
            debug::print(&game_nft.wins);
            debug::print(&game_nft.round);
            i=i-1;
        };

        let game_nft2 = createNewGameNFT(state.count, &mut ctx);
        game_nft2.round = game_nft2.round+1;
        game_nft2.turn = GameAgent;
        let agent_move = agent_select_move(&state,&game_nft2,0u8);
        game_nft2.board = fill_teranry(agent_move,9u64);
        game_nft2.turn = GamePlayer;
        let i = 2000;
        while (i>0){
            let player_move = agent_select_move(&state,&game_nft2,127u8);
            if (i < 20) {
                print_board(&game_nft2);
            };
            debug::print(&player_move);
            play(&mut state,&mut game_nft2,player_move,&mut ctx);
            i=i-1;
            if (i < 20) {
                print_board(&game_nft2);
            };
            debug::print(&i);
        };
        debug::print(&game_nft2);
        debug::print(&game_nft);
        
        let dummy_address = @0xCAFE;
        transfer::transfer(game_nft, dummy_address);
        transfer::transfer(game_nft2, dummy_address);
        transfer::transfer(state, dummy_address);
    }

    /// Only ternary sequences can be received
    /// let ternary = vector[2,2,2,2,2,2,2,2,2];
    /// let decimal:u64 = ternary_to_decimal(y);
    /// debug::print(&decimal);
    /// [debug] 19682
    const OnlyTernarySequencesSupport: u64 = 2223;
    fun ternary_to_decimal(v: vector<u8>): u64 {
        let result: u64 = 0;
        let len = vector::length(&v);
        let i = 0;
        while (i < len) {
            let digit = (*vector::borrow(&v, i) as u64);
            assert!(digit <= 2, OnlyTernarySequencesSupport); 
            result = (result * 3) + digit; 
            i = i + 1;
        };
        result  
    }

    #[test]
    public fun test_ternary_to_decimal() {
        use std::debug;
        let y = vector[2,2,2,2,2,2,2,2,2];
        let xxx:u64 = ternary_to_decimal(y);
        debug::print(&xxx);
        let yz = vector[2,2,2,2,2,2,2,2,1];
        let xxxz:u16 = (ternary_to_decimal(yz) as u16);
        debug::print(&xxxz);
    }

    /// decimal to ternary sequences
    /// let result = decimal_to_ternary(19682);
    /// assert!(result == vector[2,2,2,2,2,2,2,2,2], 1);
    fun decimal_to_ternary(num: u64): vector<u8> { 
        let result = vector[];
        while (num > 0) {
            let digit = ((num % 3) as u8);
            vector::push_back(&mut result, digit);
            num = num / 3;
        };
        vector::reverse(&mut result);
        result
    }
    
    const FillTeranryError: u64 = 10u64;
    fun fill_teranry(teranry:vector<u8>,fill:u64):vector<u8>{
        use std::debug;
        let length = vector::length(&teranry);
        assert!(length <= fill,FillTeranryError);
        let num = fill-length;
        // debug::print(&num);
        while (length>0 && num > 0) {
            vector::insert(&mut teranry, 0,0);
            num = num -1;
        };
        teranry
    }

    #[test]
    public fun test_decimal_to_ternary() {
        use std::debug;
        
        let num = 3;
        let result = decimal_to_ternary(num);
        debug::print(&result);
        assert!(result == vector[1,0], 1);
        let result2 = fill_teranry(result,9u64);
        assert!(result2 == vector[0,0,0,0,0,0,0,1,0], 1);

        let num = 19682;
        let result = decimal_to_ternary(num);
        debug::print(&result);
        assert!(result == vector[2,2,2,2,2,2,2,2,2], 1);

        let num = 19628889990321312;
        let result = decimal_to_ternary(num);
        debug::print(&result);
        assert!(result == vector[1,0,1,1,2,1,0,0,0,0,2,0,1,0,1,2,0,0,0,0,2,1,2,1,2,0,0,2,2,2,2,0,0,0,0], 1); 
    }

    /// quickpow impl pow
    const QuickPowOverstepTheBound: u64 = 2049;
    fun  quickpow(base: u8, exp: u8): u256 {
        use std::debug;
        assert!(exp<=127, QuickPowOverstepTheBound);
        let result = 1;
        let tBase = (base as u256);
        let texp = (exp as u256);
        while (texp > 0) {
            assert!(tBase <= 340282366920938463463374607431768211455, QuickPowOverstepTheBound);
            if (texp % 2 == 1) {
                result = result * tBase;
            };
            tBase = tBase * tBase;
            texp = texp / 2;
        };
        result
    }
    
    #[test]
    public fun test_quickpow(){
        use std::debug;

        let result = quickpow(2, 3);
        debug::print(&result);
        assert!(result == 8, 1);
        let result = quickpow(2, 4);
        debug::print(&result);
        assert!(result == 16, 1);
        let result = quickpow(2, 5);
        debug::print(&result);
        assert!(result == 32, 1);
        let result = quickpow(2, 6);
        debug::print(&result);
        assert!(result == 64, 1);
        let result = quickpow(2, 7);
        debug::print(&result);
        assert!(result == 128, 1);
        let result = quickpow(2, 8);
        debug::print(&result);
        assert!(result == 256, 1);
        let result = quickpow(2, 9);
        debug::print(&result);
        assert!(result == 512, 1);
        let result = quickpow(2, 10);
        debug::print(&result);
        assert!(result == 1024, 1);
        let result = quickpow(2, 11);
        debug::print(&result);
        assert!(result == 2048, 1);
        let result = quickpow(2, 12);
        debug::print(&result);
        assert!(result == 4096, 1);
        let result = quickpow(2, 13);
        debug::print(&result);
        assert!(result == 8192, 1);
        let result = quickpow(2, 14);
        debug::print(&result);
        assert!(result == 16384, 1);
        let result = quickpow(2, 15);
        debug::print(&result);
        assert!(result == 32768, 1);
        let result = quickpow(2, 16);
        debug::print(&result);
        assert!(result == 65536, 1);
        let result = quickpow(2, 17);
        debug::print(&result);
        assert!(result == 131072, 1);

        let result = quickpow(3, 3);
        debug::print(&result);
        assert!(result == 27, 1);
        let result = quickpow(3, 4);
        debug::print(&result);
        assert!(result == 81, 1);
        let result = quickpow(3, 5);
        debug::print(&result);
        assert!(result == 243, 1);
        let result = quickpow(3, 6);
        debug::print(&result);
        assert!(result == 729, 1);
        let result = quickpow(3, 7);
        debug::print(&result);
        assert!(result == 2187, 1);
        let result = quickpow(3, 8);
        debug::print(&result);
        assert!(result == 6561, 1);
        let result = quickpow(3, 9);
        debug::print(&result);
        assert!(result == 19683, 1);
        let result = quickpow(3, 10);
        debug::print(&result);
        assert!(result == 59049, 1);

        let result = quickpow(4, 3);
        debug::print(&result);
        assert!(result == 64, 1);
        let result = quickpow(4, 4);
        debug::print(&result);
        assert!(result == 256, 1);
        let result = quickpow(4, 5);
        debug::print(&result);
        assert!(result == 1024, 1);
        let result = quickpow(4, 6);
        debug::print(&result);
        assert!(result == 4096, 1);
        let result = quickpow(4, 7);
        debug::print(&result);
        assert!(result == 16384, 1);
        let result = quickpow(4, 8);
        debug::print(&result);
        assert!(result == 65536, 1);
        let result = quickpow(4, 9);
        debug::print(&result);
        assert!(result == 262144, 1);

        let result = quickpow(5, 0);
        debug::print(&result);
        assert!(result == 1, 1);

        // power(a, 2n+1) => a * power(a, 2n)
        let result = quickpow(2,127);
        debug::print(&result);
        assert!(result == 2*quickpow(2,126), 1);

    }

    #[test]
    public fun test_some_code() {
        use std::debug;
        let v = vector::empty<u8>();
        vector::push_back(&mut v, 0);
        vector::push_back(&mut v, 1);
        let x = *vector::borrow(&v, 0);

        debug::print(&x);

        let y = b"222222222";
        let yy:u64 =( *vector::borrow(&y,1) as u64);

        let x = x<<1<<1;
        debug::print(&yy);
        debug::print(&y);

        vector::append(&mut y, b"1");
        vector::swap_remove(&mut y, 8);
        debug::print(&y);
        
        let  x = vector::borrow_mut(&mut y,8);
        *x = *vector::borrow(&b"2",0);
        debug::print(&y);

        let  z = vector::borrow_mut(&mut y,8);
        *z = *vector::borrow(&b"3",0);
        *z =*z+2;
        debug::print(&y);
    }
}
