# 学习日志

# Roadmap 1

## 1 配置环境

### 1.1 安装依赖

根据官方文档，按需要安装一些依赖 [Install Sui](https://docs.sui.io/guides/developer/getting-started/sui-install#prerequisites)

### 1.2 安装Sui二进制文件

1. cargo install 直接下载sui binaries

```
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
```
2. 检验binaries是否安装成功
```
sui --version
```
终端输出
```
sui 1.20.0-f9dd2b1e1
```

### 1.3 Sui CLI

1. sui client

```
sui-client 
Client for interacting with the Sui network

USAGE:
    sui client [OPTIONS] [SUBCOMMAND]

OPTIONS:
        --client.config <CONFIG>    Sets the file storing the state of our user accounts (an empty
                                    one will be created if missing)
    -h, --help                      Print help information
        --json                      Return command outputs in json format

SUBCOMMANDS:
    active-address            Default address used for commands when none specified
    active-env                Default environment used for commands when none specified
    addresses                 Obtain the Addresses managed by the client
    call                      Call Move function
    create-example-nft        Create an example NFT
    dynamic-field             Query a dynamic field by its address
    envs                      List all Sui environments
    execute-signed-tx         Execute a Signed Transaction. This is useful when the user prefers
                                  to sign elsewhere and use this command to execute
    gas                       Obtain all gas objects owned by the address
    help                      Print this message or the help of the given subcommand(s)
    merge-coin                Merge two coin objects into one coin
    new-address               Generate new address and keypair with keypair scheme flag {ed25519
                                  | secp256k1 | secp256r1} with optional derivation path, default to
                                  m/44'/784'/0'/0'/0' for ed25519 or m/54'/784'/0'/0/0 for secp256k1
                                  or m/74'/784'/0'/0/0 for secp256r1
    new-env                   Add new Sui environment
    object                    Get object info
    objects                   Obtain all objects owned by the address
    pay                       Pay coins to recipients following specified amounts, with input
                                  coins. Length of recipients must be the same as that of amounts
    pay_all_sui               Pay all residual SUI coins to the recipient with input coins,
                                  after deducting the gas cost. The input coins also include the
                                  coin for gas payment, so no extra gas coin is required
    pay_sui                   Pay SUI coins to recipients following following specified amounts,
                                  with input coins. Length of recipients must be the same as that of
                                  amounts. The input coins also include the coin for gas payment, so
                                  no extra gas coin is required
    publish                   Publish Move modules
    serialize-transfer-sui    Serialize a transfer that can be signed. This is useful when user
                                  prefers to take the data to sign elsewhere
    split-coin                Split a coin object into multiple coins
    switch                    Switch active address and network(e.g., devnet, local rpc server)
    transfer                  Transfer object
    transfer-sui              Transfer SUI, and pay gas with the same SUI coin object. If amount
                                  is specified, only the amount is transferred; otherwise the entire
                                  object is transferred
    verify-source             Verify local Move packages against on-chain packages, and
                                  optionally their dependencies
```

2. 管理网络
```
切换网络: sui client switch --env [network alias]
默认网络别名:
本地网 localnet: http://0.0.0.0:9000
开发网 devnet: https://fullnode.devnet.sui.io:443
列出当前所有网络别名: sui client envs
添加新的网络别名: sui client new-env --alias <ALIAS> --rpc <RPC>
```
3. 查询启用地址和Gas Object
```
查询当前保存了密钥的地址: sui client addresses
查询当前启用的地址: sui client active-address
列出所拥有的 gas objects: sui client gas
```

### 1.4 领水
```
curl --location --request POST 'https://faucet.devnet.sui.io/gas' --header 'Content-Type: application/json' --data-raw '{"FixedAmountRequest":{"recipient":"0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583"}}'
curl --location --request POST 'https://fullnode.testnet.sui.io:443' --header 'Content-Type: application/json' --data-raw '{"FixedAmountRequest":{"recipient":"0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583"}}'
```

## 2 发布合约
### 2.1 hello_world

```
sui move new hello_world
```

hello_world.move
```
module hello_world::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// An object that contains an arbitrary string
    struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    #[lint_allow(self_transfer)]
    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }

}
```

编译
```
sui move build
```

发布
```
sui client publish --gas-budget 10000000
```
部署成功，输出如下
```
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Successfully verified dependencies on-chain against source.
Transaction Digest: GchW9TBRVSrdYnG7AtDaUJzhY5nQFAcmPHfsYJG6wV13
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                   │
│ Gas Owner: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                                    │
│  │ Version: 7                                                                                                │
│  │ Digest: G4JkD8GPmzNH7eac11skMb2vbKw3tRfADSi7cUr2H9r1                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    dbrftfnBawmCKSl9lnp7rz9q0EleEYxMf52qTm9RfkN2gooD0uEGp9dhF7hgKcNoM8KTJu06OWT2IGunrnRSfA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GchW9TBRVSrdYnG7AtDaUJzhY5nQFAcmPHfsYJG6wV13                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 112                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2664f32a48196d7e228f1ba82a4b8bf7bdd00d32284db5150b2329c90d42b1f5                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 8ptSXVz9HMbvKQDkME4WFmoj2ug8MWXwdVzoWKWV7a8z                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xcc8ab9a5b5af535f7828aaa88634bd61821a66f496bbb1a6e3089a2309c61011                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 8                                                                                     │
│  │ Digest: B3w3twPhoR988TU3PssRVQi2zkM6g4kKdz5odSJnxERj                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 8                                                                                     │
│  │ Digest: CXNrAuD4WtNRbGR92aeZhZNqkjyWudAvn8Lf4BYBDDes                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 8                                                                                     │
│  │ Digest: CXNrAuD4WtNRbGR92aeZhZNqkjyWudAvn8Lf4BYBDDes                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7957200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    A39eLqHoDpw3oDMMrH5R7FsY85FMKbsBGjMNUk17X8BJ                                                   │
│    JCF8oEH8SuaAs2zZBoFHvoU29ty3gSrqqpw5DscZHA7x                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xcc8ab9a5b5af535f7828aaa88634bd61821a66f496bbb1a6e3089a2309c61011                  │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                    │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 8                                                                                    │
│  │ Digest: B3w3twPhoR988TU3PssRVQi2zkM6g4kKdz5odSJnxERj                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                  │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                    │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 8                                                                                    │
│  │ Digest: CXNrAuD4WtNRbGR92aeZhZNqkjyWudAvn8Lf4BYBDDes                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x2664f32a48196d7e228f1ba82a4b8bf7bdd00d32284db5150b2329c90d42b1f5                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 8ptSXVz9HMbvKQDkME4WFmoj2ug8MWXwdVzoWKWV7a8z                                          │
│  │ Modules: hello_world                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7979080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

suiexplorer：https://suiexplorer.com/object/0x2664f32a48196d7e228f1ba82a4b8bf7bdd00d32284db5150b2329c90d42b1f5?network=devnet

调用：
```
sui client call --function mint --module hello_world --package 0x2664f32a48196d7e228f1ba82a4b8bf7bdd00d32284db5150b2329c90d42b1f5 --gas-budget 300000000
```
```
Transaction Digest: 3Z45EZFTWV8oqw5EyBoeJy4fqv2Nud7g8JWWHt1j5PSj
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                  │
│ Gas Owner: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583               │
│ Gas Budget: 300000000 MIST                                                                  │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                   │
│  │ Version: 8                                                                               │
│  │ Digest: CXNrAuD4WtNRbGR92aeZhZNqkjyWudAvn8Lf4BYBDDes                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│   No input objects for this transaction                                                     │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  mint                                                               │        │
│ │  │ Module:    hello_world                                                        │        │
│ │  │ Package:   0x2664f32a48196d7e228f1ba82a4b8bf7bdd00d32284db5150b2329c90d42b1f5 │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    nBbZXu6+dxW6t+ADHIy0huQh7XMGFqn14wxNmIySvLkmS4FebN4XRkmF9poDEeagi8uTNW7e8BidUgePGG/xhw== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3Z45EZFTWV8oqw5EyBoeJy4fqv2Nud7g8JWWHt1j5PSj                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 147                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x51e16bd63ee42c0a7774f5c04ba168536794e2e7988ea388b69a5a02cbaa55be                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 9                                                                                     │
│  │ Digest: 3HXLqqRTJyhbyvusf47MBMLpqCaZ2sp7WRgtKzUneQTy                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 9                                                                                     │
│  │ Digest: 7wRmhDBmL39aCvVfq4R2sfSmuHPtvLkNJ7FYPre2eBa2                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 9                                                                                     │
│  │ Digest: 7wRmhDBmL39aCvVfq4R2sfSmuHPtvLkNJ7FYPre2eBa2                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2485200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    GchW9TBRVSrdYnG7AtDaUJzhY5nQFAcmPHfsYJG6wV13                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                    │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                  │
│  ┌──                                                                                                              │
│  │ ObjectID: 0x51e16bd63ee42c0a7774f5c04ba168536794e2e7988ea388b69a5a02cbaa55be                                   │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                     │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )                  │
│  │ ObjectType: 0x2664f32a48196d7e228f1ba82a4b8bf7bdd00d32284db5150b2329c90d42b1f5::hello_world::HelloWorldObject  │
│  │ Version: 9                                                                                                     │
│  │ Digest: 3HXLqqRTJyhbyvusf47MBMLpqCaZ2sp7WRgtKzUneQTy                                                           │
│  └──                                                                                                              │
│ Mutated Objects:                                                                                                  │
│  ┌──                                                                                                              │
│  │ ObjectID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                                   │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                     │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )                  │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                     │
│  │ Version: 9                                                                                                     │
│  │ Digest: 7wRmhDBmL39aCvVfq4R2sfSmuHPtvLkNJ7FYPre2eBa2                                                           │
│  └──                                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2507080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

