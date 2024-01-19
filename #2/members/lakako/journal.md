# 学习日志

# Roadmap 1

## 安装

### 安装Sui命令行

系统是archlinux，使用asdf安装rust

由于asdf国内访问不是很流畅，请一定先配置好代理

```
asdf plugin add rust 
asdf install rust 1.74.0
asdf global rust 1.74.0
```
1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
```

安装sui binary，注意tmpfs的分区得给大一点（我给8g的时候提示空间不足，后来扩展到了16G），并且记得提前安装clang

安装clang: `paru -S clang`

安装sui binary：
```
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
```

安装完以后需要执行 `asdf reshim rust` 这样就可以在命令行里使用sui了

安装extension：

```
cargo install --git https://github.com/movebit/move --branch move-analyzer2-release move-analyzer
```
再去vscode里装好sui插件即可

基本上按照官方教程，这里不会有坑 `https://intro-zh.sui-book.com/unit-one/lessons/1_%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83.html`

## 2 配置sui client

切换到devnet

```
sui client switch --env devnet
```

查看可用的密钥地址

```
sui client addresses
```

我没有使用过sui，这里根据提示创建了一个钱包

领取测试token：

```
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{"FixedAmountRequest":{"recipient":"<WALLET ADDRESS>"}}'
```

## 学习sui move

### 创建hello world 模块

```
sui move new hello_move_world
```

创建source/hello.move，输入以下代码

```
module hello_move_world::counter {
    // Part 1: imports
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    // Part 2: struct definition
    struct Counter has key {
        id: UID,
        value: u64,
    }

    // Part 3: transfer the counter object to the sender
    entry public fun getCounter(ctx: &mut TxContext) {
        // sender address
        let sender = tx_context::sender(ctx);
        let counter_obj = Counter {
            id: object::new(ctx),
            value: 0
        };
        transfer::transfer(counter_obj, sender);
    }

    // part 4: public/ entry functions
    public entry fun incr(counter: &mut Counter) {
        counter.value = counter.value + 1;
    } 
}

```

编译

```
sui move build
```

这里会有一个警告，忽略即可

发布项目

```
sui client publish --gas-budget 50000000
```

成功后的输入如下所示


```
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
5s5R7h1sZUeUBemRpdrzD3xZJG9BFgT4uF1gMyzxoT9z
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c                                                                                  │
│ Gas Owner: 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c                                                                               │
│ Gas Budget: 50000000                                                                                                                                        │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0xd14d931da3090fa7d4590cb4e249a9444b3d9af9947a718678f2b43cbb74643b                                                                                   │
│  │ Version: 60                                                                                                                                              │
│  │ Digest: G5zV2GsL3kS1xjnT7b7aCs7YF8gPgdXSd6WjtFnjy1Zv                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    xOuBQXFdlHXgJFNF+ujfVSYbz93AbBOGuR4s4fnRvwOASW2/FFLcPFT60LJf8iB4WwEIaxzDsWxa3PIrOXLvAw==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5s5R7h1sZUeUBemRpdrzD3xZJG9BFgT4uF1gMyzxoT9z                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 4                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4aaefa61454d5810c89eb8a05a7d2e964f48da92189307bfc38fddf1aa1a9ae2                         │
│  │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c )  │
│  │ Version: 61                                                                                    │
│  │ Digest: HpdWAZDxJhjLRvpbcnh7A1RBsW17vk2vo9qZx4VxHsvb                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7d7e1286150b7b5c6093714acc279c531d629354f7fd261e69b8a7301bf5aabb                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 2wQPHGUd4jujmq9uLrLgGw1j3Rb4EiWz9y9XtXf7vWTB                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xd14d931da3090fa7d4590cb4e249a9444b3d9af9947a718678f2b43cbb74643b                         │
│  │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c )  │
│  │ Version: 61                                                                                    │
│  │ Digest: 58rqKfzpp1UQexjQBuN4auc5TwacoMUgHZftTTTdgv7H                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xd14d931da3090fa7d4590cb4e249a9444b3d9af9947a718678f2b43cbb74643b                         │
│  │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c )  │
│  │ Version: 61                                                                                    │
│  │ Digest: 58rqKfzpp1UQexjQBuN4auc5TwacoMUgHZftTTTdgv7H                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7402400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7HfcPS8kdcMc9WaeEog2eatQWkTdwyiADdzbzZc3Pgqz                                                   │
│    HUKvecodFjttC4143fQ7LKpCNEwswvq8QyLJHiN8bJBg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x4aaefa61454d5810c89eb8a05a7d2e964f48da92189307bfc38fddf1aa1a9ae2
 │ Sender: 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c 
 │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 61
 │ Digest: HpdWAZDxJhjLRvpbcnh7A1RBsW17vk2vo9qZx4VxHsvb
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0xd14d931da3090fa7d4590cb4e249a9444b3d9af9947a718678f2b43cbb74643b
 │ Sender: 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c 
 │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 61
 │ Digest: 58rqKfzpp1UQexjQBuN4auc5TwacoMUgHZftTTTdgv7H
 └──

Published Objects: 
 ┌──
 │ PackageID: 0x7d7e1286150b7b5c6093714acc279c531d629354f7fd261e69b8a7301bf5aabb 
 │ Version: 1 
 │ Digest: 2wQPHGUd4jujmq9uLrLgGw1j3Rb4EiWz9y9XtXf7vWTB
 | Modules: counter
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x26314cd98c06c36b8a7db425c874c57015f2a759d040180a79bb548d7636449c ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: 
```

可以在这里查看到记录：https://suiexplorer.com/txblock/5s5R7h1sZUeUBemRpdrzD3xZJG9BFgT4uF1gMyzxoT9z?network=devnet

调用以下刚刚创建的object

```
export PKGID=0x4aaefa61454d5810c89eb8a05a7d2e964f48da92189307bfc38fddf1aa1a9ae2
sui client call \                                                              
    --function getCounter \
    --module counter \
    --package $PKGID \
    --gas-budget 10000000
```

这里的pkgid别输错了，是publish object的package id

如果调用的function或module不对，会提示

```
Bcs field in object [...] is missing or not a package.
```

到https://suiexplorer.com/object/0x138161a08b4536a4a4ba8db02f65fb4a7d1519ba017c5de0925a159ec6e74722?network=devnet 中可以看到，目前的value是0

现在来调用一下incr函数，让value变成1

```
export OBJID=0x138161a08b4536a4a4ba8db02f65fb4a7d1519ba017c5de0925a159ec6e74722
sui client call \
    --function incr \
    --module counter \
    --package $PKGID \
    --args $OBJID \
    --gas-budget 10000000
```

再次到suiexpolrer中查看，发现value已经增加了1

## 参考链接

1. https://sui-book.com/framework

2. https://github.com/bityoume/SuiStartrek/tree/bityoume/members/bityoume/roadmap/week01

3. https://intro-zh.sui-book.com/unit-one