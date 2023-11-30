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



# NFT
NFT，全称为Non-Fungible Token，指非同质化通证，实质是区块链网络里具有唯一性特点的可信数字权益凭证，是一种可在区块链上记录和处理多维、复杂属性的数据对象

NFT可以是任何数字化的东西：声音、图像、一段文字、一件游戏里的道具等等，

NFT可以用来代表一幅画、一首歌、一项专利、一段影片、一张照片，帮助每一个独一无二的事物进行“版权登记”

ERC721是以太坊上最早也是最基础的NFT底层协议标准，2017年9月提出，2018年制定。其作为一种非同质化代币智能合约标准接口，允许发行基于ERC721的NFT，它规定了NFT资产的最小单位为1、不可拆分且非同质化（独一无二）的特性，ERC721是目前NFT资产的主要规范标准与基础之一

https://examples.sui.io/samples/nft.html

- DevNetNFT 结构体定义了 NFT 的基本属性，包括唯一标识符 id，名称 name，描述 description 和 URL url。

- NFTMinted 结构体定义了一个事件，当新的 NFT 被创建时，这个事件会被触发。

- name，description 和 url 函数用于获取 NFT 的相应属性。

- mint_to_sender 函数用于创建新的 NFT。它接收名称，描述和 URL 作为参数，并将新创建的 NFT 分配给调用此函数的地址。

- transfer 函数用于将 NFT 从当前所有者转移给新的接收者。

- update_description 函数用于更新 NFT 的描述。

- burn 函数用于永久删除 NFT。




```
