module ezgame::account{
    use sui::transfer;
    use sui::table::{Self, Table};
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    /*          Define Struct       */
    struct Account has key, store {
        id: UID,
        ez_coin: u256,
    }

    /*         Define varible       */
    const AccountExist: u64 = 33;
    
    /*         Define function      */
    fun init(ctx: &mut TxContext) {
        let accounts = table::new<address, Account>(ctx);
        transfer::public_share_object(accounts);
    }

    public fun createEzAccount(accounts: &mut Table<address, Account>, ctx: &mut TxContext) {
        assert!(existAccount(tx_context::sender(ctx), accounts) == true, AccountExist);
        table::add(accounts, tx_context::sender(ctx), Account{id: object::new(ctx), ez_coin: 0})
    }

    public fun existAccount(account: address, accounts: &mut Table<address, Account>): bool {
        return table::contains(accounts, account)
    }
}