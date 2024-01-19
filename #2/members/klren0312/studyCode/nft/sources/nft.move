module nft::nft_test {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct NftTest has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        image_url: Url,

    }

    struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public fun name(nft: &NftTest): &string::String {
        &nft.name
    }

    public fun description(nft: &NftTest): &string::String {
        &nft.description
    }

    public fun image_url(nft: &NftTest): &Url {
        &nft.image_url
    }

    fun mint_to_sender (
        name: vector<u8>,
        description: vector<u8>,
        image_url: vector<u8>,
        ctx: &mut TxContext
    ): NftTest {
        let sender = tx_context::sender(ctx);
        let nft = NftTest {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            image_url: url::new_unsafe_from_bytes(image_url)
        };
        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name
        });

        nft
    }

    public entry fun transfer(
        name: vector<u8>,
        description: vector<u8>,
        image_url: vector<u8>,
        recipient: address,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(mint_to_sender(name, description, image_url, ctx), recipient)
    }

    public entry fun update_description(
        nft: &mut NftTest,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    public entry fun burn(nft: NftTest, _: &mut TxContext) {
        let NftTest {
            id,
            name: _,
            description: _,
            image_url: _
        } = nft;
        object::delete(id)
    }
}