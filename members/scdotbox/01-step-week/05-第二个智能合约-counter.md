# 智能合约 counter

+ 在第一个智能合约 `helloworld` 基础上，修改部分源码实现如下功能
    + 任何人都可以创建一个计数器
    +修改自己的计数器中的值（自增和设置），参考 `Counter`
    ```rust
    struct Counter has xxxxxxx {
            xxxxxx
    }
    ```
+ 按照 `helloworld` 的创建和部署流程，执行 `counter`：
    + 初始化一个 Sui Move Package
    + 创建智能合约源文件
    + 编译合约
    + 部署智能合约
    + 智能合约测试

## 1.初始化一个 Sui Move Package
```bash
sui move new counter
```

## 2.创建智能合约源文件
详细 `counter` 代码如下：
```rust
module icounter::counter {
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    struct Counter has key {
        id: UID,
        value: u64,
    }

    entry public fun getCounter(ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let counter_obj = Counter {
            id: object::new(ctx),
            value: 0
        };
        transfer::transfer(counter_obj, sender);
    }

    public entry fun add(counter: &mut Counter) {
        counter.value = counter.value + 1;
    } 
}
```

## 3.编译合约
```bash
# 编译命令如下
sui move build
```

## 4.部署智能合约
使用` Sui CLI` 将 package 部署到 Sui 网络，部署命令如下：
```bash
sui client publish --gas-budget 10000000
```

结果：
```bash
----- Transaction Digest ----
Fk7KZcgVoY6Hj5BDrF1StrM414p4SPx8DM3bshqb8svd
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
│  │ Version: 62                                                                                                                                              │
│  │ Digest: 3KzqRXvTrzRXHeGmAAhhjikC8GMbsBsL3JpF5ipTtjhB                                                                                                     │
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
│    JdCCz6byNE/by8MXOlp8J2iIULK6cPuCkifWfS7i+6jK715TQcpURfzQ/8s4coEphb9rsdVJNZljTUxjb7XJDw==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Fk7KZcgVoY6Hj5BDrF1StrM414p4SPx8DM3bshqb8svd                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 5                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa391950e29d8edb533e3756310accf0ba5b0be26b5281a5609c77767f459807a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 3wrxhq5efFqQ6aiQZafB5QM6t2NtSnaGJxxndA7HdTbk                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfbd858bbdcb1f733133573bd56fd1ca35a3c830a8f7bce216f39cb519913f2f4                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 63                                                                                    │
│  │ Digest: EJSQp4inkQ6suwTSqQyDcYHt19dTi9k9b557Y3BJ2rcV                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 63                                                                                    │
│  │ Digest: BvYJV5XavHAVqaePveXWC67tNhYxLPhN9NXHCwBeH6N7                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 63                                                                                    │
│  │ Digest: BvYJV5XavHAVqaePveXWC67tNhYxLPhN9NXHCwBeH6N7                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7394800                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    G45WjAPjde58rwWHcxhD7kbrnewM6aToVWXYKp7rULFD                                                   │
│    HUKvecodFjttC4143fQ7LKpCNEwswvq8QyLJHiN8bJBg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0xfbd858bbdcb1f733133573bd56fd1ca35a3c830a8f7bce216f39cb519913f2f4
 │ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 63
 │ Digest: EJSQp4inkQ6suwTSqQyDcYHt19dTi9k9b557Y3BJ2rcV
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa
 │ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 63
 │ Digest: BvYJV5XavHAVqaePveXWC67tNhYxLPhN9NXHCwBeH6N7
 └──

Published Objects: 
 ┌──
 │ PackageID: 0xa391950e29d8edb533e3756310accf0ba5b0be26b5281a5609c77767f459807a 
 │ Version: 1 
 │ Digest: 3wrxhq5efFqQ6aiQZafB5QM6t2NtSnaGJxxndA7HdTbk
 | Modules: counter
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -741668
```

## 5.智能合约测试
+ 在交易中调用函数，采用如下命令：
```bash
# 这里 mint 是上面智能合约定义的函数， hello_world 是上面智能合约定义的模块
sui client call --function getCounter --module counter --package $PACKAGE_ID --gas-budget 10000000
```
结果：
```bash
----- Transaction Digest ----
3uDNfMiccL11X2CUpS18vLiPBTYmp3xEwQ329ZTKJXcr
╭────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                       │
├────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43                             │
│ Gas Owner: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43                          │
│ Gas Budget: 10000000                                                                                   │
│ Gas Price: 1000                                                                                        │
│ Gas Payment:                                                                                           │
│  ┌──                                                                                                   │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                              │
│  │ Version: 63                                                                                         │
│  │ Digest: BvYJV5XavHAVqaePveXWC67tNhYxLPhN9NXHCwBeH6N7                                                │
│  └──                                                                                                   │
│                                                                                                        │
│ Transaction Kind : Programmable                                                                        │
│ Inputs: []                                                                                             │
│ Commands: [                                                                                            │
│   MoveCall(0xa391950e29d8edb533e3756310accf0ba5b0be26b5281a5609c77767f459807a::counter::getCounter()), │
│ ]                                                                                                      │
│                                                                                                        │
│                                                                                                        │
│ Signatures:                                                                                            │
│    WHl7klB4f0zUJA9LbIJdnTTvaCSQJXh5tR112qix2kZmSAJb7R1hO/G21FkOYbgPjTn/4JfEdnqoBKWEc1cAAg==            │
│                                                                                                        │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3uDNfMiccL11X2CUpS18vLiPBTYmp3xEwQ329ZTKJXcr                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 5                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x69af2ede2c6da3932f9ef0614b386fdc3bfb22cd4edd9ba0022afacdc2a72e83                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 64                                                                                    │
│  │ Digest: BSJFs9GK7LzEwcbZAt4SNSYKUyHW9je954EtD3Hgn7rL                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 64                                                                                    │
│  │ Digest: Fh4YYPGoEXbE7q1NZTqAYazzkxaDPJAqGFJjeUHjf8WM                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 64                                                                                    │
│  │ Digest: Fh4YYPGoEXbE7q1NZTqAYazzkxaDPJAqGFJjeUHjf8WM                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2348400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    Fk7KZcgVoY6Hj5BDrF1StrM414p4SPx8DM3bshqb8svd                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x69af2ede2c6da3932f9ef0614b386fdc3bfb22cd4edd9ba0022afacdc2a72e83
 │ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )
 │ ObjectType: 0xa391950e29d8edb533e3756310accf0ba5b0be26b5281a5609c77767f459807a::counter::Counter 
 │ Version: 64
 │ Digest: BSJFs9GK7LzEwcbZAt4SNSYKUyHW9je954EtD3Hgn7rL
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa
 │ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 64
 │ Digest: Fh4YYPGoEXbE7q1NZTqAYazzkxaDPJAqGFJjeUHjf8WM
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -2370280
 └──
```
+ 可以使用 [Sui Explorer](https://explorer.sui.io/) 来察看我们刚才创建和转移的 `Hello World object` ,从右上角的下拉菜单中选择正在使用的网络。