对应的object id：0x51e16bd63ee42c0a7774f5c04ba168536794e2e7988ea388b69a5a02cbaa55be

![alt text](./img/image1.png)
可以看到object的text字段为：Hello World!

### 2.2 ERC20

my_first_coin.move
```
module my_first_coin::my_first_coin {

    // Part 1: Imports
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // Part 2: Struct definitions
    struct Sword has key, store {
        id: UID,
        magic: u64,
        strength: u64,
    }

    struct Forge has key, store {
        id: UID,
        swords_created: u64,
    }

    // Part 3: Module initializer to be executed when this module is published
    fun init(ctx: &mut TxContext) {
        let admin = Forge {
            id: object::new(ctx),
            swords_created: 0,
        };
        // Transfer the forge object to the module/package publisher
        transfer::transfer(admin, tx_context::sender(ctx));
    }

    // Part 4: Accessors required to read the struct attributes
    public fun magic(self: &Sword): u64 {
        self.magic
    }

    public fun strength(self: &Sword): u64 {
        self.strength
    }

    public fun swords_created(self: &Forge): u64 {
        self.swords_created
    }

    // Part 5: Public/entry functions (introduced later in the tutorial)

    // Part 6: Private functions (if any)

}

```


测试
```
sui move test
```
输出
```
BUILDING Sui
BUILDING MoveStdlib
BUILDING my_first_package
Running Move unit tests
Test result: OK. Total tests: 0; passed: 0; failed: 0
```

