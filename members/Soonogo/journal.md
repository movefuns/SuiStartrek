## 第一周任务

> - 安装Move 开发环境
> - 安装Web3 钱包
> - 学习ERC 20
> - 完成ERC 20 合约的发布

sui client publish ./build    --gas-budget 300000000

[warn] Client/Server api version mismatch, client api version : 1.16.0, server api version : 1.15.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING erc20
Successfully verified dependencies on-chain against source.
Transaction Digest: HjeoqhV62CsMjgskuDeJKGThVCn6FPhnpxU4uSzAheus
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                                                                  │
│ Gas Owner: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                                                               │
│ Gas Budget: 300000000 MIST                                                                                                                                  │
│ Gas Price: 1000 MIST                                                                                                                                        │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x608425af2490820ac88fcb71805e15f50047740b45d488e05f0120b27a56fc62                                                                                   │
│  │ Version: 12675108                                                                                                                                        │
│  │ Digest: 4WVmyHFc78bzpH6f89y689HDoCwFpJTZvEVkktSwtRgC                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    atArLtP8WUFhiOBM3slwZbdTUzeEHJkXDKMGVNkVWOhDPRRYqopREs0bbQzS9iX8UHB9fd/sRINZCWj5Zfi0BQ==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HjeoqhV62CsMjgskuDeJKGThVCn6FPhnpxU4uSzAheus                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 216                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x39dec189b238428a4944a4e9fd6dfe41f9335dc9eae3b2dcf095b8cb1b4ad20b                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: J6KJiYRV8pzAjnyUyj3Hy1B8L8RtD7rzgNTJYZAfKB7E                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x47f09112960225d163a5c82075ca2471d0604b16f3483642a989f8cc9e271e24                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 12675109                                                                              │
│  │ Digest: DMEkASjwcSeeM3q9W6RM728ZPtHpJUWqymgSZCH6Cx89                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5918ae466701fdb26fcb17d352544244a3538ab54947ceedc713fbc2eb8cbfae                         │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )  │
│  │ Version: 12675109                                                                              │
│  │ Digest: 4WHjLjXkAnBDuGigvRYwceQgVXMPr8GtrXa55QDsVyzB                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb4eabb055d23704014147fc9768616988de4db7e8d6c9b6b0790a46f9f33a43f                         │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )  │
│  │ Version: 12675109                                                                              │
│  │ Digest: AxKUc15NbU5LT8ZZAsXQ3kkXTQEt692WBePasgMXSnP4                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x608425af2490820ac88fcb71805e15f50047740b45d488e05f0120b27a56fc62                         │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )  │
│  │ Version: 12675109                                                                              │
│  │ Digest: 8PE7DMoyk9BAwWTHAdEWLYMd2Hdg8W3vvyoZSAjDGeQv                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x608425af2490820ac88fcb71805e15f50047740b45d488e05f0120b27a56fc62                         │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )  │
│  │ Version: 12675109                                                                              │
│  │ Digest: 8PE7DMoyk9BAwWTHAdEWLYMd2Hdg8W3vvyoZSAjDGeQv                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 12418400                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3SM21kw95y3EK7VZHiwQ8KWMvs8zEBJKEwQiWjh3B4zN                                                   │
│    3pcBpJcaTZJstk5Ssu13zXjSaNQX2Xw1U2F66C9dajq5                                                   │
│    HvsY1fCX5ueSnywNbfwMCEPo6Tuu3zw51bt5fyKbD4Hv                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                                             │
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x47f09112960225d163a5c82075ca2471d0604b16f3483642a989f8cc9e271e24                                             │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                               │
│  │ Owner: Immutable                                                                                                         │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x39dec189b238428a4944a4e9fd6dfe41f9335dc9eae3b2dcf095b8cb1b4ad20b::mycoin::MYCOIN>  │
│  │ Version: 12675109                                                                                                        │
│  │ Digest: DMEkASjwcSeeM3q9W6RM728ZPtHpJUWqymgSZCH6Cx89                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x5918ae466701fdb26fcb17d352544244a3538ab54947ceedc713fbc2eb8cbfae                                             │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                               │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                     │
│  │ Version: 12675109                                                                                                        │
│  │ Digest: 4WHjLjXkAnBDuGigvRYwceQgVXMPr8GtrXa55QDsVyzB                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xb4eabb055d23704014147fc9768616988de4db7e8d6c9b6b0790a46f9f33a43f                                             │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                               │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )                            │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x39dec189b238428a4944a4e9fd6dfe41f9335dc9eae3b2dcf095b8cb1b4ad20b::mycoin::MYCOIN>   │
│  │ Version: 12675109                                                                                                        │
│  │ Digest: AxKUc15NbU5LT8ZZAsXQ3kkXTQEt692WBePasgMXSnP4                                                                     │
│  └──                                                                                                                        │
│                                                                                                                             │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x608425af2490820ac88fcb71805e15f50047740b45d488e05f0120b27a56fc62                                             │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                               │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 12675109                                                                                                        │
│  │ Digest: 8PE7DMoyk9BAwWTHAdEWLYMd2Hdg8W3vvyoZSAjDGeQv                                                                     │
│  └──                                                                                                                        │
│                                                                                                                             │
│ Published Objects:                                                                                                          │
│  ┌──                                                                                                                        │
│  │ PackageID: 0x39dec189b238428a4944a4e9fd6dfe41f9335dc9eae3b2dcf095b8cb1b4ad20b                                            │
│  │ Version: 1                                                                                                               │
│  │ Digest: J6KJiYRV8pzAjnyUyj3Hy1B8L8RtD7rzgNTJYZAfKB7E                                                                     │
│  | Modules: mycoin                                                                                                          │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -12440280                                                                              │
│  └──                                                                                              │
│                                                                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