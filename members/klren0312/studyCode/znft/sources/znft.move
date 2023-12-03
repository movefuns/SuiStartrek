module znft::my_zpet {
    use sui::tx_context::{sender, TxContext};
    use std::string::{utf8, String};
    use sui::transfer;
    use sui::object::{Self, ID, UID};
    use sui::event;
    
    use sui::package::{claim};
    use sui::display;

    struct Zpet has key, store {
        id: UID,
        name: String,
        image_url: String,
        description: String
    }

    struct ZPETMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: String,
        image_url: String,
        description: String
    }

    struct MY_ZPET has drop {}

    public fun name(nft: &Zpet): &String {
        &nft.name
    }

    public fun description(nft: &Zpet): &String {
        &nft.description
    }

    public fun image_url(nft: &Zpet): &String {
        &nft.image_url
    }

    fun init (otw: MY_ZPET, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"link"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"project_url"),
            utf8(b"creator"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b""),
            utf8(b"{image_url}"),
            utf8(b"{description}"),
            utf8(b""),
            utf8(b"zcdc")
        ];

        let publisher = claim(otw, ctx);

        let display = display::new_with_fields<Zpet>(
            &publisher, keys, values, ctx
        );

        display::update_version(&mut display);

        transfer::public_transfer(publisher, sender(ctx));
        transfer::public_transfer(display, sender(ctx));
    }

    fun create_nft (
        name: String,
        image_url: String,
        description: String,
        ctx: &mut TxContext
    ): Zpet {
        let sender = sender(ctx);
        let id = object::new(ctx);
        let nft = Zpet { id, name, image_url, description };

        event::emit(ZPETMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
            image_url: nft.image_url,
            description: nft.description
        });
        nft
    }


    public entry fun transfer(
        name: String,
        image_url: String,
        description: String,
        recipient: address,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(create_nft(name, image_url, description, ctx), recipient)
    }

    public entry fun update_description(
        nft: &mut Zpet,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = utf8(new_description)
    }

    public entry fun burn(nft: Zpet, _: &mut TxContext) {
        let Zpet {
            id,
            name: _,
            image_url: _,
            description: _
        } = nft;
        object::delete(id)
    }
}