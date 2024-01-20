新建一个名为jscoin的项目，新建source/jscoin.move

里头添加代码

```
module jscoin::jscoin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// 这个结构体代表代币类型，每种代币都需要一个类型：`Coin<package_object::jscoin::JSCOIN>`
    /// 确保结构体名与模块名匹配
    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::jscoin::JSCOIN>`
    /// Make sure that the name of the type matches the module's name.
    struct JSCOIN has drop {}

    /// 模块初始化函数在模块发布时被调用。
    /// `TreasuryCap`会被发送给模块的发布者，因此发布者可以控制代币铸造和销毁。
    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: JSCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"JSCOIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }
}

```
部署sui client publish --gas-budget 100000000 

```
 % sui client publish --gas-budget 100000000       
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.14.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING jscoin
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
BDjqaCk6JEF4GMZraqdSrFNHcsxGwAkypyAVGNWczhan
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c                                                                                  │
│ Gas Owner: 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c                                                                               │
│ Gas Budget: 100000000                                                                                                                                       │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0xd14d931da3090fa7d4590cb4e249a9444b3d9af9947a718678f2b43cbb74643b                                                                                   │
│  │ Version: 64                                                                                                                                              │
│  │ Digest: J13YzTAo9Tky1FE1LuLCyj1FBgxS9wUHngRdU1ZvGTJe                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    0RqdFVxm1BD3Y9yx7s1IVHwMxYeIGpcYx8bamJaOmkxB+Qd++BWYzVnU7VuWAfAyN936G/Ztwb2DI0aPahNOCw==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BDjqaCk6JEF4GMZraqdSrFNHcsxGwAkypyAVGNWczhan                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 4                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3c03813003a0598f5989ff2db245adf1e0b054ec1a53a9d6493032f082898e62                         │
│  │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c )  │
│  │ Version: 65                                                                                    │
│  │ Digest: crbAgkuSGJ97jiBPskPJwHiHb4rLdnk2cVAVCwMoXBZ                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x4c665f689b97f15a02f56af3166b7f078911a74f3be487fcd8b25c0fcdb1042a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5hzcuCUqkke2Xnyz3uF3xZ3YesYVs3icz88XdBX9djgt                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x83380afbc0e7799fc1c6352e651ce1df75581079b7372299d0a1a2d7bf90df24                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 65                                                                                    │
│  │ Digest: CZ1KTJv2SDxFh3Y1ofYWJBh16rTZixstZVDnjXUSKq3J                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x96011a180252ee5c4b55df74f27ece66ffdbbae7a6fcc1496c6097a371482fbf                         │
│  │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c )  │
│  │ Version: 65                                                                                    │
│  │ Digest: HXGHJ7qtvtDQf91uT48K12udR1jqbnReSLSNzgdX842N                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xd14d931da3090fa7d4590cb4e249a9444b3d9af9947a718678f2b43cbb74643b                         │
│  │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c )  │
│  │ Version: 65                                                                                    │
│  │ Digest: BjdmNk1VPL3Z9rzZkh3dgcWNipwDsoULMqWCNhE38iCX                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xd14d931da3090fa7d4590cb4e249a9444b3d9af9947a718678f2b43cbb74643b                         │
│  │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c )  │
│  │ Version: 65                                                                                    │
│  │ Digest: BjdmNk1VPL3Z9rzZkh3dgcWNipwDsoULMqWCNhE38iCX                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 12418400                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    G8gNuw6xq1KwN8J6sSnjb7bxF6WAFKjWb3fC2XTtPbRV                                                   │
│    HUKvecodFjttC4143fQ7LKpCNEwswvq8QyLJHiN8bJBg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x3c03813003a0598f5989ff2db245adf1e0b054ec1a53a9d6493032f082898e62
 │ Sender: 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c 
 │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 65
 │ Digest: crbAgkuSGJ97jiBPskPJwHiHb4rLdnk2cVAVCwMoXBZ
 └──
 ┌──
 │ ObjectID: 0x83380afbc0e7799fc1c6352e651ce1df75581079b7372299d0a1a2d7bf90df24
 │ Sender: 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c 
 │ Owner: Immutable
 │ ObjectType: 0x2::coin::CoinMetadata<0x4c665f689b97f15a02f56af3166b7f078911a74f3be487fcd8b25c0fcdb1042a::jscoin::JSCOIN> 
 │ Version: 65
 │ Digest: CZ1KTJv2SDxFh3Y1ofYWJBh16rTZixstZVDnjXUSKq3J
 └──
 ┌──
 │ ObjectID: 0x96011a180252ee5c4b55df74f27ece66ffdbbae7a6fcc1496c6097a371482fbf
 │ Sender: 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c 
 │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c )
 │ ObjectType: 0x2::coin::TreasuryCap<0x4c665f689b97f15a02f56af3166b7f078911a74f3be487fcd8b25c0fcdb1042a::jscoin::JSCOIN> 
 │ Version: 65
 │ Digest: HXGHJ7qtvtDQf91uT48K12udR1jqbnReSLSNzgdX842N
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0xd14d931da3090fa7d4590cb4e249a9444b3d9af9947a718678f2b43cbb74643b
 │ Sender: 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c 
 │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 65
 │ Digest: BjdmNk1VPL3Z9rzZkh3dgcWNipwDsoULMqWCNhE38iCX
 └──

Published Objects: 
 ┌──
 │ PackageID: 0x4c665f689b97f15a02f56af3166b7f078911a74f3be487fcd8b25c0fcdb1042a 
 │ Version: 1 
 │ Digest: 5hzcuCUqkke2Xnyz3uF3xZ3YesYVs3icz88XdBX9djgt
 | Modules: jscoin
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -12440280
 └──
```

第二个名字换成了bycoin，其他的和上面的操作一致