添加测试用例

```
    #[test]
    public fun test_sword_create() {

        // Create a dummy TxContext for testing
        let ctx = tx_context::dummy();

        // Create a sword
        let sword = Sword {
            id: object::new(&mut ctx),
            magic: 42,
            strength: 7,
        };

        // Check if accessor functions return correct values
        assert!(magic(&sword) == 42 && strength(&sword) == 7, 1);
        // Create a dummy address and transfer the sword
        let dummy_address = @0xCAFE;
        transfer::transfer(sword, dummy_address);
    }
```

再次测试
```
sui move test
```
测试通过
```
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING my_first_coin
Running Move unit tests
[ PASS    ] 0x0::my_first_coin::test_sword_create
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

添加特殊测试
```
    public entry fun sword_create(magic: u64, strength: u64, recipient: address, ctx: &mut TxContext) {
        use sui::transfer;

        // create a sword
        let sword = Sword {
            id: object::new(ctx),
            magic: magic,
            strength: strength,
        };
        // transfer the sword
        transfer::transfer(sword, recipient);
    }

    public entry fun sword_transfer(sword: Sword, recipient: address, _ctx: &mut TxContext) {
        use sui::transfer;
        // transfer the sword
        transfer::transfer(sword, recipient);
    }
```

```
    #[test]
    fun test_sword_transactions() {
        use sui::test_scenario;

        // create test addresses representing users
        let admin = @0xBABE;
        let initial_owner = @0xCAFE;
        let final_owner = @0xFACE;

        // first transaction to emulate module initialization
        let scenario_val = test_scenario::begin(admin);
        let scenario = &mut scenario_val;
        {
            init(test_scenario::ctx(scenario));
        };
        // second transaction executed by admin to create the sword
        test_scenario::next_tx(scenario, admin);
        {
            // create the sword and transfer it to the initial owner
            sword_create(42, 7, initial_owner, test_scenario::ctx(scenario));
        };
        // third transaction executed by the initial sword owner
        test_scenario::next_tx(scenario, initial_owner);
        {
            // extract the sword owned by the initial owner
            let sword = test_scenario::take_from_sender<Sword>(scenario);
            // transfer the sword to the final owner
            sword_transfer(sword, final_owner, test_scenario::ctx(scenario))
        };
        // fourth transaction executed by the final sword owner
        test_scenario::next_tx(scenario, final_owner);
        {
            // extract the sword owned by the final owner
            let sword = test_scenario::take_from_sender<Sword>(scenario);
            // verify that the sword has expected properties
            assert!(magic(&sword) == 42 && strength(&sword) == 7, 1);
            // return the sword to the object pool
            test_scenario::return_to_sender(scenario, sword)
            // or uncomment the line below to destroy the sword instead
            // test_utils::destroy(sword)
        };
        test_scenario::end(scenario_val);
    }
