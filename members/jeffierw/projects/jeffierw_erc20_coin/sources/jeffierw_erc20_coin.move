module jeffierw_erc20_coin::jeffierw_erc20_coin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct JEFFIERW_ERC20_COIN has drop {}

    fun init(witness: JEFFIERW_ERC20_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"JEFFIERW_ERC20_COIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }
}