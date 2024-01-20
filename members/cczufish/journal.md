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

https://zhuanlan.zhihu.com/p/592192310

sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING dragon
warning[Lint W01001]: non-composable transfer to sender


sui move test
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING dragon
warning[Lint W01001]: non-composable transfer to sender


sui client publish --gas-budget 500000000 --skip-dependency-verification 
[warn] Client/Server api version mismatch, client api version : 1.14.2, server api version : 1.15.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING dragon
warning[Lint W01001]: non-composable transfer to sender

Skipping dependency verification
----- Transaction Digest ----
8tbvkT8P7df1nqGKwrrC6zia7ng6pZBhkM3NxB9kpuZh
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70                                                                                  │
│ Gas Owner: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70                                                                               │
│ Gas Budget: 500000000                                                                                                                                       │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1                                                                                   │
│  │ Version: 7                                                                                                                                               │
│  │ Digest: rMmoY2cRJdoQFqJBTL48YtB2F8C6aiFzYVLPrMJK5QX                                                                                                      │
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
│    hc/v4B0YB0avp+Ct788gMVH1t6DQ8WXE/HxhziATeiAd+GM7Ad0b6pr9hfKeC6gbk0VKQ4+Cpy0a3ujrJKdEDg==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8tbvkT8P7df1nqGKwrrC6zia7ng6pZBhkM3NxB9kpuZh                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 6                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xd820e26b431f49e8ab5eb827ee5b170a5d40632318a729b890015127d7b40bf7                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 8                                                                                     │
│  │ Digest: BAQnPnFhNUQF7mvexGYQTMJ8MneLZGfJeCzczCfXCoe6                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe82f1dbf25f4527f914828851e841a81c2505de31f10ba5f49dc1152dac262be                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: HuGynDdtheNE89WfqX4ErXou1VJcwwsJ51WXU7828fHE                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 8                                                                                     │
│  │ Digest: 32X4FtJy4GLi7YBjayVPCDfACR6GZtJ6eBHHnUU2QWhC                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 8                                                                                     │
│  │ Digest: 32X4FtJy4GLi7YBjayVPCDfACR6GZtJ6eBHHnUU2QWhC                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 10974400                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7My3bWZsyA1pj721ZRqtvbUhxJqbGZQjr92FPre2zU8S                                                   │
│    8SttpG2yACphxQfkNY7aVmaKWxHWtHczzMFRdJSb3sop                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0xd820e26b431f49e8ab5eb827ee5b170a5d40632318a729b890015127d7b40bf7
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 8
 │ Digest: BAQnPnFhNUQF7mvexGYQTMJ8MneLZGfJeCzczCfXCoe6
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 8
 │ Digest: 32X4FtJy4GLi7YBjayVPCDfACR6GZtJ6eBHHnUU2QWhC
 └──

Published Objects: 
 ┌──
 │ PackageID: 0xe82f1dbf25f4527f914828851e841a81c2505de31f10ba5f49dc1152dac262be 
 │ Version: 1 
 │ Digest: HuGynDdtheNE89WfqX4ErXou1VJcwwsJ51WXU7828fHE
 | Modules: my_nft
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -10996280

## mint NFT

Usage: sui client call --package <PACKAGE> --module <MODULE> --function <FUNCTION> --gas-budget <GAS_BUDGET>

https://suiexplorer.com/object/0xd820e26b431f49e8ab5eb827ee5b170a5d40632318a729b890015127d7b40bf7?deviceId=588402c6-eaf9-4fac-a4d9-df6c594b9032&network=devnet

https://cleev.io/blog/how-to-deploy-an-nft-smart-contract-on-the-sui-blockchain

sui client transfer --object-id 0xd820e26b431f49e8ab5eb827ee5b170a5d40632318a729b890015127d7b40bf7 --to 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 --gas-budget 30000000

https://suiexplorer.com/address/0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70?network=devnet

 sui client call --package 0xe82f1dbf25f4527f914828851e841a81c2505de31f10ba5f49dc1152dac262be --module my_nft --function mint_to_sender --args "DRAGONNFT" "This is dragon first NFT on the SUI Blockchain" "https://white-delicate-coral-751.mypinata.cloud/ipfs/QmZo2QH4dtav6HQUqztQz81sifqrp3jCcdc5jQ8axyurna" --gas-budget 5000000
