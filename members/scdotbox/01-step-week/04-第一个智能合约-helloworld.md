# 智能合约 helloworld

+ 第一份智能合约从计算机界的神奇项目`helloworld`开始
+ 创建智能合约主要分为如下步骤：
    + 初始化一个 Sui Move Package
    + 创建智能合约源文件
    + 编译合约
    + 部署智能合约
    + 智能合约测试

## 1.初始化 Sui Move Package
+ 使用下面的 Sui CLI 指令来快速创建一个 Sui package 框架:
```bash
# 参考命令，sui move new <PACKAGE NAME>
# 创建 helloworld 项目
sui move new hello_world
```
+ Package 包括如下目录：
    + hello_world，项目根文件夹
    + Move.toml，配置文件
    + sources，合约源码
Move.toml 有编译和发布的网络，需要和本地网络匹配
+ todo：详细介绍这些目录及配置作用

## 2. 创建智能合约源文件
+ 源代码保存在`sources`文件夹内
+ 智能合约的源代码都是`.move`格式命名
+ 在`sources`文件夹内，创建`hello_world.move`，并修改源码如下
```rust
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

    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}
```

## 3.编译合约
```bash
# 编译命令如下
sui move build
# 注意： 
# 编译需要从 github 上下载代码并安装环境，因此最好是采用代理的方案
# 编译合约需要的时间比较长
```

## 4.部署智能合约
使用` Sui CLI` 将 package 部署到 Sui 网络，部署命令如下：
```bash
sui client publish --gas-budget 10000000
```
注意：可以选择部署到 Sui 的 devnet 开发网，testnet 测试网或者本地节点。只要将 Sui CLI 设置到对应网络，并且拥有足够支付 gas 的 tokens 即可。
结果：
```bash
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
F2NmHrgrKdfSk6e1XPyrrVVQzSn5tyh85q3VvQNxwcSr
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43                                                                                  │
│ Gas Owner: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43                                                                               │
│ Gas Budget: 10000000                                                                                                                                        │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                                                                                   │
│  │ Version: 57                                                                                                                                              │
│  │ Digest: HP6N4dus8YSFuc7KQrqw1iQijxDBRXukKTN4dQYgKV6Q                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    dCIQXqEpsZBy6+9Ub2DedN60JZfm0vw2CKMc2Ruljls0JyUeNXBfAArF20vR5Zc9diInJc9I72W+tQFsH4/2BA==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: F2NmHrgrKdfSk6e1XPyrrVVQzSn5tyh85q3VvQNxwcSr                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 5                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa9715bd7ef6248ad65589fe3df1ed155f66ebe1858408d2e062e79abec963f01                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 58                                                                                    │
│  │ Digest: JD1vqMkU2r3HsY6wRCpYRwPf7g7oMmHtyLTp3Z12wGUY                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc9355529016c2ef3c4f64178436798f1f2887c2942e807a3bc466f9b51b20ced                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: CgqZG9Dv4Z4qgHM7GUzY9rM93mLC9e3FaGmgDYKQJe6k                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 58                                                                                    │
│  │ Digest: JCpwyDHyrFZx8VzcQg2kroSMQwz7HEjxHXvXKLhCroqg                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 58                                                                                    │
│  │ Digest: JCpwyDHyrFZx8VzcQg2kroSMQwz7HEjxHXvXKLhCroqg                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7957200                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5pwyFeEJNt9duWKtxosfD5ymXW3zs6KhqWgtHPE3rMug                                                   │
│    HUKvecodFjttC4143fQ7LKpCNEwswvq8QyLJHiN8bJBg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0xa9715bd7ef6248ad65589fe3df1ed155f66ebe1858408d2e062e79abec963f01
 │ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 58
 │ Digest: JD1vqMkU2r3HsY6wRCpYRwPf7g7oMmHtyLTp3Z12wGUY
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa
 │ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 58
 │ Digest: JCpwyDHyrFZx8VzcQg2kroSMQwz7HEjxHXvXKLhCroqg
 └──

Published Objects: 
 ┌──
 │ PackageID: 0xc9355529016c2ef3c4f64178436798f1f2887c2942e807a3bc466f9b51b20ced 
 │ Version: 1 
 │ Digest: CgqZG9Dv4Z4qgHM7GUzY9rM93mLC9e3FaGmgDYKQJe6k
 | Modules: hello_world
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -7979080
 └──
```

