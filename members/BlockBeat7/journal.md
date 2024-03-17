第一阶段Journal
配置sdk  
macOS环境  
```curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh```  
用sui -verison检查  

vscode环境  
```cargo install --git https://github.com/movebit/move --branch move-analyzer2-release move-analyzer```  
这里可能会连不上github，建议用微软自带的直接install  

sui编程，在vscode中进行  
```md myFirstTask```  
```sui move new myFirstTask```  

智能合约部分  
// Copyright (c) 2022, Sui Foundation
// SPDX-License-Identifier: Apache-2.0

/// A basic Hello World example for Sui Move, part of the Sui Move intro course:
/// https://github.com/sui-foundation/sui-move-intro-course
/// 
module hello_world::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// An object that contains an arbitrary string
    struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }


    #[lint_allow(self_transfer)]
    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }

}

注意点：修改rev，部署在testnet上，注意包名以及version的对应关系  
Client/Server api version mismatch, client api version : 1.19.0, server api version : 1.18.1  
版本号问题  

编译并部署  
```sui move build```
```sui client publis --gas-budget 100000000```

最终可以得到  
https://suiexplorer.com/txblock/3NM5pgZjvKWQWgTmmdxoW8eRj2dG1VBzhnpnoX9h859B?network=testnet  
在测试网上成功部署智能合约  

第二阶段Journal
1.部署NFT
```  
module stomnft::stomnft{
    use sui::tx_context::{sender, TxContext};
    use std::string::{utf8, String};
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::package;
    use sui::display;

    struct StomNFT has key, store {
        id: UID,
        name:String,
        description:String,
        image_url:String,
        tokenId: u64
    }

    struct STOMNFT has drop {}

    struct State has key {
        id: UID,
        count: u64
    }

    #[allow(unused_function)]
    fun init(witness: STOMNFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"{image_url}"),
            utf8(b"{description}"),
        ];

        let publisher = package::claim(witness, ctx);

        let display = display::new_with_fields<StomNFT>(
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
    public entry fun mint(state: &mut State,name:String,description:String,image_url:String, ctx: &mut TxContext){
        state.count = state.count + 1;
        let nft = StomNFT { 
            id:object::new(ctx),
            name:name,
            description:description,
            image_url:image_url,
            tokenId:state.count
        };
        transfer::public_transfer(nft,sender(ctx));
    }
}
```

这里有一个注意点  
failed to resolve，解析依赖失败，检查sui环境无误，在和群里老哥沟通后使用全局代理，再次部署成功
```sui move build```
build完成之后进行mint  
```sui client call --package 0x08319b92f529ce43d8fc796dbe879336fc7c67e28d3c7f5dc99087d2ef50b67c --module stomnft --function mint --args 0xf9071210aa73f66e42deaf8bd7825f0d5154d3fb4a9476b17af76e0fa1ebfe52 --gas-budget 10000000```  
最终成功部署
ObjectID: 0xf9071210aa73f66e42deaf8bd7825f0d5154d3fb4a9476b17af76e0fa1ebfe52  

2.部署一个石头剪刀布的游戏  
用到两个东西，一个是random，一个是构建游戏
```  
module sicbogame::random{
    use std::hash;
    use std::vector;

    use sui::bcs;
    use sui::object;
    use sui::tx_context::TxContext;
    
    const ERR_HIGH_ARG_GREATER_THAN_LOW_ARG: u64 = 101;

    fun seed(ctx: &mut TxContext): vector<u8> {
        let ctx_bytes = bcs::to_bytes(ctx);
        let uid = object::new(ctx);
        let uid_bytes: vector<u8> = object::uid_to_bytes(&uid);
        object::delete(uid);

        let info: vector<u8> = vector::empty<u8>();
        vector::append<u8>(&mut info, ctx_bytes);
        vector::append<u8>(&mut info, uid_bytes);

        let hash: vector<u8> = hash::sha3_256(info);
        hash
    }

    fun bytes_to_u64(bytes: vector<u8>): u64 {
        let value = 0u64;
        let i = 0u64;
        while (i < 8) {
            value = value | ((*vector::borrow(&bytes, i) as u64) << ((8 * (7 - i)) as u8));
            i = i + 1;
        };
        return value
    }

    /// Generate a random u64
    fun rand_u64_with_seed(_seed: vector<u8>): u64 {
        bytes_to_u64(_seed)
    }

    /// Generate a random integer range in [low, high).
    fun rand_u64_range_with_seed(_seed: vector<u8>, low: u64, high: u64): u64 {
        assert!(high > low, ERR_HIGH_ARG_GREATER_THAN_LOW_ARG);
        let value = rand_u64_with_seed(_seed);
        (value % (high - low)) + low
    }

    /// Generate a random u64
    public fun rand_u64(ctx: &mut TxContext): u64 {
        rand_u64_with_seed(seed(ctx))
    }

    /// Generate a random integer range in [low, high).
    public fun rand_u64_range(low: u64, high: u64, ctx: &mut TxContext): u64 {
        rand_u64_range_with_seed(seed(ctx), low, high)
    }


}
```
接下来进行游戏
```
module sicbogame::sicbogame{
    use std::vector;
    use sui::event;
    use sui::tx_context::{ TxContext};
    use std::string;
    use sicbogame::random;

    const ERROR_INPUT_NUM :u64 = 1;

    struct Result has copy,drop {
        msg: string::String
    }


    public entry fun create_game(input_num: u64, ctx: &mut TxContext){

        assert!((input_num != 1 || input_num !=0), ERROR_INPUT_NUM);

        let dice1 = random::rand_u64_range(1, 6, ctx);
        let dice2 = random::rand_u64_range(1, 6, ctx);
        let dice3 = random::rand_u64_range(1, 6, ctx);
        let dice = dice1 + dice2 + dice3;

        let resp;

        if (input_num == 0) {
            if (dice >= 4 && dice <= 10) {
                resp = b"You Win :)";
            } else {
                resp = b"You Lose :(";
            }
        }
        else if (input_num == 1) {
            if (dice >= 11 && dice <= 17) {
                resp = b"You Win :)";
            } else {
                resp = b"You Lose :(";
            }
        } else {
            resp = b"Invalid input number";
        };
 
        event::emit(Result{msg: string::utf8(resp)});
    }


    #[test_only]
    public fun test_game(ctx: &mut TxContext) {
        let input_num = 0;
        create_game(input_num,ctx);
    }

}
```

ObjectID: 0x79d85e5844cd125a42f076e2329d1aee43f06f5ed84aac3b4753ae71f89c76e2     

