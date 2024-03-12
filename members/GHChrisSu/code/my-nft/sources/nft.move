module mynft::nft{
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::display;
    use sui::package;
    use std::string::utf8;
    struct NFT has drop {}

    struct GithubNFT has key,store{
        id: UID,
        tokenId: u64,
        githubName: std::ascii::String,
        image_url_prefixe: std::ascii::String,
    }


    fun init(witness: NFT, ctx:&mut TxContext){
        let keys = vector[
            utf8(b"token_id"),
            utf8(b"name"),
            utf8(b"collection"),
            utf8(b"image_url"),
            utf8(b"description")
        ];

        let values = vector[
            utf8(b"GithubNFT #{tokenId}"),
            utf8(b"Github #{githubName}"),
            utf8(b"Github Avatars Collection"),
            utf8(b"{image_url_prefixe}/{githubName}"),
            utf8(b"This is Github User {githubName} Avatar NFT")
        ];

        let publisher = package::claim(witness,ctx);
        let display = display::new_with_fields<GithubNFT>(&publisher, keys, values, ctx);
        display::update_version(&mut display);
        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));

        transfer::share_object(State{
            id: object::new(ctx),
            count: 0
        });
    
    }
    struct State has key {
        id: UID,
        count: u64
    }


    entry public fun mint( state:&mut State,github_name:std::ascii::String, ctx: &mut TxContext){
        let sender = tx_context::sender(ctx);
        state.count = state.count + 1;
        transfer::public_transfer(createGithubNFT(state.count,github_name,ctx), sender);
    }

    public fun createGithubNFT(state_count:u64,github_name:std::ascii::String, ctx: &mut TxContext): GithubNFT {
        GithubNFT {
            id: object::new(ctx),
            tokenId: state_count,
            githubName: github_name,
            image_url_prefixe: std::ascii::string(b"https://avatars.githubusercontent.com/")
        }
    }

    public entry fun update_name(nft: &mut GithubNFT,github_name:std::ascii::String) {
        nft.githubName = github_name;
    }    

    #[test]
    public fun test_create_nft() {
        use std::debug;
        // Create a dummy TxContext for testing
        let ctx = tx_context::dummy();

        // Create a State
        let state_obj = State {
            id: object::new(&mut ctx),
            count: 0
        };
        let nft:GithubNFT = createGithubNFT(state_obj.count, std::ascii::string(b"GHChrissu"), &mut ctx);

        debug::print(&nft); 
        // Check if accessor functions return correct values
        assert!(nft.githubName ==  std::ascii::string(b"GHChrissu"), 1);

        let dummy_address = @0xCAFE;
        transfer::transfer(state_obj, dummy_address);
        transfer::transfer(nft, dummy_address);
    }

}