# 学习日志

## 2023-11-13
安装SUI钱包浏览器插件,创建surf钱包保存助记词。 

## 2023-11-13

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

## 2023-12-6 第二周

1. 学习NFT的基础知识。
2.按照官方的例子编写第一个NFT项目。中间用到ipfs，学习了怎么建立ipsf节点并且上传图片文件。
3.学习怎么编写一个剪刀石头布的小游戏。
4.和已经发布的package进行交互。
sui client call --gas-budget 10000000 --package 0x2fcb68cc4a1c2331ef4008927b8e17c671f2b0057279d28dea8eecf3ca13e1ae --module game --function play --args 0xcc22b33aaddce982217364a69223a0125454ace30596d6f000c82160b73edf63  0




----- Transaction Digest ----
9EmNGXrNMTgt6C3wWk3tJvNYbGCaTjLZd6vtq9mUusu7
----- Transaction Data ----
Transaction Signature: [Signature(Ed25519SuiSignature(Ed25519SuiSignature([0, 21, 21, 95, 131, 205, 37, 26, 222, 213, 71, 197, 33, 101, 145, 190, 172, 126, 115, 204, 230, 195, 140, 157, 182, 174, 84, 88, 44, 231, 152, 74, 230, 233, 80, 112, 215, 137, 222, 168, 90, 25, 10, 93, 11, 127, 22, 126, 31, 115, 227, 47, 165, 247, 167, 31, 69, 172, 20, 66, 106, 28, 179, 126, 8, 4, 128, 237, 187, 161, 204, 81, 91, 56, 85, 200, 229, 125, 150, 46, 137, 92, 198, 181, 85, 147, 238, 207, 176, 12, 179, 200, 160, 42, 84, 94, 55])))]
Transaction Kind : Programmable
Inputs: [Object(SharedObject { object_id: 0xcc22b33aaddce982217364a69223a0125454ace30596d6f000c82160b73edf63, initial_shared_version: SequenceNumber(6), mutable: false }), Pure(SuiPureValue { value_type: Some(U8), value: 0 })]
Commands: [
  MoveCall(0x2fcb68cc4a1c2331ef4008927b8e17c671f2b0057279d28dea8eecf3ca13e1ae::game::play(Input(0),Input(1))),
]

Sender: 0x74f6cb2fc146f881a816b62b99c9f1b45946a64d0424be6f1c5fc5934173dc1d
Gas Payment: Object ID: 0x67d6cc9d27c44b8a3380fc6aa14d7c13233297a5b506a64d479c429faf4a7648, version: 0x6, digest: BL19Nkssex5NV9KNcWQywVMhuYdZprqQQ4E5xdRxWMLa 
Gas Owner: 0x74f6cb2fc146f881a816b62b99c9f1b45946a64d0424be6f1c5fc5934173dc1d
Gas Price: 1000
Gas Budget: 10000000

----- Transaction Effects ----
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9EmNGXrNMTgt6C3wWk3tJvNYbGCaTjLZd6vtq9mUusu7                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1                                                                                 │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x67d6cc9d27c44b8a3380fc6aa14d7c13233297a5b506a64d479c429faf4a7648                         │
│  │ Owner: Account Address ( 0x74f6cb2fc146f881a816b62b99c9f1b45946a64d0424be6f1c5fc5934173dc1d )  │
│  │ Version: 7                                                                                     │
│  │ Digest: 5f56MaRxkpsjyi3PpJnN17NvQauKMhY6JcVqw4bKKqnK                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xcc22b33aaddce982217364a69223a0125454ace30596d6f000c82160b73edf63                         │
│  │ Version: 6                                                                                     │
│  │ Digest: 6RSbfRVPtXYyU3RBrBCMT1U3gGAKn1eTXpPwzrLcxaqm                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x67d6cc9d27c44b8a3380fc6aa14d7c13233297a5b506a64d479c429faf4a7648                         │
│  │ Owner: Account Address ( 0x74f6cb2fc146f881a816b62b99c9f1b45946a64d0424be6f1c5fc5934173dc1d )  │
│  │ Version: 7                                                                                     │
│  │ Digest: 5f56MaRxkpsjyi3PpJnN17NvQauKMhY6JcVqw4bKKqnK                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000                                                                           │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    HH283q7LHbUHzau2xtCdMtYgmMYCNX8SGaBWd3JhDxGE                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array [
    Object {
        "id": Object {
            "txDigest": String("9EmNGXrNMTgt6C3wWk3tJvNYbGCaTjLZd6vtq9mUusu7"),
            "eventSeq": String("0"),
        },
        "packageId": String("0x2fcb68cc4a1c2331ef4008927b8e17c671f2b0057279d28dea8eecf3ca13e1ae"),
        "transactionModule": String("game"),
        "sender": String("0x74f6cb2fc146f881a816b62b99c9f1b45946a64d0424be6f1c5fc5934173dc1d"),
        "type": String("0x2fcb68cc4a1c2331ef4008927b8e17c671f2b0057279d28dea8eecf3ca13e1ae::game::Result"),
        "parsedJson": Object {
            "status": Number(1),
        },
        "bcs": String("2"),
    },
]
----- Object changes ----

Mutated Objects: 
 ┌──
 │ ObjectID: 0x67d6cc9d27c44b8a3380fc6aa14d7c13233297a5b506a64d479c429faf4a7648
 │ Sender: 0x74f6cb2fc146f881a816b62b99c9f1b45946a64d0424be6f1c5fc5934173dc1d 
 │ Owner: Account Address ( 0x74f6cb2fc146f881a816b62b99c9f1b45946a64d0424be6f1c5fc5934173dc1d )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 0x7
 │ Digest: 5f56MaRxkpsjyi3PpJnN17NvQauKMhY6JcVqw4bKKqnK
 └──

----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x74f6cb2fc146f881a816b62b99c9f1b45946a64d0424be6f1c5fc5934173dc1d ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -1009880
 └──

