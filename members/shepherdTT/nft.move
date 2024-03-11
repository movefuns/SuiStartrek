module mysecondtask::nft{
    use sui::tx_context::{sender, TxContext};
    use std::string::{utf8};
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::package;
    use sui::display;

    struct MyNFT has key, store {
        id: UID,
        tokenId: u64
    }

    struct NFT has drop {}

    struct State has key {
        id: UID,
        count: u64
    }

    #[allow(unused_function)]
    fun init(witness: NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
        ];

        let values = vector[
            // For `name` we can use the `.name` property
            utf8(b"shepherdTT"),
            utf8(b"https://avatars.githubusercontent.com/u/130045049?s=400&u=6200e46930940bcf706cd7577e2302651d08fb24&v=4"),
            utf8(b"猫猫虫nft"),
        ];

        let publisher = package::claim(witness, ctx);

        let display = display::new_with_fields<MyNFT>(
            &publisher, keys, values, ctx
        );

        display::update_version(&mut display);

        transfer::public_transfer(publisher, sender(ctx));
        transfer::public_transfer(display, sender(ctx));
        
        transfer::share_object(State{
            id: object::new(ctx),
            count: 0
        });
    
    }


    #[lint_allow(self_transfer)]
    public entry fun mint(state: &mut State, ctx: &mut TxContext){
        state.count = state.count + 1;
        let nft = MyNFT { 
            id:object::new(ctx),
            tokenId:state.count
        };
        transfer::public_transfer(nft,sender(ctx));
    }
}
