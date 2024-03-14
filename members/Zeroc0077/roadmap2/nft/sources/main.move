module nft::mynft {
    use sui::tx_context::{Self, TxContext};
    use sui::display;
    use sui::object::{Self, UID};
    use sui::package;
    use sui::transfer;
    use std::string::{String, utf8};

    struct MYNFT has drop {}

    struct Zeroc has key, store {
        id: UID,
        name: String
    }

    struct Counter has key {
        id: UID,
        count: u64
    }

    fun init(otw: MYNFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url")
        ];
        let values = vector[
            utf8(b"zeroc"),
            utf8(b"A sample NFT for zeroc"),
            utf8(b"https://img.zeroc0077.cn/avatar.png")
        ];
        let publisher = package::claim(otw, ctx);
        let display = display::new_with_fields<Zeroc>(&publisher, keys, values, ctx);
        display::update_version(&mut display);

        let deployer = tx_context::sender(ctx);
        transfer::public_transfer(publisher, deployer);
        transfer::public_transfer(display, deployer);
        transfer::share_object( Counter {
            id: object::new(ctx),
            count: 0
        });
    }

    public entry fun mint(counter: &mut Counter, ctx: &mut TxContext) {
        counter.count = counter.count + 1;
        let nft = Zeroc {
            id: object::new(ctx),
            name: utf8(b"zeroc")
        };
        transfer::public_transfer(nft, tx_context::sender(ctx));
    }
}