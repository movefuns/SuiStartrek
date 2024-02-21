module hello::mycoin {
    use sui::coin;
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use std::option;

    struct MYCOIN has drop {}

    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        // create a new coin
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"MYC",
            b"My Coin",
            b"Hello Coin",
            option::none(),
            ctx
        );
        // mint
        let c = coin::mint(&mut treasury, 1000000, ctx);
        transfer::public_transfer(c, tx_context::sender(ctx));
        // transfer the treasury to the sender
        transfer::public_transfer(treasury, tx_context::sender(ctx));
        // freeze the metadata
        transfer::public_freeze_object(metadata);
    }
}