```

测试通过
```
Running Move unit tests
[ PASS    ] 0x0::my_first_coin::test_sword_create
[ PASS    ] 0x0::my_first_coin::test_sword_transactions
Test result: OK. Total tests: 2; passed: 2; failed: 0
```


发布，提高gas
```
sui client publish --gas-budget 20000000
```

```
Successfully verified dependencies on-chain against source.
Transaction Digest: 4Ww3oVCbcwDykxiajF61vQE2qSzHgexMvBV5VavdKDp2
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                   │
│ Gas Owner: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                │
│ Gas Budget: 20000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                                    │
│  │ Version: 16                                                                                               │
│  │ Digest: AQHhRTnwn9YATacFtQSSmuLhV3AioE8RoF98KkZPiuxa                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    N5Z8AtlxH6LGjdKiQxQSCeBRCJb34RVCdm6O3jaebD0tKArutH1kkLQNH/hPpobHOz3AZIyd4r/mlKkJ99b7xw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4Ww3oVCbcwDykxiajF61vQE2qSzHgexMvBV5VavdKDp2                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 168                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbd298feee69b1d2ac186f795d4d29844e51fa08680550d0f463730dab58c9f38                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 6tjfuQnHxJ5S1WAB1FThrR6cWLZjJVShLgb2urjNbEdP                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe3b5e997bdebcc93d815999383058717bcd81692545de78d7968e849f5ae5354                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 17                                                                                    │
│  │ Digest: Ezb1HC8YAbmubV6pGYRGbhLW8GwTyka2Dks9dWkWW4jC                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xee7fd4af516fd46e2bbe9def8819a0e22b55ce4169a7135661786c0b7134a130                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 17                                                                                    │
│  │ Digest: Fq56jthFEYTw9T2GqpEcdSWnMJLmZBxw9JHq1SjpAhHr                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 17                                                                                    │
│  │ Digest: tw1Tn68T38R8rov8vXuUnxtoMEcsvZEBTYr6epVL8EG                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 17                                                                                    │
│  │ Digest: tw1Tn68T38R8rov8vXuUnxtoMEcsvZEBTYr6epVL8EG                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 10419600 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    A39eLqHoDpw3oDMMrH5R7FsY85FMKbsBGjMNUk17X8BJ                                                   │
│    CSAUQCDSGhw7ESip6b6SBkJokcAeLgdGqz7hpVMSv4tP                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                         │
│  ┌──                                                                                                     │
│  │ ObjectID: 0xe3b5e997bdebcc93d815999383058717bcd81692545de78d7968e849f5ae5354                          │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                            │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )         │
│  │ ObjectType: 0xbd298feee69b1d2ac186f795d4d29844e51fa08680550d0f463730dab58c9f38::my_first_coin::Forge  │
│  │ Version: 17                                                                                           │
│  │ Digest: Ezb1HC8YAbmubV6pGYRGbhLW8GwTyka2Dks9dWkWW4jC                                                  │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ ObjectID: 0xee7fd4af516fd46e2bbe9def8819a0e22b55ce4169a7135661786c0b7134a130                          │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                            │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )         │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                  │
│  │ Version: 17                                                                                           │
│  │ Digest: Fq56jthFEYTw9T2GqpEcdSWnMJLmZBxw9JHq1SjpAhHr                                                  │
│  └──                                                                                                     │
│ Mutated Objects:                                                                                         │
│  ┌──                                                                                                     │
│  │ ObjectID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                          │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                            │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                            │
│  │ Version: 17                                                                                           │
│  │ Digest: tw1Tn68T38R8rov8vXuUnxtoMEcsvZEBTYr6epVL8EG                                                   │
│  └──                                                                                                     │
│ Published Objects:                                                                                       │
│  ┌──                                                                                                     │
│  │ PackageID: 0xbd298feee69b1d2ac186f795d4d29844e51fa08680550d0f463730dab58c9f38                         │
│  │ Version: 1                                                                                            │
│  │ Digest: 6tjfuQnHxJ5S1WAB1FThrR6cWLZjJVShLgb2urjNbEdP                                                  │
│  │ Modules: my_first_coin                                                                                │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -10441480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

