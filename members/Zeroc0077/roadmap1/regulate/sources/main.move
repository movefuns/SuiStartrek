module regulate::rcoin {
    use std::option;
    use sui::coin::{Self, DenyCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::deny_list::DenyList;

    struct RCOIN has drop {}

    fun init(witness: RCOIN, ctx: &mut TxContext) {
        let (treasury, denycap, metadata) = coin::create_regulated_currency(
            witness,
            6,
            b"REG",
            b"Reg Coin",
            b"Regulated Coin",
            option::none(),
            ctx
        );
        let coin = coin::mint(&mut treasury, 10000000, ctx);
        transfer::public_transfer(coin, tx_context::sender(ctx));
        transfer::public_transfer(treasury, tx_context::sender(ctx));
        transfer::public_transfer(denycap, tx_context::sender(ctx));
        transfer::public_freeze_object(metadata);
    }

    entry fun blockaccount(
        deny_list: &mut DenyList,
        deny_cap: &mut DenyCap<RCOIN>,
        account: address,
        ctx: &mut TxContext
    ) {
        coin::deny_list_add(deny_list, deny_cap, account, ctx);
    }

    entry fun unlockaccount(
        deny_list: &mut DenyList,
        deny_cap: &mut DenyCap<RCOIN>,
        account: address,
        ctx: &mut TxContext
    ) {
        coin::deny_list_remove(deny_list, deny_cap, account, ctx);
    }
}