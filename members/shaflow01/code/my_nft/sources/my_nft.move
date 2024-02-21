module my_nft::my_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct MinterCap has key{
        id: UID,
    }


    struct NFT has key, store {
        id: UID,

        name: string::String,

        description: string::String,

        url: Url,

    }



    struct NFTMinted has copy, drop {

        object_id: ID,

        name: string::String,
    }

    fun init(ctx:&mut TxContext){
        transfer::transfer(MinterCap {
            id: object::new(ctx)
        }, tx_context::sender(ctx));
    }


    public fun name(nft: &NFT): &string::String {
        &nft.name
    }

    public fun description(nft: &NFT): &string::String {
        &nft.description
    }

    public fun url(nft: &NFT): &Url {
        &nft.url
    }

    public entry fun mint_to_sender(
        _: &MinterCap,
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }


    public entry fun transfer(
        nft: NFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }


    public entry fun update_description(
        nft: &mut NFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }


    public entry fun burn(nft: NFT, _: &mut TxContext) {
        let NFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }
}
