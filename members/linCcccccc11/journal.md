# 学习日志

## 2023-12-10
安装SUI钱包浏览器插件,创建surf钱包保存助记词。 

## 2023-12-10

### 1. mac搭建环境
#### 1)配置本地的terminal的proxy，可以访问外网 

#### 2)根据视频的介绍安装rust和sui binary 

#### 3) 检查sui安装成功

#### 4)获取dev网络的测试币 
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "钱包地址"
    }
}'

### 2.熟悉sui cli 
### 3. 学习SUI ERC20标准，并且尝试自己写一个.编译并且发布package。

[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.15.0
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING week1
Skipping dependency verification
----- Transaction Digest ----
8Bs7YVUa7EQiqJwtW97ad1Dp3K793K2GkjvYoBNp2ndD
----- Transaction Data ----
Transaction Signature: [Signature(Ed25519SuiSignature(Ed25519SuiSignature([0, 61, 30, 146, 174, 242, 130, 246, 155, 248, 58, 192, 22, 218, 91, 188, 27, 221, 1, 62, 183, 10, 60, 115, 83, 94, 189, 5, 167, 214, 39, 85, 31, 2, 219, 111, 68, 223, 214, 221, 21, 83, 92, 193, 9, 161, 170, 119, 111, 208, 201, 1, 160, 166, 129, 34, 224, 245, 108, 221, 161, 126, 118, 6, 15, 21, 122, 124, 237, 14, 144, 219, 190, 62, 236, 4, 85, 217, 65, 193, 248, 86, 67, 212, 33, 212, 162, 68, 167, 220, 186, 195, 203, 124, 3, 24, 45])))]
Transaction Kind : Programmable
Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1" })]
Commands: [
  Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002),
  TransferObjects([Result(0)],Input(0)),
]

Sender: 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1
Gas Payment: Object ID: 0xe61c3e3a1f4d03deb3f0d01a5140371e821a9c506c46ce6ee72f9d8efba4fccf, version: 0x24, digest: 2q2bsTvyFT7gTPrVvaDuLJgruoZV4iGRH3s1VqqaG6LW 
Gas Owner: 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1
Gas Price: 1000
Gas Budget: 10000000000

----- Transaction Effects ----
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8Bs7YVUa7EQiqJwtW97ad1Dp3K793K2GkjvYoBNp2ndD                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 3                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0084d29207065222248276c2df5757b56623fcc11ef5e080a905151b5c6daec8                         │
│  │ Owner: Account Address ( 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1 )  │
│  │ Version: 37                                                                                    │
│  │ Digest: CCVcQP82s1FCi3rh74p6ZpYDKAz9SnRWxQp8rmd9be93                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x609fb6569ebdf305091a67413d8fd3d90d68acacb85215001b5a511ec1dca02c                         │
│  │ Owner: Account Address ( 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1 )  │
│  │ Version: 37                                                                                    │
│  │ Digest: BPomAGv9F9JLERWMXj5AuZEzqW3zkXjchVjxs7pKJcED                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x81d6bbd4db28cd3a16ec94e42b61624f975e32fc3dbf2892ded1fef27336014a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: ByeuehSZGAboUTzBsZyhN8gRgwJ4c6im1wsDTwwAdAuE                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe854790a27c81fc63409dab77ac2f3a2f3d2a8bdf90a8a856feb85dec1c502bb                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 37                                                                                    │
│  │ Digest: 7VbZqShxnAq65q2b2agMD48WAb7CxUsmDAJAaWD1z4J8                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xe61c3e3a1f4d03deb3f0d01a5140371e821a9c506c46ce6ee72f9d8efba4fccf                         │
│  │ Owner: Account Address ( 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1 )  │
│  │ Version: 37                                                                                    │
│  │ Digest: 7a3ydB7xG2h2shJh64a1ciBq7utfqUPyEcRcmWRTu81T                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xe61c3e3a1f4d03deb3f0d01a5140371e821a9c506c46ce6ee72f9d8efba4fccf                         │
│  │ Owner: Account Address ( 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1 )  │
│  │ Version: 37                                                                                    │
│  │ Digest: 7a3ydB7xG2h2shJh64a1ciBq7utfqUPyEcRcmWRTu81T                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 12190400                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    8GQXjBaLH6ErkX6A699iw7eM5FD9Bw8wQ2oDTCMFPNaZ                                                   │
│    B6ZNK69zQmFmUYXTuR67B2kQUKCAp1oJYZKYPSxsp9A8                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x0084d29207065222248276c2df5757b56623fcc11ef5e080a905151b5c6daec8
 │ Sender: 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1 
 │ Owner: Account Address ( 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1 )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 0x25
 │ Digest: CCVcQP82s1FCi3rh74p6ZpYDKAz9SnRWxQp8rmd9be93
 └──

 ┌──
 │ ObjectID: 0x609fb6569ebdf305091a67413d8fd3d90d68acacb85215001b5a511ec1dca02c
 │ Sender: 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1 
 │ Owner: Account Address ( 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1 )
 │ ObjectType: 0x2::coin::TreasuryCap<0x81d6bbd4db28cd3a16ec94e42b61624f975e32fc3dbf2892ded1fef27336014a::sun::SUN> 
 │ Version: 0x25
 │ Digest: BPomAGv9F9JLERWMXj5AuZEzqW3zkXjchVjxs7pKJcED
 └──

 ┌──
 │ ObjectID: 0xe854790a27c81fc63409dab77ac2f3a2f3d2a8bdf90a8a856feb85dec1c502bb
 │ Sender: 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1 
 │ Owner: Immutable
 │ ObjectType: 0x2::coin::CoinMetadata<0x81d6bbd4db28cd3a16ec94e42b61624f975e32fc3dbf2892ded1fef27336014a::sun::SUN> 
 │ Version: 0x25
 │ Digest: 7VbZqShxnAq65q2b2agMD48WAb7CxUsmDAJAaWD1z4J8
 └──


Mutated Objects: 
 ┌──
 │ ObjectID: 0xe61c3e3a1f4d03deb3f0d01a5140371e821a9c506c46ce6ee72f9d8efba4fccf
 │ Sender: 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1 
 │ Owner: Account Address ( 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 0x25
 │ Digest: 7a3ydB7xG2h2shJh64a1ciBq7utfqUPyEcRcmWRTu81T
 └──


Published Objects: 
 ┌──
 │ PackageID: 0x81d6bbd4db28cd3a16ec94e42b61624f975e32fc3dbf2892ded1fef27336014a 
 │ Version: 0x1 
 │ Digest: ByeuehSZGAboUTzBsZyhN8gRgwJ4c6im1wsDTwwAdAuE
 | Modules: sun
 └──

----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x8be87988301604b519875d5a859aeebe9422870a3324b9e0cd1c0ddd64b5a9c1 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -12212280
 └──
