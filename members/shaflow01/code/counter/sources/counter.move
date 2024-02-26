module counter::counter {
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};


    struct Counter has key {
        id: UID,
        owner: address,
        value: u64
    }


    public fun create(ctx: &mut TxContext) {
        transfer::share_object(Counter {
            id: object::new(ctx),
            owner: tx_context::sender(ctx),
            value: 0
        })
    }


    public fun increment(counter: &mut Counter) {
        counter.value = counter.value + 1;
    }


    public fun set_value(counter: &mut Counter, value: u64, ctx: &TxContext) {
        assert!(counter.owner == tx_context::sender(ctx), 0);
        counter.value = value;
    }
}

//CybyWU4HAShJ8VP3e3YKoKaynWHuhfW98YNTxj7QoqsQ