[warn] Client/Server api version mismatch, client api version : 1.14.2, server api version : 1.15.0
----- Transaction Digest ----
4aQyZRjd32wXGP6mhDTJGeXW6EvJvabsuY8a359wTuiU
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                                                                                                                                                                                                                                   │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70                                                                                                                                                                                                                                                                                         │
│ Gas Owner: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70                                                                                                                                                                                                                                                                                      │
│ Gas Budget: 5000000                                                                                                                                                                                                                                                                                                                                                │
│ Gas Price: 1000                                                                                                                                                                                                                                                                                                                                                    │
│ Gas Payment:                                                                                                                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                                                                                                               │
│  │ ID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1                                                                                                                                                                                                                                                                                          │
│  │ Version: 11                                                                                                                                                                                                                                                                                                                                                     │
│  │ Digest: 5WSSZpMZZyBXiYG96oTJkyXR9jAgpWcsKDrVznYyTYBn                                                                                                                                                                                                                                                                                                            │
│  └──                                                                                                                                                                                                                                                                                                                                                               │
│                                                                                                                                                                                                                                                                                                                                                                    │
│ Transaction Kind : Programmable                                                                                                                                                                                                                                                                                                                                    │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Vector(U8)), value: "DRAGONNFT" }), Pure(SuiPureValue { value_type: Some(Vector(U8)), value: "This is dragon first NFT on the SUI Blockchain" }), Pure(SuiPureValue { value_type: Some(Vector(U8)), value: "https://white-delicate-coral-751.mypinata.cloud/ipfs/QmZo2QH4dtav6HQUqztQz81sifqrp3jCcdc5jQ8axyurna" })] │
│ Commands: [                                                                                                                                                                                                                                                                                                                                                        │
│   MoveCall(0xe82f1dbf25f4527f914828851e841a81c2505de31f10ba5f49dc1152dac262be::my_nft::mint_to_sender(Input(0),Input(1),Input(2))),                                                                                                                                                                                                                                │
│ ]                                                                                                                                                                                                                                                                                                                                                                  │
│                                                                                                                                                                                                                                                                                                                                                                    │
│                                                                                                                                                                                                                                                                                                                                                                    │
│ Signatures:                                                                                                                                                                                                                                                                                                                                                        │
│    s1gZISev6vN0OKww73k8KhDaG8ieopkelyp5xRZPsGjOasYh2auwrL1C/BFJvCMwJz/MwxEJ4ENPmLlA4eusBw==                                                                                                                                                                                                                                                                        │
│                                                                                                                                                                                                                                                                                                                                                                    │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4aQyZRjd32wXGP6mhDTJGeXW6EvJvabsuY8a359wTuiU                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 6                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa4e5139793692127cbc7556d9901c101c85a2560eeecadb215a67e82a275b79c                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 12                                                                                    │
│  │ Digest: 4r6St1pZY5cGbaoTJKvu5GoQJDZwSMEH99PUXNQ7SP9t                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 12                                                                                    │
│  │ Digest: 3yrXA65d2QRaLTeCLh8TAAqWkyrCtksfn3tUWnAEoJRP                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 12                                                                                    │
│  │ Digest: 3yrXA65d2QRaLTeCLh8TAAqWkyrCtksfn3tUWnAEoJRP                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3488400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    XQfPfcymGcKYRjPVWxYsx2QUXYzNa5YeTQGd9G764mz                                                    │
│    8tbvkT8P7df1nqGKwrrC6zia7ng6pZBhkM3NxB9kpuZh                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array [
    Object {
        "id": Object {
            "txDigest": String("4aQyZRjd32wXGP6mhDTJGeXW6EvJvabsuY8a359wTuiU"),
            "eventSeq": String("0"),
        },
        "packageId": String("0xe82f1dbf25f4527f914828851e841a81c2505de31f10ba5f49dc1152dac262be"),
        "transactionModule": String("my_nft"),
        "sender": String("0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70"),
        "type": String("0xe82f1dbf25f4527f914828851e841a81c2505de31f10ba5f49dc1152dac262be::my_nft::NFTMinted"),
        "parsedJson": Object {
            "creator": String("0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70"),
            "name": String("DRAGONNFT"),
            "object_id": String("0xa4e5139793692127cbc7556d9901c101c85a2560eeecadb215a67e82a275b79c"),
        },
        "bcs": String("pR8WeE6zobDaiG4PJuPLYa3F2zRMfL9HQybUAt5p286xMC1K9c3ZVvC3QKyJ9LFvuyjk5cssncSnGMftXe6emqaVWQB6QoGkRsdwR"),
    },
]
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0xa4e5139793692127cbc7556d9901c101c85a2560eeecadb215a67e82a275b79c
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0xe82f1dbf25f4527f914828851e841a81c2505de31f10ba5f49dc1152dac262be::my_nft::DevNetNFT 
 │ Version: 12
 │ Digest: 4r6St1pZY5cGbaoTJKvu5GoQJDZwSMEH99PUXNQ7SP9t
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 12
 │ Digest: 3yrXA65d2QRaLTeCLh8TAAqWkyrCtksfn3tUWnAEoJRP
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -3510280




## 查看NFT
https://suiexplorer.com/object/0xa4e5139793692127cbc7556d9901c101c85a2560eeecadb215a67e82a275b79c?network=devnet

##创建 ERC20 代币（Create a Coin (ERC20)）

https://examples.sui-book.com/samples/coin.html#%E5%88%9B%E5%BB%BA-erc20-%E4%BB%A3%E5%B8%81create-a-coin-erc20


module dragoncoin::mycoin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    struct MYCOIN has drop {}

  
    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"DRAGONCOIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }
}

sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING DragonCoin


sui move test
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING DragonCoin
warning[W09008]: unused function
   ┌─ ./sources/mycoin.move:16:9
   │
