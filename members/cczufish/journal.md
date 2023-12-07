```
https://suiexplorer.com/object/0x07f41eb916893616afa54e3108f2299f88f3403ca8b2efc3e9cc43bc55825f60?network=devnet


《SUI MOVE中文系列课程》SUI官方认证 Move智能合约语言入门指南

https://docs.sui.io/references/cli/client


获取测试token

curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
> --header 'Content-Type: application/json' \
> --data-raw '{
>     "FixedAmountRequest": {
>         "recipient": "0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70"
>     }
> }'


{"transferredGasObjects":[{"amount":10000000000,"id":"0xafbdf69d5d4c876088241d7f194aca0ec90157f7d7233ea0541c20457634b9ae","transferTxDigest":"3tyA7m4XzeTLWmcXzx93ga4V3ECGVVEyNEferxSunSdd"}],"error":null}


https://suiexplorer.com/address/0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70?network=devnet


导入自己的钱包

sui keytool import " " ed25519

切换钱包

sui client switch --address

Get current active environment

sui client active-address

sui move build

sui move test


发布包

sui client publish --gas-budget 10000000

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Successfully verified dependencies on-chain against source.

----- Transaction Digest ----
7My3bWZsyA1pj721ZRqtvbUhxJqbGZQjr92FPre2zU8S
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70                                                                                  │
│ Gas Owner: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70                                                                               │
│ Gas Budget: 10000000                                                                                                                                        │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1                                                                                   │
│  │ Version: 6                                                                                                                                               │
│  │ Digest: 3dggioK5i1XLrC8h49vk8XnzgVXJzRXiGrYELGybcTEE                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    nouDfBpmuCrE/k9I8SeJJSDcnSyEeDFDzX+cfGCeH9ZDFEqtHKTZBA7muMODpqaBhiLd4vkbSPwmP1iSdpfRAw==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7My3bWZsyA1pj721ZRqtvbUhxJqbGZQjr92FPre2zU8S                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 2                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x07f41eb916893616afa54e3108f2299f88f3403ca8b2efc3e9cc43bc55825f60                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 7                                                                                     │
│  │ Digest: ACn5SAmefttfR3VBLtkv91cEWSZvCfwqnT7At2d9ctQW                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9be3ccab833292d3f34777abf5488981517e9237e49524bfd92edcafe86933db                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5dJpmKzF4okMscvuy5sF2Wv7kG3WGQNpUo8yuuQ18v3A                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf186e1b0a8dcbf1ea766a9374ca69a1a3067feb34fdb8e0d9cb34eed90e987d8                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 7                                                                                     │
│  │ Digest: BSHbsBmwjA3ts8c4WVcXQmQPLH4twtyUGRST7B6MRmpn                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 7                                                                                     │
│  │ Digest: rMmoY2cRJdoQFqJBTL48YtB2F8C6aiFzYVLPrMJK5QX                                            │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 7                                                                                     │
│  │ Digest: rMmoY2cRJdoQFqJBTL48YtB2F8C6aiFzYVLPrMJK5QX                                            │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9568400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    8SttpG2yACphxQfkNY7aVmaKWxHWtHczzMFRdJSb3sop                                                   │
│    Bi8GAWcehxVZ68ocXqfQkM5RTK5Zbx88kShqUcpXPEuM                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x07f41eb916893616afa54e3108f2299f88f3403ca8b2efc3e9cc43bc55825f60
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 7
 │ Digest: ACn5SAmefttfR3VBLtkv91cEWSZvCfwqnT7At2d9ctQW
 └──
 ┌──
 │ ObjectID: 0xf186e1b0a8dcbf1ea766a9374ca69a1a3067feb34fdb8e0d9cb34eed90e987d8
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0x9be3ccab833292d3f34777abf5488981517e9237e49524bfd92edcafe86933db::my_module::Forge 
 │ Version: 7
 │ Digest: BSHbsBmwjA3ts8c4WVcXQmQPLH4twtyUGRST7B6MRmpn
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 7
 │ Digest: rMmoY2cRJdoQFqJBTL48YtB2F8C6aiFzYVLPrMJK5QX
 └──

Published Objects: 
 ┌──
 │ PackageID: 0x9be3ccab833292d3f34777abf5488981517e9237e49524bfd92edcafe86933db 
 │ Version: 1 
 │ Digest: 5dJpmKzF4okMscvuy5sF2Wv7kG3WGQNpUo8yuuQ18v3A
 | Modules: my_module
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -9590280
 └──



https://suiexplorer.com/object/0x07f41eb916893616afa54e3108f2299f88f3403ca8b2efc3e9cc43bc55825f60?network=devnet






```
