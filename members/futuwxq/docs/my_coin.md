# my erc20 coin

## 创建项目

`sui move new my_coin`

## 获取 test token

```shell
curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e"
    }
}'
```

## 编码

在 Sui 中发币需要用到一次性见证，简单理解就是使用 One Time Witness 可以确保在创建 ERC20 代币时只执行一次性的操作，避免重复创建代币的问题，保证代币发行的准确性和可控性。

```rust
module futuwxq_coin::futuwxq_coin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct FUTUWXQ_COIN has drop {}

    fun init(witness: FUTUWXQ_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"FUTUWXQ_COIN", b"", b"", option::none(), ctx);
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
BUILDING futuwxq_coin
Running Move unit tests
Test result: OK. Total tests: 0; passed: 0; failed: 0
```

## 编译

`sui move build`

```shell
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING futuwxq_coin
```

## 发布

发布前检查本地 `active env` `active address`

`sui client publish --gas-budget 100000000`

```shell
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING futuwxq_coin
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
BxVr7XR5yZEg5caDTTn7bJDsbB2sVALsa4Kr5e3cDrV9
----- Transaction Data ----
Transaction Signature: [Signature(Ed25519SuiSignature(Ed25519SuiSignature([0, 209, 154, 158, 1, 75, 136, 3, 160, 65, 27, 27, 3, 162, 191, 233, 22, 182, 254, 102, 142, 130, 154, 134, 151, 116, 246, 81, 110, 76, 125, 113, 217, 32, 33, 198, 174, 151, 186, 238, 142, 10, 171, 178, 52, 164, 85, 254, 255, 49, 239, 43, 153, 137, 42, 15, 238, 2, 79, 97, 15, 185, 13, 188, 8, 82, 248, 198, 153, 58, 57, 238, 27, 196, 251, 188, 16, 182, 104, 172, 218, 224, 28, 178, 236, 17, 170, 149, 56, 78, 22, 3, 29, 28, 35, 176, 163])))]
Transaction Kind : Programmable
Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e" })]
Commands: [
  Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002),
  TransferObjects([Result(0)],Input(0)),
]

Sender: 0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e
Gas Payment: Object ID: 0x4cc8172abd4b0187b2f191fc95dc1a82fe565653a8fd7101765363ebb536512f, version: 0xa89f7, digest: 7Gsm2Hy7j769jfdGNXjLXJLn3dVa45JG7eyszL1SJUqb
Gas Owner: 0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e
Gas Price: 1000
Gas Budget: 100000000

----- Transaction Effects ----
Status : Success
Created Objects:
  - ID: 0x0fda9363597b5777aae5356b6a1890e3c8966e522f9f01bc84740649320c9877 , Owner: Account Address ( 0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e )
  - ID: 0x31339b3fe1c1a010ac0deed7cbb7741ad1c6b6da31335413c0451e130da9ae08 , Owner: Immutable
  - ID: 0x9a475ca4e02d0952d4d814ef63fabe998e55422c72bdad993e156787b6870e21 , Owner: Immutable
  - ID: 0xb4ae5bb66054ba09778072f8ce719c32c5c2acc8e7a442cf36afef7329aa6266 , Owner: Account Address ( 0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e )
Mutated Objects:
  - ID: 0x4cc8172abd4b0187b2f191fc95dc1a82fe565653a8fd7101765363ebb536512f , Owner: Account Address ( 0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e )

----- Events ----
Array []
----- Object changes ----
Array [
    Object {
        "type": String("mutated"),
        "sender": String("0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e"),
        "owner": Object {
            "AddressOwner": String("0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e"),
        },
        "objectType": String("0x2::coin::Coin<0x2::sui::SUI>"),
        "objectId": String("0x4cc8172abd4b0187b2f191fc95dc1a82fe565653a8fd7101765363ebb536512f"),
        "version": String("690680"),
        "previousVersion": String("690679"),
        "digest": String("7EFAL2xq9Yxsj8waczeAx3N9LsowHFPenkgmmmRs6Kpk"),
    },
    Object {
        "type": String("created"),
        "sender": String("0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e"),
        "owner": Object {
            "AddressOwner": String("0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e"),
        },
        "objectType": String("0x2::package::UpgradeCap"),
        "objectId": String("0x0fda9363597b5777aae5356b6a1890e3c8966e522f9f01bc84740649320c9877"),
        "version": String("690680"),
        "digest": String("4HFvn89FnW4KXhh15JKpMtC5Yj1Qs6QVabWWoyQZjyfk"),
    },
    Object {
        "type": String("published"),
        "packageId": String("0x31339b3fe1c1a010ac0deed7cbb7741ad1c6b6da31335413c0451e130da9ae08"),
        "version": String("1"),
        "digest": String("J4kYS4pRzzngUnGsdxbEVmnUQZhg6Y3r4VYkkV7zH2uJ"),
        "modules": Array [
            String("futuwxq_coin"),
        ],
    },
    Object {
        "type": String("created"),
        "sender": String("0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e"),
        "owner": String("Immutable"),
        "objectType": String("0x2::coin::CoinMetadata<0x31339b3fe1c1a010ac0deed7cbb7741ad1c6b6da31335413c0451e130da9ae08::futuwxq_coin::FUTUWXQ_COIN>"),
        "objectId": String("0x9a475ca4e02d0952d4d814ef63fabe998e55422c72bdad993e156787b6870e21"),
        "version": String("690680"),
        "digest": String("5BM7JxrFDVt3K4NEnngdtoMsd8fwUa7P1ziDk9dzEBi8"),
    },
    Object {
        "type": String("created"),
        "sender": String("0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e"),
        "owner": Object {
            "AddressOwner": String("0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e"),
        },
        "objectType": String("0x2::coin::TreasuryCap<0x31339b3fe1c1a010ac0deed7cbb7741ad1c6b6da31335413c0451e130da9ae08::futuwxq_coin::FUTUWXQ_COIN>"),
        "objectId": String("0xb4ae5bb66054ba09778072f8ce719c32c5c2acc8e7a442cf36afef7329aa6266"),
        "version": String("690680"),
        "digest": String("DkeBfxUXf6YPQX5CAXav3aYwrhJzzHqHDmVwwqqioHqe"),
    },
]
----- Balance changes ----
Array [
    Object {
        "owner": Object {
            "AddressOwner": String("0xfc0d9171fb19b1fcb0f6c07ff88a36610d69fa0aceaf3b2b9bb1d91a9676692e"),
        },
        "coinType": String("0x2::sui::SUI"),
        "amount": String("-12941880"),
    },
]
```
