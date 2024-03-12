module gametask::rock_paper_scissors {
    use std::vector;
    use sui::event;
    use sui::tx_context::{ TxContext};
    use std::string;
    use gametask::random;

    const ERROR_INPUT_NUM: u64 = 1;

    struct Result has copy, drop {
        msg: string::String
    }

    public entry fun play_game(player_choice: u64, ctx: &mut TxContext) {
        assert!((player_choice >= 0 && player_choice <= 2), ERROR_INPUT_NUM);
        /// 0 means rock, 1 means paper, 2 means scissors
        let computer_choice = random::rand_u64_range(0, 3, ctx);

        let result_msg;
        
        if (player_choice == computer_choice) {
            result_msg = b"It's a tie";
        } else if ((player_choice == 0 && computer_choice == 2) ||
                  (player_choice == 1 && computer_choice == 0) ||
                  (player_choice == 2 && computer_choice == 1)){
            result_msg = b"You Win!";
        } else {
            result_msg = b"You Lose";
        };

        event::emit(Result{msg: string::utf8(result_msg)});  
     }

    #[test_only]
    public fun test_game(ctx: &mut TxContext) {
        let player_choice = 0; // 0 for Rock, 1 for Paper, 2 for Scissors
        play_game(player_choice, ctx);
    }
}