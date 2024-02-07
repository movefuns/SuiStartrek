module ezgame::game{
    use ezgame::account::{Self, Account};
    use sui::table::{Self, Table};
    

    struct GameInfo {
        isStart: bool,
        accountCount: u32,
        startTime: u256,
        endTime: u256,
        curTime: u256,
        winner: address,
    }

    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    fun init(ctx: &mut TxContext) {
        
    }
    public fun startGame(){
        
    }
    public fun endGame(){

    }
    public fun pauseGame(){

    }
    public fun dealReward(){}
    public fun joinGame(){}
    public fun getVRF(){}
    public fun getPlayerState(){}
    public fun addLife(){}
    public fun attackPlayer(){}
    public fun isWin(){}
    public fun donate(){}
    public fun curState(){}
    public fun nextState(){}
}