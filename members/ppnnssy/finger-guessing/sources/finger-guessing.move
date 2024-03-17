module finger_guessing::finger_guessing{
    // use sui::object::{UID};
    use sui::tx_context;
    use sui::tx_context::{TxContext};
    use sui::clock;
    use sui::clock::Clock;
    use sui::event::emit;

    // ===== Const =====
    const STONE:u64 = 0;
    const SCISSORS:u64 = 1;
    const CLOTH:u64 = 2;

    // ======Error======
    const EChoseTypeErr:u64 = 1;


    // struct Card has key,store {
    //     id: UID,
    //     type:u64,
    // }

    // ======== Events =========
    struct RoundResult has copy,drop {
      player:address,
      player_chose:u64,
      contract_chose:u64,
      // 0-输 1-赢 2-和
      result:u64,
    }
    // 1-石头 2-剪刀 3-布
    public entry fun make_chose(clock: &Clock, chose_type:u64,ctx:&mut TxContext){
      let sender= tx_context::sender(ctx);
      assert!(chose_type == STONE || chose_type == SCISSORS || chose_type == CLOTH, EChoseTypeErr);

      // 合约随机出
      let r_type = random_type(clock);

      // 结算
      let res:u64;
      if(chose_type == r_type){
        res = 2;
      }else if(
        (chose_type == SCISSORS && r_type == STONE) || (chose_type == STONE && r_type == CLOTH) || (chose_type == CLOTH && r_type == SCISSORS) 
      ){
        res = 0;
      }else if(
        (chose_type == CLOTH && r_type == STONE) || (chose_type == STONE && r_type == SCISSORS) || (chose_type == SCISSORS && r_type == CLOTH) 
      ){
        res = 1;
      }else{
        res = 2;
      };

      emit(RoundResult{
        player:sender,
        player_chose:chose_type,
        contract_chose:r_type,
        result:res,
      })
    }

    
    fun random_type(clock: &Clock) :(u64){
        let ms = clock::timestamp_ms(clock);
        let type = ms % 3;
        (type)
    }
}