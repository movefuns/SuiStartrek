module ezgame::frole{
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct FRoleNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    struct FRoleMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public fun name(nft: &FRoleNFT): &string::String {
        &nft.name
    }

    public fun description(nft: &FRoleNFT): &string::String {
        &nft.description
    }

    public fun url(nft: &FRoleNFT): &Url {
        &nft.url
    }

    public fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = FRoleNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(FRoleMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public fun transfer(
        nft: FRoleNFT, recipient: address, _:&mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    public fun update_description(
        nft: &mut FRoleNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    public fun burn(nft: FRoleNFT, _: &mut TxContext) {
        let FRoleNFT { id, name: _, description: _, url: _} = nft;
        object::delete(id)
    }
}