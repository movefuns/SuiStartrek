# 第一个 dAPP

+ dAPP 的开发流程如下：
    + 创建项目
    + 修改源码
    + 部署合约

## 1.创建项目
### 1.1 创建项目目录
```bash
mkdir hello 
cd hello
```
### 1.2 使用`pnpm`初始化项目
```bash
pnpm add @mysten/dapp-kit @mysten/sui.js @tanstack/react-query
```
结果：
```bash
Already up to date
Progress: resolved 101, reused 100, downloaded 0, added 0, done

dependencies:
+ @mysten/dapp-kit ^0.9.0
+ @mysten/sui.js ^0.46.1
+ @tanstack/react-query ^5.8.4

Done in 38s
```

```bash
pnpm create @mysten/create-dapp
```
结果：
```bash
Library/pnpm/store/v3/tmp/dlx-69154      | +108 +++++++++++
Library/pnpm/store/v3/tmp/dlx-69154      | Progress: resolved 108, reused 108, downloaded 0, added 108, done
✔ Which starter template would you like to use? · react-e2e-counter
✔ What is the name of your dApp? (this will be used as the directory name) · my-first-sui-dapp
```

## 2.修改源码

## 3.部署合约
### 3.1 发布
```bash
cd move
sui client publish --gas-budget 100000000 counter
```
结果
```bash
----- Transaction Digest ----
3jHEi2YnghmXSQFa125QEc6szc1CbC39NJbSLTJwMfoZ
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43                                                                                  │
│ Gas Owner: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43                                                                               │
│ Gas Budget: 100000000                                                                                                                                       │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                                                                                   │
│  │ Version: 64                                                                                                                                              │
│  │ Digest: Fh4YYPGoEXbE7q1NZTqAYazzkxaDPJAqGFJjeUHjf8WM                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    K4ZwsTQcBST41CnApgNokg/B0Jwac5tr/FuA4uGSBOva+MJfHUyzlP/W35+awmuzc33pn9gbocspuOsQ0y+KCg==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3jHEi2YnghmXSQFa125QEc6szc1CbC39NJbSLTJwMfoZ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 5                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1eea2dbb607e8d153f0c4292fa4ffc1248759c6b9425195294eb8a087d63b4fd                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 65                                                                                    │
│  │ Digest: 3BVBKnUjcHVwa2bhLvteqcCyxPW6UAGKMuBUNYHQgW7E                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdad62a2b0a63efc7a8d1d18979bead9d267244045244e281161268e8273eb2e1                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5X8RDLBmbXUrinaumyVbNSKQxK5mhEyvhpuy2oU9bQPA                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 65                                                                                    │
│  │ Digest: FVMNPvDuYvov2TRsHBsaqQ5qdXK6XtQz7t2w1VnKSsQA                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa                         │
│  │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )  │
│  │ Version: 65                                                                                    │
│  │ Digest: FVMNPvDuYvov2TRsHBsaqQ5qdXK6XtQz7t2w1VnKSsQA                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8747600                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3uDNfMiccL11X2CUpS18vLiPBTYmp3xEwQ329ZTKJXcr                                                   │
│    HUKvecodFjttC4143fQ7LKpCNEwswvq8QyLJHiN8bJBg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x1eea2dbb607e8d153f0c4292fa4ffc1248759c6b9425195294eb8a087d63b4fd
 │ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 65
 │ Digest: 3BVBKnUjcHVwa2bhLvteqcCyxPW6UAGKMuBUNYHQgW7E
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x134f92d6c5e70167c19548c55821cf8daced9513be197b9b3afefd5e12e253aa
 │ Sender: 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 65
 │ Digest: FVMNPvDuYvov2TRsHBsaqQ5qdXK6XtQz7t2w1VnKSsQA
 └──

Published Objects: 
 ┌──
 │ PackageID: 0xdad62a2b0a63efc7a8d1d18979bead9d267244045244e281161268e8273eb2e1 
 │ Version: 1 
 │ Digest: 5X8RDLBmbXUrinaumyVbNSKQxK5mhEyvhpuy2oU9bQPA
 | Modules: counter
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xf7aef823a3b9b6e0c7ef2223cb3c2ea13b1b5b14fcb25c3cecea8d47c96e8b43 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -8769480
 └──
```

### 3.2 部署前端
+ 更新前端代码，更新`src/constants.ts`中的`DEVNET_COUNTER_PACKAGE_ID`为上一步部署所创建的：
```json
"packageId": String("0xdad62a2b0a63efc7a8d1d18979bead9d267244045244e281161268e8273eb2e1")
```
+ 部署`pnpm` 程序
```bash
# 安装依赖
pnpm install
# 启动前端
pnpm dev

# 前端交互
# 1. 创建计数器
# 2. 自增计数器
# 3. 复位计数器
```
测试结果：
