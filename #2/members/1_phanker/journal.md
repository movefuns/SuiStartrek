# 学习日志

# Roadmap 1

## 1) sui 环境的搭建

因为设备资源问题，我选择二进制安装。

### 1.二进制安装：

#### 优点

二进制安装不需要依赖 rust 环境，只需要下载[sui的二进制](https://github.com/MystenLabs/sui/releases)
，然后配置到宿主机的环境变量即可，对系统资源不强的设备友好

#### 缺点：

因为 sui 的版本更新频繁，所有需要频繁下载二进制文件，比较繁琐

### 2.源码安装:

#### 优点

通过 rust 的工具链，可以随时更新最新的 sui 版本

#### 缺点

需要依赖 rust 环境，配置 rust 的环境非常消耗系统资源，设备性能不强的可能导致各种问题，而且操作起来繁琐，但是只要配置好之后，后面就比较方便

### 3.测试
``` shell
sui --version  ##查看sui 的版本信息
sui 1.13.0-64fe2b6 ##显示结果表示安装成功
```

## 2) 前端与sui的交互

### 1.[demo地址](https://github.com/phanker/interact_sui_react_demo)

### 2.已实现功能

#### ①.选择安装的钱包，完成钱包的连接

#### ②.根据当前连接的钱包，获取钱包的所属信息

#### ③.展示效果

![img.png](img.png)

### 3.遇到的问题

#### ①. [@mysten/create-dapp](https://sui-typescript-docs.vercel.app/dapp-kit/create-dapp) node版本问题导致pnpm安装dapp template失败

##### 解决：升级node到最新版本

#### ②.集成的@mysten/dapp-kit库版本问题，导致点击页面connect wallet按钮失效

##### 解决： @mysten/dapp-kit版本降到"0.0.0-experimental-20231110195743"

## 3) 发布ERC20合约
### 1.初始化move项目
```shell
sui move new move_project ##创建一个新的move项目
```
### 2.修改Move.toml
[package]
name = "move_coin"
version = "0.0.1"

[dependencies]
//注意rev的版本一定要和发布到的环境版本一直，比如dev环境对应的devnet版本

Sui = { git = "https://github.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "
framework/devnet" }
[addresses]
move_coin = "0x0"

### 3.创建ERC20合约

#### 根据[sui官网](https://examples.sui-book.com/samples/coin.html)的介绍，创建ERC20合约

### 4.部署合约
```shell
sui client publish --gas-budget 100000000 ##gas-budget 参数表示部署合约预估的gas费
###部署成功后将是如下展示如何信息
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING move_coin
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
Go5sKifiFS1hPdFWSCgu1FVKTJbrL6mgCeFg2Ta4EEyv
----- Transaction Data ----
Transaction Signature: [Signature(Ed25519SuiSignature(Ed25519SuiSignature([0, 193, 49, 115, 129, 63, 0, 66, 119, 201, 60, 95, 202, 1, 134, 116, 41, 
5, 58, 89, 109, 105, 191, 210, 221, 148, 110, 146, 129, 155, 247, 59, 133, 110, 251, 6, 66, 143, 226, 196, 148, 132, 208, 115, 18, 95, 255, 213, 130
, 138, 67, 210, 198, 127, 49, 3, 63, 80, 82, 17, 62, 216, 88, 141, 4, 11, 13, 69, 14, 208, 198, 251, 31, 175, 3, 215, 46, 221, 32, 135, 128, 156, 171, 180, 241, 83, 17, 5, 150, 189, 143, 64, 43, 69, 168, 152, 166])))]
Transaction Kind : Programmable
Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7" })]
Commands: [
  Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002),
  TransferObjects([Result(0)],Input(0)),
]

Sender: 0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7
Gas Payment: Object ID: 0x6eba3e64d49bf2c4e5861d60fbdabd569848db18e9cc43336fb41c967ef2b8e1, version: 0x8, digest: 8aQeYVPawC8ZSiAuhhDSNUuqknmmEM1ktMgu8nAzahYs
Gas Owner: 0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7
Gas Price: 1000
Gas Budget: 100000000

----- Transaction Effects ----
Status : Success
Created Objects:
  - ID: 0x31ef5e5f6d606fc748d59445d49573ad9832becad27fcf7fae34ea8b130d394a , Owner: Account Address ( 0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7 )
  - ID: 0x802c8ce75e897048b24cbbf73d669428b63015dafddc1d67b9ada532fcecc0de , Owner: Immutable
  - ID: 0xeb9d10d3179a407ff6b6feec1043d92ac7f26878d621e3e2612c45a85999561e , Owner: Account Address ( 0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7 )
  - ID: 0xf0906936063f58a48a776f8d405ccf399f7ac00b077041360e595ef39918237d , Owner: Immutable
Mutated Objects:
  - ID: 0x6eba3e64d49bf2c4e5861d60fbdabd569848db18e9cc43336fb41c967ef2b8e1 , Owner: Account Address ( 0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7 )

----- Events ----
Array []
----- Object changes ----
Array [
    Object {
        "type": String("mutated"),
        "sender": String("0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7"),
        "owner": Object {
            "AddressOwner": String("0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7"),
        },
        "objectType": String("0x2::coin::Coin<0x2::sui::SUI>"),
        "objectId": String("0x6eba3e64d49bf2c4e5861d60fbdabd569848db18e9cc43336fb41c967ef2b8e1"),
        "version": String("9"),
        "previousVersion": String("8"),
        "digest": String("75ioyKbPjhKGZPvYsrqT5jTE154GJz7bmjYTv4BmxNgp"),
    },
    Object {
        "type": String("created"),
        "sender": String("0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7"),
        "owner": Object {
            "AddressOwner": String("0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7"),
        },
        "objectType": String("0x2::coin::TreasuryCap<0x802c8ce75e897048b24cbbf73d669428b63015dafddc1d67b9ada532fcecc0de::mycoin::MYCOIN>"),
        "objectId": String("0x31ef5e5f6d606fc748d59445d49573ad9832becad27fcf7fae34ea8b130d394a"),
        "version": String("9"),
        "digest": String("5WVKqNVU2Wt64UvS6yzYGtogGZcbJU6T9FpRLMFgC4qF"),
    },
    Object {
        "type": String("published"),
        "packageId": String("0x802c8ce75e897048b24cbbf73d669428b63015dafddc1d67b9ada532fcecc0de"),
        "version": String("1"),
        "digest": String("35XJ6gomC81xQquH6CRBFtYkf3qNG2s4QAVnNfTW3Rzj"),
        "modules": Array [
            String("mycoin"),
        ],
    },
    Object {
        "type": String("created"),
        "sender": String("0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7"),
        "owner": Object {
            "AddressOwner": String("0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7"),
        },
        "objectType": String("0x2::package::UpgradeCap"),
        "objectId": String("0xeb9d10d3179a407ff6b6feec1043d92ac7f26878d621e3e2612c45a85999561e"),
        "version": String("9"),
        "digest": String("ASj6h9Uiraws8NUZCkuSnJjZDzJ2aDMrPeAfJg5eWAdd"),
    },
    Object {
        "type": String("created"),
        "sender": String("0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7"),
        "owner": String("Immutable"),
        "objectType": String("0x2::coin::CoinMetadata<0x802c8ce75e897048b24cbbf73d669428b63015dafddc1d67b9ada532fcecc0de::mycoin::MYCOIN>"),        
        "objectId": String("0xf0906936063f58a48a776f8d405ccf399f7ac00b077041360e595ef39918237d"),
        "version": String("9"),
        "digest": String("BPRY5ApmAkeJ1nGuDv9iKbX3FxtxhQua4fLWVsG8GDp8"),
    },
]
----- Balance changes ----
Array [
    Object {
        "owner": Object {
            "AddressOwner": String("0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7"),
        },
        "coinType": String("0x2::sui::SUI"),
        "amount": String("-12485880"),
    },
]


```

# Roadmap 2

## NFT发布

### [NFT合约地址](https://github.com/phanker/sui_ai_nft_generator/tree/master/contract/nft)  

#### [sui_ai_nft_generator](https://github.com/phanker/sui_ai_nft_generator/)这是一个基于AI模型，并根据输入的描述信息生成你想要的NFT的DAPP 

### NFT Object ID:[0x961f6935bfcf21d62ce0acea4cd1fcef98aba455cd7f496d3861a1841c9b5495](https://suiexplorer.com/object/0x961f6935bfcf21d62ce0acea4cd1fcef98aba455cd7f496d3861a1841c9b5495?network=mainnet)  

## 游戏
### 石头、剪刀、布 的比手势游戏
### [源码&Instruction](https://github.com/phanker/sui-game-finger-guessing)



# Roadmap 3

## 2048游戏

### [2048游戏合约源码](https://github.com/phanker/sui_game2048)
### 合约PackageId:[0x122e8da7cfa22c01e6ada67ac95e88d517ba6e02a3a19f4f6526a3d301af2810](https://suiexplorer.com/object/0x961f6935bfcf21d62ce0acea4cd1fcef98aba455cd7f496d3861a1841c9b5495?network=mainnet)  

### [2048游戏前端源码](https://github.com/phanker/game2048_frontend)

### [2048游戏试玩链接](https://black-disk-7038.on.fleek.co/)

## sui官方的PR贡献
1.https://github.com/MystenLabs/sui/pull/14848  
2.https://github.com/MystenLabs/sui/pull/15005  



