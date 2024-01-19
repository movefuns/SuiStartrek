# 创建自己的ERC20协议的Coin
ERC20：是以太坊的一种代币标准，主要功能包括：
  1. 将代币从一个帐户转到另一个帐户
  2. 获取帐户的当前代币余额
  3. 获取网络上可用代币的总供应量
  4. 批准一个帐户中一定的代币金额由第三方帐户使用
[ERC20 文档](https://ethereum.org/zh/developers/docs/standards/tokens/erc-20/)

## 创建项目 
`sui move new jeffierw_erc20_coin`

修改生成文件中的`Move.toml`，将依赖的`rev = "framework/testnet"`的`testnet`修改为`devnet`

## 获取test token
```shell
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"
    }
}'
```

## 编码
在Sui中发币需要用到一次性见证，简单理解就是使用One Time Witness可以确保在创建ERC20代币时只执行一次性的操作，避免重复创建代币的问题，保证代币发行的准确性和可控性。

另外如何编码让Sui编译器知道我使用了一次性见证？
在 Sui Move中，如果一个类型的定义具有以下属性，则被视为一次性见证类型：
  1. 以模块的名字命名，但是所有字母大写
  2. 只拥有 drop 修饰符

```rust
module jeffierw_erc20_coin::jeffierw_erc20_coin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct JEFFIERW_ERC20_COIN has drop {}

    fun init(witness: JEFFIERW_ERC20_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"JEFFIERW_ERC20_COIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }
}
```

## 测试
`sui move test`

```shell
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING jeffierw_erc20_coin
Running Move unit tests
Test result: OK. Total tests: 0; passed: 0; failed: 0
```

## 编译
`sui move build`

```shell
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING jeffierw_erc20_coin
```

## 发布
发布前检查本地 `active env` `active address`

`sui client publish --gas-budget 100000000`

```shell
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING jeffierw_erc20_coin
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
9ZFFr7vVgsAveLHW5XLpodCqPcB1JBzYsc7divp2Vb4
----- Transaction Data ----
Transaction Signature: [Signature(Ed25519SuiSignature(Ed25519SuiSignature([0, 254, 30, 154, 51, 58, 147, 89, 178, 22, 175, 190, 165, 244, 207, 139, 152, 130, 33, 27, 253, 244, 130, 15, 249, 17, 87, 22, 131, 32, 3, 222, 173, 109, 220, 106, 51, 1, 97, 195, 207, 176, 168, 68, 211, 176, 198, 26, 8, 13, 119, 225, 51, 245, 94, 25, 170, 99, 185, 201, 109, 222, 205, 76, 4, 147, 65, 17, 209, 59, 150, 166, 162, 172, 118, 74, 194, 201, 128, 115, 3, 118, 8, 195, 217, 163, 34, 159, 242, 134, 61, 187, 6, 230, 168, 184, 199])))]
Transaction Kind : Programmable
Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab" })]
Commands: [
  Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002),
  TransferObjects([Result(0)],Input(0)),
]

Sender: 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab
Gas Payment: Object ID: 0x5b92a8019b70a285d8ab7b78fc76aed76bd075d3a17ebc6c1eb4cc386ec6a5e2, version: 0x17, digest: 2mnbS1pLdXQvhWwuwkJqH8MiFUz9parvkxZjZ5pr9GJG 
Gas Owner: 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab
Gas Price: 1000
Gas Budget: 100000000

----- Transaction Effects ----
Status : Success
Created Objects:
  - ID: 0x5abb696d2c0d6d77583d994a9c1988cf710721d3880ed4eee7927009d789530b , Owner: Account Address ( 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab )
  - ID: 0xbe5533493002733c4f2195be082d6d1077d4c9bf945767b80f8e54c69b690309 , Owner: Account Address ( 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab )
  - ID: 0xd694be4246a1cf19e8a7c5bccd7552adab169b0bdf7229fd3a585adc28c10759 , Owner: Immutable
  - ID: 0xf99cd7a9ae90c66da7e02a92b0fbc204ddbc62fdd060547a6830f615a1dc8bcb , Owner: Immutable
Mutated Objects:
  - ID: 0x5b92a8019b70a285d8ab7b78fc76aed76bd075d3a17ebc6c1eb4cc386ec6a5e2 , Owner: Account Address ( 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab )

----- Events ----
Array []
----- Object changes ----
Array [
    Object {
        "type": String("mutated"),
        "sender": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        "owner": Object {
            "AddressOwner": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        },
        "objectType": String("0x2::coin::Coin<0x2::sui::SUI>"),
        "objectId": String("0x5b92a8019b70a285d8ab7b78fc76aed76bd075d3a17ebc6c1eb4cc386ec6a5e2"),
        "version": String("24"),
        "previousVersion": String("23"),
        "digest": String("GoZYz5hsCGvRTXLKfV1DGfuTsri3yPR3iJPmSKooHdgS"),
    },
    Object {
        "type": String("created"),
        "sender": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        "owner": Object {
            "AddressOwner": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        },
        "objectType": String("0x2::package::UpgradeCap"),
        "objectId": String("0x5abb696d2c0d6d77583d994a9c1988cf710721d3880ed4eee7927009d789530b"),
        "version": String("24"),
        "digest": String("3uvwLpnS9CVuFfxHikquGpmy1uEheDygBNY87VMX34u8"),
    },
    Object {
        "type": String("created"),
        "sender": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        "owner": Object {
            "AddressOwner": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        },
        "objectType": String("0x2::coin::TreasuryCap<0xd694be4246a1cf19e8a7c5bccd7552adab169b0bdf7229fd3a585adc28c10759::jeffierw_erc20_coin::JEFFIERW_ERC20_COIN>"),
        "objectId": String("0xbe5533493002733c4f2195be082d6d1077d4c9bf945767b80f8e54c69b690309"),
        "version": String("24"),
        "digest": String("BvwbMZ5rUNjSFBo6Bp4QBgsfbBGgo1y2jPGkNjD28ms3"),
    },
    Object {
        "type": String("published"),
        "packageId": String("0xd694be4246a1cf19e8a7c5bccd7552adab169b0bdf7229fd3a585adc28c10759"),
        "version": String("1"),
        "digest": String("5ghHc4fqghc6yAgcUw8GKZ6yApynq4tV8CqrkyJiJDpd"),
        "modules": Array [
            String("jeffierw_erc20_coin"),
        ],
    },
    Object {
        "type": String("created"),
        "sender": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        "owner": String("Immutable"),
        "objectType": String("0x2::coin::CoinMetadata<0xd694be4246a1cf19e8a7c5bccd7552adab169b0bdf7229fd3a585adc28c10759::jeffierw_erc20_coin::JEFFIERW_ERC20_COIN>"),
        "objectId": String("0xf99cd7a9ae90c66da7e02a92b0fbc204ddbc62fdd060547a6830f615a1dc8bcb"),
        "version": String("24"),
        "digest": String("7Mgx1MW86X2dbjdfN8Rx9Hfzt52NZi4fYpNARcstCUsi"),
    },
]
----- Balance changes ----
Array [
    Object {
        "owner": Object {
            "AddressOwner": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        },
        "coinType": String("0x2::sui::SUI"),
        "amount": String("-13527080"),
    },
]
```



