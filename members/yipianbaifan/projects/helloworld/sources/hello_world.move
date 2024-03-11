module hello_world::hello_world {
    use std::ascii::{String, string};
    use sui::event;
    use sui::tx_context;

    use sui::tx_context::TxContext;

    // message
    struct Message has copy, drop {
        sender: address,
        msg: String,
    }

    // init function, publish a hello world event
    fun init(ctx: &TxContext) {
        let sender = tx_context::sender(ctx);
        event::emit(Message{sender, msg: string(b"hello_word")});
    }

    // call function, publish an event, accept parameter, publish event: hello_word: xxx
    public entry fun say_hello(hello_world: String, ctx: &TxContext) {
        let sender = tx_context::sender(ctx);
        event::emit(Message{sender, msg: hello_world});
    }
}