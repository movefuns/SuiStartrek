module flynft::flynft {
    use sui::url::{Self, Url};
    use std::string::{utf8, Self};
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct FlyNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    struct FlyMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public fun name(nft: &FlyNFT): &string::String {
        &nft.name
    }

    public fun description(nft: &FlyNFT): &string::String {
        &nft.description
    }

    public fun url(nft: &FlyNFT): &Url {
        &nft.url
    }

    public fun mint_to_sender(
        ctx: &mut TxContext
    ) {
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/144767381?v=4");
        let name = utf8(b"CU5T0MPEONFT");
        let description = utf8(b"github:cu5t0mpeo");
        let sender = tx_context::sender(ctx);
        let nft = FlyNFT {
            id: object::new(ctx),
            name: name,
            description: description,
            url: url,
        };

        event::emit(FlyMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public fun transfer(
        nft: FlyNFT, recipient: address, _:&mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    public fun update_description(
        nft: &mut FlyNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    public fun burn(nft: FlyNFT, _: &mut TxContext) {
        let FlyNFT { id, name: _, description: _, url: _} = nft;
        object::delete(id)
    }
}