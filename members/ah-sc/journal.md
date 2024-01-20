# 学习日志

# Roadmap 1

## install

使用 cargo 安装 sui cleint，最好设置全局 git 代理。

安装成功后，创建测试地址，使用官方文档中的 `curl`命令领取测试代币。为了在后期的开发中方便领取，可以在 `postman` 中创建一个 `POST` 请求，将参数和测试地址都保存起来，不用每次都输命令。 

## 部署erc20合约

1. 创建 sui 项目
```
sui move new my_coin
```
2. 编写合约代码
```
  module fungbile_tokens::mycoin {
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
        let (treasury, metadata) = coin::create_currency(witness, 6, b"MYCOIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }
  }
```

3. build 及测试
执行 build 及测试命令对合约进行测试

4. 部署
```
  sui move publish --gas-budget 50000000
  [warn] Client/Server api version mismatch, client api version : 1.13.0, server api version : 1.14.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING fungible_tokens
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
Hcx8R56yeuw7NHSBuuoZew99xB7LgFnh7rHpZN8xyPP3
----- Transaction Data ----
Transaction Signature: [Signature(Ed25519SuiSignature(Ed25519SuiSignature([0, 189, 12, 174, 168, 87, 30, 211, 188, 96, 56, 134, 119, 70, 111, 254, 189, 180, 175, 102, 152, 103, 109, 134, 15, 37, 31, 222, 15, 238, 194, 60, 204, 27, 211, 128, 78, 140, 254, 194, 148, 244, 45, 240, 83, 33, 178, 216, 57, 73, 50, 58, 94, 31, 54, 80, 41, 127, 242, 201, 85, 195, 18, 19, 4, 68, 27, 93, 64, 106, 138, 211, 94, 114, 2, 236, 210, 104, 255, 131, 233, 135, 40, 172, 68, 182, 116, 181, 184, 200, 52, 127, 166, 159, 69, 123, 197])))]
Transaction Kind : Programmable
Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8" })]
Commands: [
  Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002),
  TransferObjects([Result(0)],Input(0)),
]

Sender: 0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8
Gas Payment: Object ID: 0x40914c7076ad4e5e74620912eb1d34dd2d1d6f48bea893bbeca1b5d7f4fbcfa8, version: 0xd, digest: EzYm5z81QLSevvczAJQ3wWJx4PgrdDRD9vq3GLm7e6kh
Gas Owner: 0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8
Gas Price: 1000
Gas Budget: 50000000

----- Transaction Effects ----
Status : Success
Created Objects:
  - ID: 0x3377ae680c0a8daa3342cdc1d933df78d4fe28241518263b5020959142e2261c , Owner: Immutable
  - ID: 0x64e03c19e7811e3bc0339ac1daf674c2336c4277e15661386384e94dbeb08d43 , Owner: Account Address ( 0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8 )
  - ID: 0xcb9aaf4c9a5cf375a61a547b049f6fbd0d3beee1bfccdf07258a16abd3bb2395 , Owner: Immutable
  - ID: 0xe0544626c3dd332554a4f58bc04147eef8dea11839f05d5f8cf6ccd6b2c61d80 , Owner: Account Address ( 0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8 )
Mutated Objects:
  - ID: 0x40914c7076ad4e5e74620912eb1d34dd2d1d6f48bea893bbeca1b5d7f4fbcfa8 , Owner: Account Address ( 0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8 )

----- Events ----
Array []
----- Object changes ----
Array [
    Object {
        "type": String("mutated"),
        "sender": String("0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8"),
        "owner": Object {
            "AddressOwner": String("0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8"),
        },
        "objectType": String("0x2::coin::Coin<0x2::sui::SUI>"),
        "objectId": String("0x40914c7076ad4e5e74620912eb1d34dd2d1d6f48bea893bbeca1b5d7f4fbcfa8"),
        "version": String("14"),
        "previousVersion": String("13"),
        "digest": String("DEZnFqZ68N3pRBL9Cbj3u5PP6Nz6jTxGWDsFZ4VwS6dq"),
    },
    Object {
        "type": String("created"),
        "sender": String("0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8"),
        "owner": String("Immutable"),
        "objectType": String("0x2::coin::CoinMetadata<0xcb9aaf4c9a5cf375a61a547b049f6fbd0d3beee1bfccdf07258a16abd3bb2395::mycoin::MYCOIN>"),
        "objectId": String("0x3377ae680c0a8daa3342cdc1d933df78d4fe28241518263b5020959142e2261c"),
        "version": String("14"),
        "digest": String("Gwx7T41z2MGHNGG5K3QF8nVLT4L5YKyEsdZkkjyxmZkt"),
    },
    Object {
        "type": String("created"),
        "sender": String("0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8"),
        "owner": Object {
            "AddressOwner": String("0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8"),
        },
        "objectType": String("0x2::package::UpgradeCap"),
        "objectId": String("0x64e03c19e7811e3bc0339ac1daf674c2336c4277e15661386384e94dbeb08d43"),
        "version": String("14"),
        "digest": String("EZ2NsHbNq1HiV4rg8RtuHZ8NgdbNmaRLQpnApX7U66zL"),
    },
    Object {
        "type": String("published"),
        "packageId": String("0xcb9aaf4c9a5cf375a61a547b049f6fbd0d3beee1bfccdf07258a16abd3bb2395"),
        "version": String("1"),
        "digest": String("4mTN5BK3qy8EwwF9WGFwQskGUK5cgP6TxMMcKhVkVAED"),
        "modules": Array [
            String("mycoin"),
        ],
    },
    Object {
        "type": String("created"),
        "sender": String("0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8"),
        "owner": Object {
            "AddressOwner": String("0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8"),
        },
        "objectType": String("0x2::coin::TreasuryCap<0xcb9aaf4c9a5cf375a61a547b049f6fbd0d3beee1bfccdf07258a16abd3bb2395::mycoin::MYCOIN>"),
        "objectId": String("0xe0544626c3dd332554a4f58bc04147eef8dea11839f05d5f8cf6ccd6b2c61d80"),
        "version": String("14"),
        "digest": String("4DgpHQYRZVaDq2uAAumQ6U2JZuBM7yBXwCrk9Aj9fkeD"),
    },
]
----- Balance changes ----
Array [
    Object {
        "owner": Object {
            "AddressOwner": String("0x49cf84b2de3c4d1267646c571fd9a3ab13e5ddbdf51c8ad86896adbb77606af8"),
        },
        "coinType": String("0x2::sui::SUI"),
        "amount": String("-12440280"),
    },
]
```