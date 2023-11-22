module counter::lib {

    // Part 1: Imports
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // Part 2: Struct definitions
    struct Counter has key {
        id: UID,
        value: u64,
    }
    // Part 3: transfer the counter object to the sender
    entry fun initCounter(ctx: &mut TxContext) {
        let counter_obj = Counter {
            id: object::new(ctx),
            value: 0,
        };
        // Transfer the counter object to the module/package publisher
        transfer::transfer(counter_obj, tx_context::sender(ctx));
    }

    // Part 4: Accessors required to read the struct attributes
    public entry fun incr(counter: &mut Counter): u64 {
        counter.value = counter.value+1;
        counter.value
    }

    #[test]
    public fun test_counter_create() {

        // Create a dummy TxContext for testing
        let ctx = tx_context::dummy();

        // Create a counter
        let counter_obj = Counter {
            id: object::new(&mut ctx),
            value: 3
        };

        // Check if accessor functions return correct values
        assert!(incr(&mut counter_obj) == 4, 1);


        // Create a dummy address and transfer the counter obj
        let dummy_address = @0xCAFE;
        transfer::transfer(counter_obj, dummy_address);
    }
}