## 5.智能合约测试
+ 在交易中调用函数，采用如下命令：
```bash
# 这里 mint 是上面智能合约定义的函数， hello_world 是上面智能合约定义的模块
sui client call --function mint --module hello_world --package $PACKAGE_ID --gas-budget 10000000
```
结果：
```bash
----- Transaction Digest ----
8mB7MPS6T1H8HPK23vMDVPBRfMojvfmwfHYFh3wxTTcA
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43                           │
│ Gas Owner: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43                        │
│ Gas Budget: 10000000                                                                                 │
│ Gas Price: 1000                                                                                      │
│ Gas Payment:                                                                                         │
│  ┌──                                                                                                 │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                            │
│  │ Version: 58                                                                                       │
│  │ Digest: JCpwyDHyrFZx8VzcQg2kroSMQwz7HEjxHXvXKLhCroqg                                              │
│  └──                                                                                                 │
│                                                                                                      │
│ Transaction Kind : Programmable                                                                      │
│ Inputs: []                                                                                           │
│ Commands: [                                                                                          │
│   MoveCall(0xc9355529016c2ef3c4f64178436798f1f2887c2942e807a3bc466f9b51b20ced::hello_world::mint()), │
│ ]                                                                                                    │
│                                                                                                      │
│                                                                                                      │
│ Signatures:                                                                                          │
│    rnouzHXqGOQ8T0Nn9lOTM3ncQaK/Y/83nJ4+tgWOwKNXXClQ2eN3hupc4z3aWvEkaXQ7LzYag0ZZusuZwII7DQ==          │
│                                                                                                      │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8mB7MPS6T1H8HPK23vMDVPBRfMojvfmwfHYFh3wxTTcA                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 5                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x86510f7a3cb4e4cfd842fc7adfe6fec32d7b200aee0cc504876695b857de5148                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 59                                                                                    │
│  │ Digest: JBGNZn5E4XVB362Ee6faQbBgL2x9XWUFwF2U6jNiSrvJ                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 59                                                                                    │
│  │ Digest: 5wSuJXiVAbCLfSReciuJh7XEPkJ47AYetSQXZuhRSedk                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 59                                                                                    │
│  │ Digest: 5wSuJXiVAbCLfSReciuJh7XEPkJ47AYetSQXZuhRSedk                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2485200                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    F2NmHrgrKdfSk6e1XPyrrVVQzSn5tyh85q3VvQNxwcSr                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x86510f7a3cb4e4cfd842fc7adfe6fec32d7b200aee0cc504876695b857de5148
 │ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )
 │ ObjectType: 0xc9355529016c2ef3c4f64178436798f1f2887c2942e807a3bc466f9b51b20ced::hello_world::HelloWorldObject 
 │ Version: 59
 │ Digest: JBGNZn5E4XVB362Ee6faQbBgL2x9XWUFwF2U6jNiSrvJ
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa
 │ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 59
 │ Digest: 5wSuJXiVAbCLfSReciuJh7XEPkJ47AYetSQXZuhRSedk
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -2507080
 └──
```
+ 可以使用 [Sui Explorer](https://explorer.sui.io/) 来察看我们刚才创建和转移的 `Hello World object` ,从右上角的下拉菜单中选择正在使用的网络。
+ 如果是采用本地网络，在 Sui Explorer 中选择 `Custom RPC URL`，并输入 `http://127.0.0.1:9000`



## 
1. [Sui 启航计划](https://github.com/movefuns/co-learn-sui/blob/main/courses/unit-1/2-syntax-of-sui-move/README.md)