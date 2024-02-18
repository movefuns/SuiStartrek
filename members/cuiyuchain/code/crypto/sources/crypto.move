module crypto::token{

    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};


    struct TOKEN has drop{}


    fun init(witness: TOKEN,ctx: &mut TxContext){
        let (treasury_cap,metadata) = coin::create_currency<TOKEN>(witness,18,b"SULC",b"SUL COIN",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap,tx_context::sender(ctx));
    }

    public entry fun mint_and_transfer(treasury_cap: &mut TreasuryCap<TOKEN>,amount: u64,receipt: address,ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap,amount,receipt,ctx);
    }

    public entry fun burn(treasury_cap:&mut TreasuryCap<TOKEN>,coin: Coin<TOKEN>){
        coin::burn(treasury_cap,coin);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<TOKEN>,amount: u64,receipt: address,ctx: &mut TxContext){
        let new_coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(new_coin,receipt);
    }

    public entry fun transfer(coin:&mut Coin<TOKEN>,amount: u64,receipt: address,ctx: &mut TxContext){
        let new_coin = coin::split(coin,amount,ctx);
        transfer::public_transfer(new_coin,receipt);
    }

}
