module ezgame::ezToken {
    use std::option;
    use sui::transfer;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::{Self, TxContext};

    struct EZGAME has drop {}

    fun init(witness: EZGAME, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<EZGAME>(
            witness,
            9,
            b"EZGAME",
            b"",
            b"",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<EZGAME>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<EZGAME>, coin: Coin<EZGAME>) {
        coin::burn(treasury_cap, coin);
    }
}