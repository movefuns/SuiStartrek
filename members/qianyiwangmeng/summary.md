# 学习成果

## Roadmap 1
- 发布的Coin地址: 0x0f39a7b8ce1522ebcb7cd7a7419618805cb37ba425169751af549e132e4866b1
## Roadmap 2

- 发布的Nft地址: 0x5554da001ac9469fce157d198222344bd6515fc915b0bea3197b6dcb8445ef9c
- 铸造的 头像 nft id地址:  0xaff2c364350d469fa766df24bb615975e6c3f08b6b17bf1d543fe2d337677416




新建一个tnft包，在source下新建tnft.move文件

```
module tnft::nft{
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
}
```

切换到主网发布后，找到合约地址，mint调用的地址填share的地址，name 填自己的id即可。
Immutable不可变的是 合约地址， 在这里不但可以看见代码 还可以看见各种交易。