# 学习日志

### unit-one

####  我的环境：
window 11 wsl2 ubuntu20.04
#### 安装sui遇到问题：
error: could not compile `aws-sdk-ec2` (lib)
在issue找到同样的[问题](https://github.com/MystenLabs/sui/issues/14255)
根据别人答复下载了编译后的二进制文件避免了问题

[安装nvm](https://asibin99.medium.com/how-to-use-node-version-manager-nvm-on-ubuntu-20-04-fa71c9929f51)

Windows 访问wsl2 在文件资源管理器输入 \\wsl$

以上在因安装的是编译好的包 命令和官方的稍有不同 
asui      csui      devnet    dsui      localnet  lsui      mainnet   msui      testnet   tsui      
``` sh
localnet start #启动本地节点localdev
lsui client envs #查看本地环境
lsui client gas  #查看本地的gas
lsui client addresses #查看本地addresses
lsui client new-env --alias local --rpc http://127.0.0.1:9000 # local rpc
lsui client switch --env local #切换环境  dsui msui tsui
```
后看到微信群友的[安装笔记](https://dethan3.xlog.app/wsl2-install-sui-by-ubuntu20_04) 

```sh
cargo install -j4 --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```
之后安装成功

####  hello_world合约：
```sh
mkdir hello_world && cd hello_world
sui move new hello_world
```
```rust
module hello_world::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    //定义结构体
    struct HelloWorldObject has key, store {
        id: UID,
        text: string::String
    }

    //定义方法
    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}
```
在hello_world目录下执行如下命令
```sh
# 部署合约
sui client publish --gas-budget 20000000
# 查看生产的id 放入变量待后续使用
export PACKAGE_ID=0x776ea826857af4b96b7416063baf08be09c4e8a9aff110058883c2297f65f72c
#执行合约的 mint 方法
sui client call --function mint --module hello_world --package $PACKAGE_ID --gas-budget 10000000
```

####  counter合约：
```sh
mkdir counter && cd counter
sui move new counter
```
```rust
module counter::counter {

    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // 定义计数器结构体
    struct Counter has key{
        id: UID,
        value: u64, // 计数器的值
    }

    // 创建一个计数器
    public entry fun createCounter(ctx: &mut TxContext) {
        // sender address
        let sender = tx_context::sender(ctx);
        let counter = Counter {
            id: object::new(ctx),
            value: 0
        };
        transfer::transfer(counter, sender);
    }

    // 获取计数器的值
    public fun getCounterValue(counter: &Counter): u64 {
        counter.value
    }

    // 修改计数器的值（自增）
    public fun incrementCounter(counter: &mut Counter) {
        counter.value = counter.value + 1;
    }

    // 修改计数器的值（设置）
    public fun setCounterValue(counter: &mut Counter, newValue: u64) {
        counter.value = newValue;
    }

}
```
在counter目录下执行如下命令
```sh
# 部署合约
sui client publish --gas-budget 20000000
```
```log
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.14.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING counter
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
JBeGbcuY9ioWQAGey748LJ5duoZvDtGM4evpEn6vZhmn
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b                                                                                  │
│ Gas Owner: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b                                                                               │
│ Gas Budget: 20000000                                                                                                                                        │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                                                                                   │
│  │ Version: 12                                                                                                                                              │
│  │ Digest: AWY23J3b6rSRTzqFBLdY85GqxHzTjHTS9kob7MBQvRFp                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    9czmYjWDeMPnD3gYG9aoSw037wsaMUo3JX4m3rbiiN3vTKoaV6Glx104IihCsko3wqGVK1Mc0CToVkiGATkBAg==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: JBeGbcuY9ioWQAGey748LJ5duoZvDtGM4evpEn6vZhmn                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 4                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7eddfd203a19dd4801b82b01b27e082e29a658ed00ac1147121c029ce58a2926                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 13                                                                                    │
│  │ Digest: 2hWxD7pZPxqiW9ToaPyCRswjr1q48kjtEmEHipPdBBZC                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x903ec5962483376eaf04219bc3ad20238e880ac61b84a2221b319d823f51f4fd                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Amc7UueuBDgkt6rErC9Uxwn9xod7d2N88vqKjjGsm8bG                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 13                                                                                    │
│  │ Digest: 33WdxR3pajbzkWaf95A5wKncGPeHjvNGwaTsm7HtbgQH                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 13                                                                                    │
│  │ Digest: 33WdxR3pajbzkWaf95A5wKncGPeHjvNGwaTsm7HtbgQH                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8124400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    FmkgpJpdQkQyfh3H7cdK2saq7shABfhyo4wDpah9W3on                                                   │
│    HUKvecodFjttC4143fQ7LKpCNEwswvq8QyLJHiN8bJBg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x7eddfd203a19dd4801b82b01b27e082e29a658ed00ac1147121c029ce58a2926
 │ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b 
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 13
 │ Digest: 2hWxD7pZPxqiW9ToaPyCRswjr1q48kjtEmEHipPdBBZC
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816
 │ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b 
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 13
 │ Digest: 33WdxR3pajbzkWaf95A5wKncGPeHjvNGwaTsm7HtbgQH
 └──

Published Objects: 
 ┌──
 │ PackageID: 0x903ec5962483376eaf04219bc3ad20238e880ac61b84a2221b319d823f51f4fd 
 │ Version: 1 
 │ Digest: Amc7UueuBDgkt6rErC9Uxwn9xod7d2N88vqKjjGsm8bG
 | Modules: counter
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -8146280
 └──
```
```sh
# 查看生产的id 放入变量待后续使用
export PACKAGE_ID=0x7eddfd203a19dd4801b82b01b27e082e29a658ed00ac1147121c029ce58a2926
#执行合约的 createCounter 方法 执行后会有id生成后面几个方法会用到这个id作为参数
sui client call --function createCounter --module counter --package $PACKAGE_ID --gas-budget 10000000

```

```log
----- Transaction Digest ----
83ueJCzMRPz2zbVCP7XmgyjqRPh6x6yKG7dSVak3VFey
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                          │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b                                │
│ Gas Owner: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b                             │
│ Gas Budget: 10000000                                                                                      │
│ Gas Price: 1000                                                                                           │
│ Gas Payment:                                                                                              │
│  ┌──                                                                                                      │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                                 │
│  │ Version: 13                                                                                            │
│  │ Digest: 33WdxR3pajbzkWaf95A5wKncGPeHjvNGwaTsm7HtbgQH                                                   │
│  └──                                                                                                      │
│                                                                                                           │
│ Transaction Kind : Programmable                                                                           │
│ Inputs: []                                                                                                │
│ Commands: [                                                                                               │
│   MoveCall(0x903ec5962483376eaf04219bc3ad20238e880ac61b84a2221b319d823f51f4fd::counter::createCounter()), │
│ ]                                                                                                         │
│                                                                                                           │
│                                                                                                           │
│ Signatures:                                                                                               │
│    dqZENKN4zPbZLbrnXZUgk9pu1VV/WOzBwceznfu+4b8e49qiYtuTFXqpXSbJQwT9i97UueY3X5SpYhOQUtHSAw==               │
│                                                                                                           │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 83ueJCzMRPz2zbVCP7XmgyjqRPh6x6yKG7dSVak3VFey                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 4                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 14                                                                                    │
│  │ Digest: FEnDB1cLPqjusoZ8vjHqSrTFDf8QijRRUWqBhy5h1U5Q                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 14                                                                                    │
│  │ Digest: E2dsoL5TsqGnR3GyJqY9MNos3suznyUoxuUCt5yFPq94                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 14                                                                                    │
│  │ Digest: E2dsoL5TsqGnR3GyJqY9MNos3suznyUoxuUCt5yFPq94                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2348400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    JBeGbcuY9ioWQAGey748LJ5duoZvDtGM4evpEn6vZhmn                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4
 │ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b 
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )
 │ ObjectType: 0x903ec5962483376eaf04219bc3ad20238e880ac61b84a2221b319d823f51f4fd::counter::Counter 
 │ Version: 14
 │ Digest: FEnDB1cLPqjusoZ8vjHqSrTFDf8QijRRUWqBhy5h1U5Q
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816
 │ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b 
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 14
 │ Digest: E2dsoL5TsqGnR3GyJqY9MNos3suznyUoxuUCt5yFPq94
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -2370280
 └──
```
```sh
#执行合约的 incrementCounter 方法 参数createCounter执行后生产的id
sui client call --function incrementCounter --args 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4 --module counter --package $PACKAGE_ID --gas-budget 10000000
```
console输出如下

```log
----- Transaction Digest ----
92SVsiYugGz5Kmjh5Ci7SSEVGhwmePVSyxSH4XZc5bh6
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                                                                          │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b                                                                                                                                │
│ Gas Owner: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b                                                                                                                             │
│ Gas Budget: 10000000                                                                                                                                                                                      │
│ Gas Price: 1000                                                                                                                                                                                           │
│ Gas Payment:                                                                                                                                                                                              │
│  ┌──                                                                                                                                                                                                      │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                                                                                                                                 │
│  │ Version: 14                                                                                                                                                                                            │
│  │ Digest: E2dsoL5TsqGnR3GyJqY9MNos3suznyUoxuUCt5yFPq94                                                                                                                                                   │
│  └──                                                                                                                                                                                                      │
│                                                                                                                                                                                                           │
│ Transaction Kind : Programmable                                                                                                                                                                           │
│ Inputs: [Object(ImmOrOwnedObject { object_id: 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4, version: SequenceNumber(14), digest: o#FEnDB1cLPqjusoZ8vjHqSrTFDf8QijRRUWqBhy5h1U5Q })] │
│ Commands: [                                                                                                                                                                                               │
│   MoveCall(0x903ec5962483376eaf04219bc3ad20238e880ac61b84a2221b319d823f51f4fd::counter::incrementCounter(Input(0))),                                                                                      │
│ ]                                                                                                                                                                                                         │
│                                                                                                                                                                                                           │
│                                                                                                                                                                                                           │
│ Signatures:                                                                                                                                                                                               │
│    YacLTV45bv3VsjfIZIBcTZhnvBgd6rLpiVMe9juwlqmAEljv1QKddePoZSeZNxNMxvUjfRhPX+VvfiYh3q6ZCA==                                                                                                               │
│                                                                                                                                                                                                           │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 92SVsiYugGz5Kmjh5Ci7SSEVGhwmePVSyxSH4XZc5bh6                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 4                                                                                 │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 15                                                                                    │
│  │ Digest: 4jRfCPmjzm6xD2udobNs8BbBJMtkqgqmmstRMEnRfzCM                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 15                                                                                    │
│  │ Digest: F4NJxr7JJp5U75zKL3iRqKGmTXgYZkt2SDe9c5GBsSNH                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 15                                                                                    │
│  │ Digest: 4jRfCPmjzm6xD2udobNs8BbBJMtkqgqmmstRMEnRfzCM                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2348400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 2324916                                                                        │
│    Non-refundable Storage Fee: 23484                                                              │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    83ueJCzMRPz2zbVCP7XmgyjqRPh6x6yKG7dSVak3VFey                                                   │
│    JBeGbcuY9ioWQAGey748LJ5duoZvDtGM4evpEn6vZhmn                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Mutated Objects: 
 ┌──
 │ ObjectID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816
 │ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b 
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 15
 │ Digest: 4jRfCPmjzm6xD2udobNs8BbBJMtkqgqmmstRMEnRfzCM
 └──
 ┌──
 │ ObjectID: 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4
 │ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b 
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )
 │ ObjectType: 0x903ec5962483376eaf04219bc3ad20238e880ac61b84a2221b319d823f51f4fd::counter::Counter 
 │ Version: 15
 │ Digest: F4NJxr7JJp5U75zKL3iRqKGmTXgYZkt2SDe9c5GBsSNH
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -1023484
 └──

```
```sh
#执行合约的 getCounterValue 方法 参数为createCounter执行后生产的id
sui client call --function getCounterValue --args 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4 --module counter --package $PACKAGE_ID --gas-budget 10000000
```
console输出如下
```log
----- Transaction Digest ----
Cx5cmBpTyySmo7k6sCR8bzidX3BeEeEkdhjv2Zx7jCXe
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                                                                          │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b                                                                                                                                │
│ Gas Owner: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b                                                                                                                             │
│ Gas Budget: 10000000                                                                                                                                                                                      │
│ Gas Price: 1000                                                                                                                                                                                           │
│ Gas Payment:                                                                                                                                                                                              │
│  ┌──                                                                                                                                                                                                      │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                                                                                                                                 │
│  │ Version: 15                                                                                                                                                                                            │
│  │ Digest: 4jRfCPmjzm6xD2udobNs8BbBJMtkqgqmmstRMEnRfzCM                                                                                                                                                   │
│  └──                                                                                                                                                                                                      │
│                                                                                                                                                                                                           │
│ Transaction Kind : Programmable                                                                                                                                                                           │
│ Inputs: [Object(ImmOrOwnedObject { object_id: 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4, version: SequenceNumber(15), digest: o#F4NJxr7JJp5U75zKL3iRqKGmTXgYZkt2SDe9c5GBsSNH })] │
│ Commands: [                                                                                                                                                                                               │
│   MoveCall(0x903ec5962483376eaf04219bc3ad20238e880ac61b84a2221b319d823f51f4fd::counter::getCounterValue(Input(0))),                                                                                       │
│ ]                                                                                                                                                                                                         │
│                                                                                                                                                                                                           │
│                                                                                                                                                                                                           │
│ Signatures:                                                                                                                                                                                               │
│    VCr1OUAiBSygoQqjGR/1tmiqKwJWsfgMOMY7E1gCXK7BN90C9CeSj0uOjVOuhxj9+9AQOB7blrjndVQVUZI4Ag==                                                                                                               │
│                                                                                                                                                                                                           │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Cx5cmBpTyySmo7k6sCR8bzidX3BeEeEkdhjv2Zx7jCXe                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 4                                                                                 │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 16                                                                                    │
│  │ Digest: 35GvpNhzm852rzAt7gj8dCrhr8VnY23qV1fS6gNqdfqv                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 16                                                                                    │
│  │ Digest: 5LkVEPNU5KncLqfLrCLqJiBBMExgKtngEBbaJ83jSJZ8                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 16                                                                                    │
│  │ Digest: 35GvpNhzm852rzAt7gj8dCrhr8VnY23qV1fS6gNqdfqv                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2348400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 2324916                                                                        │
│    Non-refundable Storage Fee: 23484                                                              │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    92SVsiYugGz5Kmjh5Ci7SSEVGhwmePVSyxSH4XZc5bh6                                                   │
│    JBeGbcuY9ioWQAGey748LJ5duoZvDtGM4evpEn6vZhmn                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Mutated Objects: 
 ┌──
 │ ObjectID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816
 │ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b 
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 16
 │ Digest: 35GvpNhzm852rzAt7gj8dCrhr8VnY23qV1fS6gNqdfqv
 └──
 ┌──
 │ ObjectID: 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4
 │ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b 
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )
 │ ObjectType: 0x903ec5962483376eaf04219bc3ad20238e880ac61b84a2221b319d823f51f4fd::counter::Counter 
 │ Version: 16
 │ Digest: 5LkVEPNU5KncLqfLrCLqJiBBMExgKtngEBbaJ83jSJZ8
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -1023484
 └──
```
```sh
#执行合约的 setCounterValue 方法 参数为createCounter执行后生产的id 和要设置的值 多个参数 空格隔开
sui client call --function setCounterValue --args 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4 6  --module counter --package $PACKAGE_ID --gas-budget 10000000
```
console输出如下

```log
----- Transaction Digest ----
H7u7x3QfsNZZ1qc9A7jwWsmkosS8KP4ReeWK7YeYGzAT
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                                                                                                                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b                                                                                                                                                                                          │
│ Gas Owner: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b                                                                                                                                                                                       │
│ Gas Budget: 10000000                                                                                                                                                                                                                                                │
│ Gas Price: 1000                                                                                                                                                                                                                                                     │
│ Gas Payment:                                                                                                                                                                                                                                                        │
│  ┌──                                                                                                                                                                                                                                                                │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                                                                                                                                                                                           │
│  │ Version: 16                                                                                                                                                                                                                                                      │
│  │ Digest: 35GvpNhzm852rzAt7gj8dCrhr8VnY23qV1fS6gNqdfqv                                                                                                                                                                                                             │
│  └──                                                                                                                                                                                                                                                                │
│                                                                                                                                                                                                                                                                     │
│ Transaction Kind : Programmable                                                                                                                                                                                                                                     │
│ Inputs: [Object(ImmOrOwnedObject { object_id: 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4, version: SequenceNumber(16), digest: o#5LkVEPNU5KncLqfLrCLqJiBBMExgKtngEBbaJ83jSJZ8 }), Pure(SuiPureValue { value_type: Some(U64), value: "6" })] │
│ Commands: [                                                                                                                                                                                                                                                         │
│   MoveCall(0x903ec5962483376eaf04219bc3ad20238e880ac61b84a2221b319d823f51f4fd::counter::setCounterValue(Input(0),Input(1))),                                                                                                                                        │
│ ]                                                                                                                                                                                                                                                                   │
│                                                                                                                                                                                                                                                                     │
│                                                                                                                                                                                                                                                                     │
│ Signatures:                                                                                                                                                                                                                                                         │
│    3bP5ZEAaED7ULUBHOYKSAZxhoIMIEfzuJApOGCNsHbVm0u8smBq77c6AD4Y/O6BhmNvCENd7PwQ8kzM6ozaSDA==                                                                                                                                                                         │
│                                                                                                                                                                                                                                                                     │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: H7u7x3QfsNZZ1qc9A7jwWsmkosS8KP4ReeWK7YeYGzAT                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 4                                                                                 │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 17                                                                                    │
│  │ Digest: FysuYbfmsteCGG8wFXtPMkm2iTVnAhprVgnVMRwRceNK                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 17                                                                                    │
│  │ Digest: 2Ko1NszqXxopFXanVkc2xD69Mqdhu8jg3n4B4BRKgRLS                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816                         │
│  │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )  │
│  │ Version: 17                                                                                    │
│  │ Digest: FysuYbfmsteCGG8wFXtPMkm2iTVnAhprVgnVMRwRceNK                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2348400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 2324916                                                                        │
│    Non-refundable Storage Fee: 23484                                                              │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    Cx5cmBpTyySmo7k6sCR8bzidX3BeEeEkdhjv2Zx7jCXe                                                   │
│    JBeGbcuY9ioWQAGey748LJ5duoZvDtGM4evpEn6vZhmn                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Mutated Objects: 
 ┌──
 │ ObjectID: 0xb8def9df7c017e9ceda48f659c7340ef4a2fe6c133b72a19b8d5e88b9763b816
 │ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b 
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 17
 │ Digest: FysuYbfmsteCGG8wFXtPMkm2iTVnAhprVgnVMRwRceNK
 └──
 ┌──
 │ ObjectID: 0xf3bd6705bd28b794579640e7712c2bc9bd2644351ca893321d3edb1f7de11ec4
 │ Sender: 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b 
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b )
 │ ObjectType: 0x903ec5962483376eaf04219bc3ad20238e880ac61b84a2221b319d823f51f4fd::counter::Counter 
 │ Version: 17
 │ Digest: 2Ko1NszqXxopFXanVkc2xD69Mqdhu8jg3n4B4BRKgRLS
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xd8fb6a5043943dfd49d5247dd534f62fa310df1d1912bae1c529a6e75321eb5b ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -1023484
 └──

```