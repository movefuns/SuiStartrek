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



## 第二周任务

Transaction Digest: 8RoTbsKEKYKv9tGXusSs38of3HTVtAqEBfkUkunPNerY
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                                                                                               │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                                                                                                                                     │
│ Gas Owner: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                                                                                                                                  │
│ Gas Budget: 300000000 MIST                                                                                                                                                                                                     │
│ Gas Price: 750 MIST                                                                                                                                                                                                            │
│ Gas Payment:                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                           │
│  │ ID: 0x00ecde45029000f932c3e76f9f7fffc5f241af5bd47ceaf0f36733e9f19ae360                                                                                                                                                      │
│  │ Version: 43221729                                                                                                                                                                                                           │
│  │ Digest: CfLfTVuc9XcEPhAkUF5i7WPK6H1gwoUZYkQvX3SobnDo                                                                                                                                                                        │
│  └──                                                                                                                                                                                                                           │
│                                                                                                                                                                                                                                │
│ Transaction Kind : Programmable                                                                                                                                                                                                │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853" })]                                                                                        │
│ Commands: [                                                                                                                                                                                                                    │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002,0x8a61e975537193d5a3257af8f5eee4703e426b94e54a2ce6a4df79c5e17270d4), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                                                                                       │
│ ]                                                                                                                                                                                                                              │
│                                                                                                                                                                                                                                │
│                                                                                                                                                                                                                                │
│ Signatures:                                                                                                                                                                                                                    │
│    k653K+fvR9x/LlhLv6hmexFo1EiJEqv0iuS+L6R7AXGwCe7IO5CEdrhYiHCBmPErys6Eer+XiWIfvDlgehhmCA==                                                                                                                                    │
│                                                                                                                                                                                                                                │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8RoTbsKEKYKv9tGXusSs38of3HTVtAqEBfkUkunPNerY                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 256                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x030128d12c563434c1ab3033991e709262900614ed1c3ce039d6581f459bbee1                         │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )  │
│  │ Version: 43221730                                                                              │
│  │ Digest: FbypfhmDcnXvbtpJpww7zfn6t427hmUpWqrQqfTWyKgz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3afcd32118580eab2cf6c59f0fab53e285a25445f84bec0888ce1ce731085426                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 43221730                                                                              │
│  │ Digest: G4JWh1EzaBp2V1eHVXYP26913yqgckexVgwPE6nQ5Gci                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6be9c76585fe7368d2365bc46d6cf87b35a32e36b2803f4b6f8ea7f3777162e2                         │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )  │
│  │ Version: 43221730                                                                              │
│  │ Digest: 5xMJjouxfuWdXyDnLS8mayGH6RNoe72gsb1oQBhbAKPo                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb36e8bdd7936c9bc5b6dd4563488c08f8a8f563525acf9fceb095737ada396f4                         │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )  │
│  │ Version: 43221730                                                                              │
│  │ Digest: AQ8kKWnZgrxk1na7PnyJiuiisfnAjEhehz49LGyVmZfh                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb7b676697303a95771fd989bc5734c35e2e43f4b17c84f42d215ecc61424f64e                         │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )  │
│  │ Version: 43221730                                                                              │
│  │ Digest: H1nveM75yMacDFrMZPTUBCyNQevgDt4bqu4Z49A16mzb                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 8apMTLR4bKBG9Ba7mraKnHyKFxy5td5YPcztAbbX3Joo                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x00ecde45029000f932c3e76f9f7fffc5f241af5bd47ceaf0f36733e9f19ae360                         │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )  │
│  │ Version: 43221730                                                                              │
│  │ Digest: 4qgy69LpQ1cbjTKUYLs9oykUm8CiQR79ahajtf78LEse                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x00ecde45029000f932c3e76f9f7fffc5f241af5bd47ceaf0f36733e9f19ae360                         │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )  │
│  │ Version: 43221730                                                                              │
│  │ Digest: 4qgy69LpQ1cbjTKUYLs9oykUm8CiQR79ahajtf78LEse                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 50562800                                                                         │
│    Computation Cost: 750000                                                                       │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    XsgBp94G5j2KhzwFfqvqPfV6tVAhAFRB8etz2dPeW63                                                    │
│    8R6jTsb9ZLxkRbFYMncHsUEEY7E1C8twNjkMmB9URjR8                                                   │
│    9q426atY6SxWGbs5J8KEYY1xgJXJq8yB9C5JT3abNbig                                                   │
│    BEb8wBMP1GawREPj4XMmFC75VTmZL5U6aMLLo7122eWn                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                        │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                            │
│  │ EventID: 8RoTbsKEKYKv9tGXusSs38of3HTVtAqEBfkUkunPNerY:0                                                                      │
│  │ PackageID: 0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19                                                │
│  │ Transaction Module: game                                                                                                     │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                                   │
│  │ EventType: 0x2::display::DisplayCreated<0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19::game::Profile>   │
│  │ ParsedJSON:                                                                                                                  │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                                │
│  │   │ id │ 0xb7b676697303a95771fd989bc5734c35e2e43f4b17c84f42d215ecc61424f64e │                                                │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                                │
│  └──                                                                                                                            │
│  ┌──                                                                                                                            │
│  │ EventID: 8RoTbsKEKYKv9tGXusSs38of3HTVtAqEBfkUkunPNerY:1                                                                      │
│  │ PackageID: 0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19                                                │
│  │ Transaction Module: game                                                                                                     │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                                   │
│  │ EventType: 0x2::display::DisplayCreated<0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19::game::ClaimCard> │
│  │ ParsedJSON:                                                                                                                  │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                                │
│  │   │ id │ 0x030128d12c563434c1ab3033991e709262900614ed1c3ce039d6581f459bbee1 │                                                │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                                │
│  └──                                                                                                                            │
│  ┌──                                                                                                                            │
│  │ EventID: 8RoTbsKEKYKv9tGXusSs38of3HTVtAqEBfkUkunPNerY:2                                                                      │
│  │ PackageID: 0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19                                                │
│  │ Transaction Module: game                                                                                                     │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                                   │
│  │ EventType: 0x2::display::VersionUpdated<0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19::game::Profile>   │
│  │ ParsedJSON:                                                                                                                  │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                           │
│  │   │ fields  │ contents │ key   │ name                                            │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ value │ {name}                                          │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ key   │ link                                            │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ value │ https://github.com/{name}                       │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ key   │ image_url                                       │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ value │ {img_url}                                       │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ key   │ description                                     │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ value │ {description}                                   │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ key   │ project_url                                     │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ value │ https://github.com                              │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ key   │ creator                                         │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ value │ Unknown Sui Fan                                 │                                           │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                           │
│  │   │ id      │ 0xb7b676697303a95771fd989bc5734c35e2e43f4b17c84f42d215ecc61424f64e │                                           │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                           │
│  │   │ version │ 1                                                                  │                                           │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                           │
│  └──                                                                                                                            │
│  ┌──                                                                                                                            │
│  │ EventID: 8RoTbsKEKYKv9tGXusSs38of3HTVtAqEBfkUkunPNerY:3                                                                      │
│  │ PackageID: 0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19                                                │
│  │ Transaction Module: game                                                                                                     │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                                   │
│  │ EventType: 0x2::display::VersionUpdated<0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19::game::ClaimCard> │
│  │ ParsedJSON:                                                                                                                  │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                           │
│  │   │ fields  │ contents │ key   │ name                                            │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ value │ {name}                                          │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ key   │ link                                            │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ value │ https://github.com/{name}                       │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ key   │ image_url                                       │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ value │ {img_url}                                       │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ key   │ description                                     │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ value │ Game Card!                                      │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ key   │ project_url                                     │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ value │ https://github.com                              │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ key   │ creator                                         │                                           │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                           │
│  │   │         │          │ value │ Unknown Sui Fan                                 │                                           │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                           │
│  │   │ id      │ 0x030128d12c563434c1ab3033991e709262900614ed1c3ce039d6581f459bbee1 │                                           │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                           │
│  │   │ version │ 1                                                                  │                                           │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                           │
│  └──                                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                                            │
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x030128d12c563434c1ab3033991e709262900614ed1c3ce039d6581f459bbee1                                            │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                              │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )                           │
│  │ ObjectType: 0x2::display::Display<0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19::game::ClaimCard>  │
│  │ Version: 43221730                                                                                                       │
│  │ Digest: FbypfhmDcnXvbtpJpww7zfn6t427hmUpWqrQqfTWyKgz                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x3afcd32118580eab2cf6c59f0fab53e285a25445f84bec0888ce1ce731085426                                            │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                              │
│  │ Owner: Shared                                                                                                           │
│  │ ObjectType: 0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19::game::GamePoolHouse                     │
│  │ Version: 43221730                                                                                                       │
│  │ Digest: G4JWh1EzaBp2V1eHVXYP26913yqgckexVgwPE6nQ5Gci                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x6be9c76585fe7368d2365bc46d6cf87b35a32e36b2803f4b6f8ea7f3777162e2                                            │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                              │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )                           │
│  │ ObjectType: 0x2::package::Publisher                                                                                     │
│  │ Version: 43221730                                                                                                       │
│  │ Digest: 5xMJjouxfuWdXyDnLS8mayGH6RNoe72gsb1oQBhbAKPo                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xb36e8bdd7936c9bc5b6dd4563488c08f8a8f563525acf9fceb095737ada396f4                                            │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                              │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )                           │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                    │
│  │ Version: 43221730                                                                                                       │
│  │ Digest: AQ8kKWnZgrxk1na7PnyJiuiisfnAjEhehz49LGyVmZfh                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xb7b676697303a95771fd989bc5734c35e2e43f4b17c84f42d215ecc61424f64e                                            │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                              │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )                           │
│  │ ObjectType: 0x2::display::Display<0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19::game::Profile>    │
│  │ Version: 43221730                                                                                                       │
│  │ Digest: H1nveM75yMacDFrMZPTUBCyNQevgDt4bqu4Z49A16mzb                                                                    │
│  └──                                                                                                                       │
│                                                                                                                            │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x00ecde45029000f932c3e76f9f7fffc5f241af5bd47ceaf0f36733e9f19ae360                                            │
│  │ Sender: 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853                                              │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 43221730                                                                                                       │
│  │ Digest: 4qgy69LpQ1cbjTKUYLs9oykUm8CiQR79ahajtf78LEse                                                                    │
│  └──                                                                                                                       │
│                                                                                                                            │
│ Published Objects:                                                                                                         │
│  ┌──                                                                                                                       │
│  │ PackageID: 0xba01fb8304960724634e3d60a07dcb1dcb9062bcca421ec45be4cfebc81c6a19                                           │
│  │ Version: 1                                                                                                              │
│  │ Digest: 8apMTLR4bKBG9Ba7mraKnHyKFxy5td5YPcztAbbX3Joo                                                                    │
│  | Modules: game                                                                                                           │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0e34e34fafc443f655d3d6721b6874900c089ed19d1b1d4b839d813959e9e853 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -50334680                                                                              │
│  └──                                                                                              │
│                                                                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