module hello_world::hello_world {
    // module codes
    // imports
    use std::string;
    use sui::object::{Self,UID};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    // types 
    struct HelloWorldObject has key,store{
        id:UID,
        // object string
        text:string::String,
    }
    // functions
    public entry fun mint(text:vector<u8>, ctx: &mut TxContext){
        let object = HelloWorldObject{
            id: object::new(ctx),
            text: string::utf8(text)
        };
        transfer::transfer(object,tx_context::sender(ctx));
    }
}