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