16 │     fun init(witness: MYCOIN, ctx: &mut TxContext) {
   │         ^^^^ The non-'public', non-'entry' function 'init' is never called. Consider removing it.
   │
   = This warning can be suppressed with '#[allow(unused_function)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

Running Move unit tests
Test result: OK. Total tests: 0; passed: 0; failed: 0


sui client publish --gas-budget 500000000 --skip-dependency-verification 
[warn] Client/Server api version mismatch, client api version : 1.14.2, server api version : 1.15.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING DragonCoin
Skipping dependency verification
----- Transaction Digest ----
9RL8NS5U9wwCAgDvx4Hvssk8efLZwGf5qfs7JQsT1HWZ
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70                                                                                  │
│ Gas Owner: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70                                                                               │
│ Gas Budget: 500000000                                                                                                                                       │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1                                                                                   │
│  │ Version: 12                                                                                                                                              │
│  │ Digest: 3yrXA65d2QRaLTeCLh8TAAqWkyrCtksfn3tUWnAEoJRP                                                                                                     │
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
│    oknJTGP16rQflS+jrbj5/ZgI3J+b8hsbKyubwdbQ8RYHGZ6AaGPhH+v4xd4iplR5/YrxfMyZAR6FiR1KN46oAw==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9RL8NS5U9wwCAgDvx4Hvssk8efLZwGf5qfs7JQsT1HWZ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 6                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2f80ed3d20ec6a1df811e239aa31682026996eb3f5a8f765a4b50ea3194119fa                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 13                                                                                    │
│  │ Digest: 8PUtasV7WBagCPsDLc3F4Qffs2c7pKrgKFA6Ek7Y6pAz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5f1f271913b766c7f3a6a4419f39b38eb4e2fb0989b6ea06ff9a5fe136b54a20                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: HxFDr94RtaMg5vfheSN2tpALZ72pT9d3d51x9UvW2fAH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6123b126a9ec1117b9ce96b3865bbbbe1c4e28183f573b187e92cd2433dabf41                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 13                                                                                    │
│  │ Digest: HzGdvrogdNhQdx26K8cfab2B3eRDCcXouBy9GUwqEGSi                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6cfb1bd8c18b4f4a381303bc688a4c2b574c9105ebf3ad80d6eaf2481f9f2731                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 13                                                                                    │
│  │ Digest: 2RVTqcG2tWbgxDToUj3y6BPrYn1kyHrgkHVwDBSZnN9S                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 13                                                                                    │
│  │ Digest: 513461RtBm18sRwyBfmj6mY9EKDQ2Sx8wQz81aQHKDRz                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 13                                                                                    │
│  │ Digest: 513461RtBm18sRwyBfmj6mY9EKDQ2Sx8wQz81aQHKDRz                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 12479200                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4aQyZRjd32wXGP6mhDTJGeXW6EvJvabsuY8a359wTuiU                                                   │
│    8SttpG2yACphxQfkNY7aVmaKWxHWtHczzMFRdJSb3sop                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x2f80ed3d20ec6a1df811e239aa31682026996eb3f5a8f765a4b50ea3194119fa
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Immutable
 │ ObjectType: 0x2::coin::CoinMetadata<0x5f1f271913b766c7f3a6a4419f39b38eb4e2fb0989b6ea06ff9a5fe136b54a20::mycoin::MYCOIN> 
 │ Version: 13
 │ Digest: 8PUtasV7WBagCPsDLc3F4Qffs2c7pKrgKFA6Ek7Y6pAz
 └──
 ┌──
 │ ObjectID: 0x6123b126a9ec1117b9ce96b3865bbbbe1c4e28183f573b187e92cd2433dabf41
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 13
 │ Digest: HzGdvrogdNhQdx26K8cfab2B3eRDCcXouBy9GUwqEGSi
 └──
 ┌──
 │ ObjectID: 0x6cfb1bd8c18b4f4a381303bc688a4c2b574c9105ebf3ad80d6eaf2481f9f2731
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0x2::coin::TreasuryCap<0x5f1f271913b766c7f3a6a4419f39b38eb4e2fb0989b6ea06ff9a5fe136b54a20::mycoin::MYCOIN> 
 │ Version: 13
 │ Digest: 2RVTqcG2tWbgxDToUj3y6BPrYn1kyHrgkHVwDBSZnN9S
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x2943372dad0019837be726f463bc7a352c7194d096e6992422a6bcc9504045d1
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 13
 │ Digest: 513461RtBm18sRwyBfmj6mY9EKDQ2Sx8wQz81aQHKDRz
 └──

Published Objects: 
 ┌──
 │ PackageID: 0x5f1f271913b766c7f3a6a4419f39b38eb4e2fb0989b6ea06ff9a5fe136b54a20 
 │ Version: 1 
 │ Digest: HxFDr94RtaMg5vfheSN2tpALZ72pT9d3d51x9UvW2fAH
 | Modules: mycoin
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -12501080
 └──



## DRAGONCOIN

https://suiexplorer.com/object/0x2f80ed3d20ec6a1df811e239aa31682026996eb3f5a8f765a4b50ea3194119fa?network=devnet







```