suiexplorer：https://suiexplorer.com/object/0xbd298feee69b1d2ac186f795d4d29844e51fa08680550d0f463730dab58c9f38?network=devnet

![alt text](./img/image2.png)

调用sword_create

```
sui client call --function sword_create --module my_first_coin --package 0xbd298feee69b1d2ac186f795d4d29844e51fa08680550d0f463730dab58c9f38 --args 42 7 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 --gas-budget 300000000
```
调用成功
```
Transaction Digest: HMHPFXt6yde5BjAHa1cANA6tryXNMU88fJbSUTt54j88
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                   │
│ Gas Owner: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                │
│ Gas Budget: 300000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                                    │
│  │ Version: 17                                                                                               │
│  │ Digest: tw1Tn68T38R8rov8vXuUnxtoMEcsvZEBTYr6epVL8EG                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: u64, Value: "42"                                                                     │ │
│ │ 1   Pure Arg: Type: u64, Value: "7"                                                                      │ │
│ │ 2   Pure Arg: Type: address, Value: "0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  sword_create                                                       │                         │
│ │  │ Module:    my_first_coin                                                      │                         │
│ │  │ Package:   0xbd298feee69b1d2ac186f795d4d29844e51fa08680550d0f463730dab58c9f38 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    zTEHw17zvi47o5OdLAemYw2aO274QplRU6+B52jy1wR2Nn1IOJ5wy4VLh0qpLZQquejpEql4fVcnp6agTfuxRQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HMHPFXt6yde5BjAHa1cANA6tryXNMU88fJbSUTt54j88                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 170                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x451e69cf999e70f18a102dfb975adaab6033285567899eead52b074f6955a6f0                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 18                                                                                    │
│  │ Digest: 8c8z1yJvEp3qvPyZHXmstMjAZ5JJ5fVnqBH6jFuwebLV                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 18                                                                                    │
│  │ Digest: 5ecCXYHMN1hMmaA8BM6BNAMoBkTHviLiDxX3iDQVHQdn                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 18                                                                                    │
│  │ Digest: 5ecCXYHMN1hMmaA8BM6BNAMoBkTHviLiDxX3iDQVHQdn                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2439600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4Ww3oVCbcwDykxiajF61vQE2qSzHgexMvBV5VavdKDp2                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                         │
│  ┌──                                                                                                     │
│  │ ObjectID: 0x451e69cf999e70f18a102dfb975adaab6033285567899eead52b074f6955a6f0                          │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                            │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )         │
│  │ ObjectType: 0xbd298feee69b1d2ac186f795d4d29844e51fa08680550d0f463730dab58c9f38::my_first_coin::Sword  │
│  │ Version: 18                                                                                           │
│  │ Digest: 8c8z1yJvEp3qvPyZHXmstMjAZ5JJ5fVnqBH6jFuwebLV                                                  │
│  └──                                                                                                     │
│ Mutated Objects:                                                                                         │
│  ┌──                                                                                                     │
│  │ ObjectID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                          │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                            │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                            │
│  │ Version: 18                                                                                           │
│  │ Digest: 5ecCXYHMN1hMmaA8BM6BNAMoBkTHviLiDxX3iDQVHQdn                                                  │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2461480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

suiexplorer：https://suiexplorer.com/txblock/HMHPFXt6yde5BjAHa1cANA6tryXNMU88fJbSUTt54j88?network=devnet

![alt text](./img/image3.png)

调用sword_transfer
```
sui client call --function sword_transfer --module my_first_coin --package 0xbd298feee69b1d2ac186f795d4d29844e51fa08680550d0f463730dab58c9f38 --args 0x451e69cf999e70f18a102dfb975adaab6033285567899eead52b074f6955a6f0 0x1d64dd7636bc11b4265f4720215841166c39d40056e1fdc3fef57d2c214e87ac --gas-budget 300000000
```
调用成功
```
Transaction Digest: 3adwtPbxW84Zw41nDtdRAMpJyhM2jopNffYze51QDoFb
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                   │
│ Gas Owner: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                                │
│ Gas Budget: 300000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                                    │
│  │ Version: 18                                                                                               │
│  │ Digest: 5ecCXYHMN1hMmaA8BM6BNAMoBkTHviLiDxX3iDQVHQdn                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x451e69cf999e70f18a102dfb975adaab6033285567899eead52b074f6955a6f0              │ │
│ │ 1   Pure Arg: Type: address, Value: "0x1d64dd7636bc11b4265f4720215841166c39d40056e1fdc3fef57d2c214e87ac" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  sword_transfer                                                     │                         │
│ │  │ Module:    my_first_coin                                                      │                         │
│ │  │ Package:   0xbd298feee69b1d2ac186f795d4d29844e51fa08680550d0f463730dab58c9f38 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    jr/ByzThJ3y4o9y02f3fiTLekSCQpyDTNbMIXrkT9cVjZ7yjWgTnzMeUhQHLeWgmUUqXmJM8r2SUwRgQ3Lk0ZQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3adwtPbxW84Zw41nDtdRAMpJyhM2jopNffYze51QDoFb                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 171                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x451e69cf999e70f18a102dfb975adaab6033285567899eead52b074f6955a6f0                         │
│  │ Owner: Account Address ( 0x1d64dd7636bc11b4265f4720215841166c39d40056e1fdc3fef57d2c214e87ac )  │
│  │ Version: 19                                                                                    │
│  │ Digest: UC2HpeJj7KSFWNmzaj3wniP4inHmjPgMgW1qBLEoXnU                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 19                                                                                    │
│  │ Digest: 46pB9YiMqJDgCLFSuw9oyN7QL7AQmYsGSZmLVWy9DC12                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                         │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ Version: 19                                                                                    │
│  │ Digest: 46pB9YiMqJDgCLFSuw9oyN7QL7AQmYsGSZmLVWy9DC12                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2439600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2415204 MIST                                                                   │
│    Non-refundable Storage Fee: 24396 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4Ww3oVCbcwDykxiajF61vQE2qSzHgexMvBV5VavdKDp2                                                   │
│    HMHPFXt6yde5BjAHa1cANA6tryXNMU88fJbSUTt54j88                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                         │
│  ┌──                                                                                                     │
│  │ ObjectID: 0x451e69cf999e70f18a102dfb975adaab6033285567899eead52b074f6955a6f0                          │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                            │
│  │ Owner: Account Address ( 0x1d64dd7636bc11b4265f4720215841166c39d40056e1fdc3fef57d2c214e87ac )         │
│  │ ObjectType: 0xbd298feee69b1d2ac186f795d4d29844e51fa08680550d0f463730dab58c9f38::my_first_coin::Sword  │
│  │ Version: 19                                                                                           │
│  │ Digest: UC2HpeJj7KSFWNmzaj3wniP4inHmjPgMgW1qBLEoXnU                                                   │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ ObjectID: 0x7646097ae1d9a9b850f7af0aa55a8c734eb5ab2a103e5fa23b5e8ca116598080                          │
│  │ Sender: 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583                            │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                            │
│  │ Version: 19                                                                                           │
│  │ Digest: 46pB9YiMqJDgCLFSuw9oyN7QL7AQmYsGSZmLVWy9DC12                                                  │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x6fc4a6fcee3908b9b9436fe96eb20e226012445d084d3a59dc31a404f2656583 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1024396                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

此时sword转移到另一个账户下
![alt text](./img/image4.png)