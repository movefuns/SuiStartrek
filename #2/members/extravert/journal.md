# 学习日志

# Roadmap 1

## 安装

最开始使用实验室的集群来做，发现一方面是实验室的资源是公共的，另一方面就是代理问题始终解决不了，sui放弃。

然后打算使用windows，结果环境就出错，sui使用wsl，记录如下：

### 安装Move 开发环境

使用以下命令进行更新apt-get：

```bash
sudo apt-get update
```

安装需要的包

```bash
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

使用以下命令在 macOS 或 Linux 上安装 Rust 和 Cargo：

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

网络问题会超时，参考群友的解决方案：

https://sui-startrek-birch.vercel.app/docs#%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91

> 此步骤是为Ubuntu/WSL配置科学上网，需要将windos的clash打开Tun模式，并且允许访问局域网：

clash的配置

![clash](https://github.com/extravert/SuiStartrek/blob/sui/members/extravert/asserts/XQ_0%5D7(3K19OZ5~N4(Y(2OW.png)

成功下载rust，cargo

![rust](https://github.com/extravert/SuiStartrek/blob/sui/members/extravert/asserts/image-20231122170421387.png)



### 安装sui

Run the following command to install Sui binaries from the `testnet` branch:

```shell
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```

查看sui版本

```bash
$ sui --version
sui 1.14.0-8b46c5ed9
```

终端安装sui-analyzer

```bash
 $ cargo install --git https://github.com/movebit/move --branch sui_move_analyzer sui-move-analyzer
 ......
    Finished release [optimized] target(s) in 4m 46s
  Installing /root/.cargo/bin/sui-move-analyzer
   Installed package `sui-move-analyzer v1.1.1 (https://github.com/movebit/move?branch=sui_move_analyzer#b3f681df)` (executable `sui-move-analyzer`)
```

vscode中安装插件

![move-analyzer](https://github.com/extravert/SuiStartrek/blob/sui/members/extravert/asserts/image-20231122171352702.png)



### sui连接网络

要将 Sui 客户端连接到网络，请运行以下命令：

```shell
sui client
```

第一次启动没有 client.yaml 文件的 Sui 客户端时，控制台会显示以下消息：

```shell
Config file ["<PATH-TO-FILE>/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?
```

按**y**，然后按**Enter**。然后该进程请求 RPC 服务器 URL：

```bash
Sui Full node server URL (Defaults to Sui Devnet if not specified) :
```

按**Enter 键**连接到 Sui Devnet。要使用自定义 RPC 服务器、Sui Testnet 或 Sui Mainnet，请输入正确的 RPC 端点的 URL，然后按**Enter**。

Sui 返回一条类似于以下内容的消息（取决于您选择的密钥方案），其中包括地址和该地址的 12 字恢复短语：

```shell
Generated new keypair for address with scheme "ed25519" [0xb9c83a8b40d3263c9ba40d551514fbac1f8c12e98a4005a0dac072d3549c2442]
Secret Recovery Phrase : [cap wheat many line human lazy few solid bored proud speed grocery]
```

查看当前网络

```bash 
$ sui client envs
```

```bash 
$ sui client envs
╭────────┬────────────────────────────────────┬────────╮
│ alias  │ url                                │ active │
├────────┼────────────────────────────────────┼────────┤
│ devnet │ https://fullnode.devnet.sui.io:443 │ *      │
╰────────┴────────────────────────────────────┴────────╯
```

切换网络



查看当前网络地址

```shell
sui client active-address
0xef8ed60de2540e7d1b85c84d2071d744b717430888bd7ee4eeb1d73b4875391c

```

`sui client addresses`命令查看本地网络上的所有地址

```bash 
sui client addresses
╭───────────────┬──────────────────────────────────────────────────────────────────────────╮
│ activeAddress │  0xef8ed60de2540e7d1b85c84d2071d744b717430888bd7ee4eeb1d73b4875391c      │
│ addresses     │ ╭──────────────────────────────────────────────────────────────────────╮ │
│               │ │  0xef8ed60de2540e7d1b85c84d2071d744b717430888bd7ee4eeb1d73b4875391c  │ │
│               │ ╰──────────────────────────────────────────────────────────────────────╯ │
╰───────────────┴──────────────────────────────────────────────────────────────────────────╯
```

领水

```shell
curl --location --request POST 'https://faucet.devnet.sui.io/gas' --header 'Content-Type: application/json' --data-raw '{
    "FixedAmountRequest": {
        "recipient": "0xef8ed60de2540e7d1b85c84d2071d744b717430888bd7ee4eeb1d73b4875391c"
    }
}'
```

 响应

```shell
{"transferredGasObjects":[{"amount":10000000000,"id":"0xd2b5d5ac469bceda258cc98e27b3ec24a813e19e9ac6fa01dbdb11b1f18e3e6c","transferTxDigest":"gs3NG4EAo3jzr5hZT8bAFHMpTqzA4tdKxpXPPCt5TFN"}],"error":null}
```

查看领取

```bash 
sui client gas
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.14.1
╭────────────────────────────────────────────────────────────────────┬─────────────╮
│ gasCoinId                                                          │ gasBalance  │
├────────────────────────────────────────────────────────────────────┼─────────────┤
│ 0xd2b5d5ac469bceda258cc98e27b3ec24a813e19e9ac6fa01dbdb11b1f18e3e6c │ 10000000000 │
╰────────────────────────────────────────────────────────────────────┴─────────────╯
```


### 安装sui钱包

sui wallet

<img src="https://github.com/extravert/SuiStartrek/blob/sui/members/extravert/asserts/image-20231122180049326.png" />

surf wallet

<img src="https://github.com/extravert/SuiStartrek/blob/sui/members/extravert/asserts/image-20231122180154225.png" />

## 合约开发入门

### 创建项目

创建一个空的包

```bash
sui move new my_first_package
```

目录结构

![content](https://github.com/extravert/SuiStartrek/blob/sui/members/extravert/asserts/image-20231122183032064.png)

### 构建和测试

```bash
sui move build
```

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING my_first_package

### 测试

```bash
sui move test
```

BUILDING Sui
BUILDING MoveStdlib
BUILDING my_first_package
Running Move unit tests
Test result: OK. Total tests: 0; passed: 0; failed: 0

添加test测试

```bash
sui move test sword
```

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING my_first_move
warning[Lint W02001]: potentially unenforceable custom transfer/share/freeze policy
   ┌─ ./sources/my_module.move:77:22
   │
77 │     public entry fun sword_transfer(sword: Sword, recipient: address, _ctx: &mut TxContext) {
   │                      ^^^^^^^^^^^^^^ ----- An instance of a module-private type with a store ability to be transferred coming from here
   │                      │               
   │                      Potential unintended implementation of a custom transfer function.
   ·
80 │         transfer::transfer(sword, recipient);
   │                   -------- Instances of a type with a store ability can be transferred using the public_transfer function which often negates the intent of enforcing a custom transfer policy
   │
   = A custom transfer policy for a given type is implemented through calling the private transfer function variant in the module defining this type
   = This warning can be suppressed with '#[lint_allow(custom_state_change)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

Please report feedback on the linter warnings at https://forums.sui.io

Running Move unit tests
[ PASS    ] 0x0::my_module::test_sword_create
[ PASS    ] 0x0::my_module::test_sword_transactions
Test result: OK. Total tests: 2; passed: 2; failed: 0



2023年11月29日10点29分

编译合约

```bash
sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING my_first_move
```

**sui client sui server版本不匹配问题**

使用Sui Client的時候，出現[warn] Client/Server api version mismatch, client api version : x.x.x, server api version : x.x.x，怎麼辦？
A: 代表你需要升級你的Sui Client，請執行以下命令：

```
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
```





---

2023年11月29日18点24分

安装pnpm的问题

```bash
npm install pnpm -g

changed 1 package in 2s

1 package is looking for funding
  run `npm fund` for details
PS C:\Users\DELL> pnpm config get registry
pnpm : 无法加载文件 D:\node18.18\node_global\pnpm.ps1，因为在此系统上禁止运行脚本。有关详细信息，请参阅 https:/go.micro
soft.com/fwlink/?LinkID=135170 中的 about_Execution_Policies。
所在位置 行:1 字符: 1
+ pnpm config get registry
+ ~~~~
    + CategoryInfo          : SecurityError: (:) []，PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess
PS C:\Users\DELL> Set-ExecutionPolicy -Scope CurrentUser

位于命令管道位置 1 的 cmdlet Set-ExecutionPolicy
请为以下参数提供值:
ExecutionPolicy: RemoteSigned
PS C:\Users\DELL> get-ExecutionPolicy
RemoteSigned
```

然后就成功啦 换源

```bash
 pnpm config get registry
https://registry.npmjs.org/
PS C:\Users\DELL> pnpm config set registry https://registry.npmmirror.com/
PS C:\Users\DELL>
```



---

2023年11月30日09点31分

更新node

https://blog.csdn.net/weixin_55719805/article/details/128094550

用的这个方法，

```bash
sudo apt update	
sudo apt install nodejs
#不自带 npm 需要自行安装
sudo apt install npm
# 升级 npm
sudo npm install npm -g	

sudo npm install n -g
# 下载最新稳定版
sudo n stable
# 下载最新版
sudo n lastest
# 查看已下载的版本
sudo n ls
# 切换 Node 版本
sudo n 18.21.1
```

升级那里报错了 没管 继续往下执行 把node更新之后查看npm版本报错了

```bash
$ npm -v
npm ERR! config prefix cannot be changed from project config: /mnt/c/Users/DELL/.npmrc.
10.2.3
```

但是pnpm生效了



---

2023年12月1日18点12分

## sui hello_world交互

### 配置环境

升级node

```bash
$ node -v
v20.10.0
npm -v
npm ERR! config prefix cannot be changed from project config: /mnt/c/Users/DELL/.npmrc.
10.2.3
```

安装pnpm

```bash
$ npm install -g pnpm
$ pnpm -v
8.11.0
```

### 创建前端项目

```bash
$ pnpm create @mysten/dapp
 WARN  GET https://registry.npmjs.org/@mysten%2Fcreate-dapp error (ECONNRESET). Will retry in 10 seconds. 2 retries left.
 WARN  GET https://registry.npmjs.org/@mysten%2Fcreate-dapp error (ECONNRESET). Will retry in 1 minute. 1 retries left.
 WARN  GET https://registry.npmjs.org/@types%2Fnode error (ECONNRESET). Will retry in 10 seconds. 2 retries left.
 WARN  GET https://registry.npmjs.org/@mysten%2Fdapp-kit error (ECONNRESET). Will retry in 10 seconds. 2 retries left.
 WARN  GET https://registry.npmjs.org/@mysten%2Fsui.js error (ECONNRESET). Will retry in 10 seconds. 2 retries left.
 WARN  GET https://registry.npmjs.org/enquirer error (ECONNRESET). Will retry in 10 seconds. 2 retries left.
.local/share/pnpm/store/v3/tmp/dlx-28917 |  +97 ++++++++++
.local/share/pnpm/store/v3/tmp/dlx-28917 | Progress: resolved 97, reused 0, downloaded 97, added 97, done
✔ Which starter template would you like to use? · react-e2e-counter
✔ What is the name of your dApp? (this will be used as the directory name) · hello_sui
```

生成前端框架

![image-20231201173914458](https://github.com/extravert/SuiStartrek/blob/sui/members/extravert/asserts/image-20231201173914458.png)

### 创建move合约

切换网络

```bash
sui client new-env --alias devnet --rpc https://fullnode.devnet.sui.io:443

sui client switch --env devnet
```

创建新的地址并领水

```bash
sui client new-address secp256k1
╭────────────────────────────────────────────────────────────────────────────────────────────╮
│ Created new keypair and saved it to keystore.                                              │
├────────────────┬───────────────────────────────────────────────────────────────────────────┤
│ address        │ 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859        │
│ keyScheme      │ secp256k1                                                                 │
│ recoveryPhrase │ gravity brave twice box surface type salad thunder nature train flee tent │
╰────────────────┴───────────────────────────────────────────────────────────────────────────╯
$ sui client switch --address 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859
Active address switched to 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859

$ curl --location --request POST 'https://faucet.devnet.sui.io/gas' --header 'Content-Type: application/json' --data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859"
    }
}'
{"transferredGasObjects":[{"amount":10000000000,"id":"0x98af701b92b7a8f72a838c45f16b2eed925df6c889df7288238c17d86e842732","transferTxDigest":"EcHSGSC64AaNBtdEWPwb4GTiYtfsdJnQe6g2UZNX5PMu"}],"error":null}
```



### 部署合约

```bash
$ sui client publish --gas-budget 100000000 counter
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.15.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING counter
error[Sui E01001]: invalid object construction
   ┌─ /home/zjb/.move/https___github_com_MystenLabs_sui_git_framework__devnet/crates/sui-framework/packages/sui-framework/sources/random.move:53:20
   │  
53 │           let self = Random {
   │ ╭────────────────────^
54 │ │             id: object::randomness_state(),
   │ │             --  -------------------------- Non fresh UID from this position
   │ │             │    
   │ │             The UID must come directly from sui::object::new. Or for tests, it can come from sui::test_scenario::new_object
55 │ │             inner: versioned::create(version, inner, ctx),
56 │ │         };
   │ ╰─────────^ Invalid object creation without a newly created UID.

Failed to build Move modules: Compilation error.
```

报错了 然后切换testnet

报错

```bash
$ sui client publish --gas-budget 100000000 counter
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.15.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING counter
Failed to publish the Move module(s), reason: [warning] Multiple source verification errors found:

- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::object
- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::zklogin_verified_id
- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::transfer_policy
- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::zklogin_verified_issuer
- Local version of dependency 0000000000000000000000000000000000000000000000000000000000000002::token was not found.

This may indicate that the on-chain version(s) of your package's dependencies may behave differently than the source version(s) your package was built against.

Fix this by rebuilding your packages with source versions matching on-chain versions of dependencies, or ignore this warning by re-running with the --skip-dependency-verification flag.
```

添加忽略验证重新部署`--skip-dependency-verification`

```bash
$ sui client publish --gas-budget 100000000 counter --skip-dependency-verification
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.15.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING counter
Skipping dependency verification
----- Transaction Digest ----
BmzA5t69DUuoKhmRk285nFo8cX1WEAwBDRN3DApcP2ec
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859                                                                                  │
│ Gas Owner: 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859                                                                               │
│ Gas Budget: 100000000                                                                                                                                       │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x98af701b92b7a8f72a838c45f16b2eed925df6c889df7288238c17d86e842732                                                                                   │
│  │ Version: 71                                                                                                                                              │
│  │ Digest: BB1GuuiS5AJZyLvENqeQCLmMS1u11PjPDV9GoCUzVJjo                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    +6wAFsirZIupLennoXACcekXMa0sx5lfp2rfrXA8Y5A4Yrm+YXOQENngT7bFxKXKe984GhtMXl7WLTAjlWfqMg==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BmzA5t69DUuoKhmRk285nFo8cX1WEAwBDRN3DApcP2ec                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 6                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb705c3413d300814b47da3a69bdc8f6547d96e64fabaec7ee0bd353c66bfcbb2                         │
│  │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 )  │
│  │ Version: 72                                                                                    │
│  │ Digest: 9Kw3J6u6D8NJbhKAV39miedUWvuJAnzupj1ymkQVcZts                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf362d82318db1203311fd8a6d4ff615e4b757f1f1a3a77149953d992bbc3cc89                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: F9eJqAHuDnvWYwkKXsG2Ls7CH9dn2cijLGKyGJjHEBcr                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x98af701b92b7a8f72a838c45f16b2eed925df6c889df7288238c17d86e842732                         │
│  │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 )  │
│  │ Version: 72                                                                                    │
│  │ Digest: CBhBeAeEKtYMF3EeQ5dCiXFk285nUUjwSNKLseLgw8aN                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x98af701b92b7a8f72a838c45f16b2eed925df6c889df7288238c17d86e842732                         │
│  │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 )  │
│  │ Version: 72                                                                                    │
│  │ Digest: CBhBeAeEKtYMF3EeQ5dCiXFk285nUUjwSNKLseLgw8aN                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8747600                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    8SttpG2yACphxQfkNY7aVmaKWxHWtHczzMFRdJSb3sop                                                   │
│    EcHSGSC64AaNBtdEWPwb4GTiYtfsdJnQe6g2UZNX5PMu                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0xb705c3413d300814b47da3a69bdc8f6547d96e64fabaec7ee0bd353c66bfcbb2
 │ Sender: 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 
 │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 72
 │ Digest: 9Kw3J6u6D8NJbhKAV39miedUWvuJAnzupj1ymkQVcZts
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x98af701b92b7a8f72a838c45f16b2eed925df6c889df7288238c17d86e842732
 │ Sender: 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 
 │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 72
 │ Digest: CBhBeAeEKtYMF3EeQ5dCiXFk285nUUjwSNKLseLgw8aN
 └──

Published Objects: 
 ┌──
 │ PackageID: 0xf362d82318db1203311fd8a6d4ff615e4b757f1f1a3a77149953d992bbc3cc89 
 │ Version: 1 
 │ Digest: F9eJqAHuDnvWYwkKXsG2Ls7CH9dn2cijLGKyGJjHEBcr
 | Modules: counter
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -8769480
 └──
```

### 部署前端

切换目录

```bash
cd move
sui client publish --gas-budget 100000000 counter
```



部署合约得到的package ID

```bash
PackageID: 0xf362d82318db1203311fd8a6d4ff615e4b757f1f1a3a77149953d992bbc3cc89
```

添加到 `src/constants.ts`文件中

```typescript
export const DEVNET_COUNTER_PACKAGE_ID = "<YOUR_PACKAGE_ID>";
```

安装依赖

```bash
pnpm install
```

![image-20231201175512136](https://github.com/extravert/SuiStartrek/blob/sui/members/extravert/asserts/image-20231201175512136.png)

dApp 启动！

```bash
pnpm dev
```

![image-20231201175624602](https://github.com/extravert/SuiStartrek/blob/sui/members/extravert/asserts/image-20231201175624602.png)

### 前端交互

创建计数器

![image-20231201175928877](https://github.com/extravert/SuiStartrek/blob/sui/members/extravert/asserts/image-20231201175928877.png)



![image-20231201171011738](https://github.com/extravert/SuiStartrek/blob/sui/members/extravert/asserts/image-20231201171011738.png)





## 创建并发布Move ERC20合约

创建jscoin



### 添加代码

```move
module jscoin::jscoin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    
    struct JSCOIN has drop {}

    fun init(witness: JSCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"JSCOIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }
}

```

### 发布合约

```bash
$ sui client publish --gas-budget 100000000 jscoin
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.15.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
Failed to build Move modules: Failed to resolve dependencies for package 'jscoin'

Caused by:
    0: Fetching 'Sui'
    1: Failed to fetch to latest Git state for package 'Sui', to skip set --skip-fetch-latest-git-deps | Exit status: exit status: 128.
zjb@DESKTOP-R85D4BU:~$ sui client publish --gas-budget 100000000 jscoin --skip-fetch-latest-git-deps
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.15.0
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING jscoin
Failed to publish the Move module(s), reason: [warning] Multiple source verification errors found:

- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::transfer_policy
- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::zklogin_verified_issuer
- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::zklogin_verified_id
- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::object
- Local version of dependency 0000000000000000000000000000000000000000000000000000000000000002::token was not found.

This may indicate that the on-chain version(s) of your package's dependencies may behave differently than the source version(s) your package was built against.

Fix this by rebuilding your packages with source versions matching on-chain versions of dependencies, or ignore this warning by re-running with the --skip-dependency-verification flag.
zjb@DESKTOP-R85D4BU:~$ sui client publish --gas-budget 100000000 jscoin --skip-fetch-latest-git-deps --skip-dependency-verification
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.15.0
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING jscoin
Skipping dependency verification
----- Transaction Digest ----
Gv3yEYsfsxqB8xkhaDy5A3HdbkTVXnjYuyGjg5XNS9U9
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859                                                                                  │
│ Gas Owner: 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859                                                                               │
│ Gas Budget: 100000000                                                                                                                                       │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x98af701b92b7a8f72a838c45f16b2eed925df6c889df7288238c17d86e842732                                                                                   │
│  │ Version: 72                                                                                                                                              │
│  │ Digest: CBhBeAeEKtYMF3EeQ5dCiXFk285nUUjwSNKLseLgw8aN                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    Ar3QvMUPkheTOPLhCTWA1aLAw4+dTLQIQCv1/x0qP2RD52BPsgjD8jKfwAzNYjsxJJJZPoQq66WsVt4voUmc7w==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Gv3yEYsfsxqB8xkhaDy5A3HdbkTVXnjYuyGjg5XNS9U9                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 6                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6b307fab788071332cc2b21f331864c461fd89af40d969c429acb0f5a70c896c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 73                                                                                    │
│  │ Digest: 5qKptjfkg6RgbikhGfpsa5F2jtbT3NerzhyWu82wrWN8                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x85fa564ed88465cce1e4a1c77fcbda186c10d586317f0dd245b2e7eb7ef28f08                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 2id3dyKeQUXvmqptYUi5noUMKdQwnDyzkdkWVyShZiR9                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x945d8445c5f15adbc4232625fc9c280ccb7ca45c7852ffc81091468ab0d2c666                         │
│  │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 )  │
│  │ Version: 73                                                                                    │
│  │ Digest: 3w4T9xncFeSY762aYPFnphQp42Q7kSBeoHGJQfgSCL7H                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9f4ceaf2305d30639807299a88af27e7b7bba90f9dcc00bbe03f5888fefbdef7                         │
│  │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 )  │
│  │ Version: 73                                                                                    │
│  │ Digest: 3RqeLtqMaHpAxXc1uedsWLmtwkJHKEe1yhDR528bzhku                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x98af701b92b7a8f72a838c45f16b2eed925df6c889df7288238c17d86e842732                         │
│  │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 )  │
│  │ Version: 73                                                                                    │
│  │ Digest: 79ic7gNJhzLDaD9Cu8oEW8PKLCyjxhbhRygw4Asq5Ned                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x98af701b92b7a8f72a838c45f16b2eed925df6c889df7288238c17d86e842732                         │
│  │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 )  │
│  │ Version: 73                                                                                    │
│  │ Digest: 79ic7gNJhzLDaD9Cu8oEW8PKLCyjxhbhRygw4Asq5Ned                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 12418400                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    8SttpG2yACphxQfkNY7aVmaKWxHWtHczzMFRdJSb3sop                                                   │
│    BmzA5t69DUuoKhmRk285nFo8cX1WEAwBDRN3DApcP2ec                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x6b307fab788071332cc2b21f331864c461fd89af40d969c429acb0f5a70c896c
 │ Sender: 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 
 │ Owner: Immutable
 │ ObjectType: 0x2::coin::CoinMetadata<0x85fa564ed88465cce1e4a1c77fcbda186c10d586317f0dd245b2e7eb7ef28f08::jscoin::JSCOIN> 
 │ Version: 73
 │ Digest: 5qKptjfkg6RgbikhGfpsa5F2jtbT3NerzhyWu82wrWN8
 └──
 ┌──
 │ ObjectID: 0x945d8445c5f15adbc4232625fc9c280ccb7ca45c7852ffc81091468ab0d2c666
 │ Sender: 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 
 │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 )
 │ ObjectType: 0x2::coin::TreasuryCap<0x85fa564ed88465cce1e4a1c77fcbda186c10d586317f0dd245b2e7eb7ef28f08::jscoin::JSCOIN> 
 │ Version: 73
 │ Digest: 3w4T9xncFeSY762aYPFnphQp42Q7kSBeoHGJQfgSCL7H
 └──
 ┌──
 │ ObjectID: 0x9f4ceaf2305d30639807299a88af27e7b7bba90f9dcc00bbe03f5888fefbdef7
 │ Sender: 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 
 │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 73
 │ Digest: 3RqeLtqMaHpAxXc1uedsWLmtwkJHKEe1yhDR528bzhku
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x98af701b92b7a8f72a838c45f16b2eed925df6c889df7288238c17d86e842732
 │ Sender: 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 
 │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 73
 │ Digest: 79ic7gNJhzLDaD9Cu8oEW8PKLCyjxhbhRygw4Asq5Ned
 └──

Published Objects: 
 ┌──
 │ PackageID: 0x85fa564ed88465cce1e4a1c77fcbda186c10d586317f0dd245b2e7eb7ef28f08 
 │ Version: 1 
 │ Digest: 2id3dyKeQUXvmqptYUi5noUMKdQwnDyzkdkWVyShZiR9
 | Modules: jscoin
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x69bb995c250e7e4fba77b9ca13b67f910b6a6806a308f443531c513feb8ee859 ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -12440280
 └──
```

### 查看交易记录

https://suiexplorer.com/txblock/Gv3yEYsfsxqB8xkhaDy5A3HdbkTVXnjYuyGjg5XNS9U9?network=devnet

![image-20231201183743579](https://github.com/extravert/SuiStartrek/blob/sui/members/extravert/asserts/image-20231201183743579.png)
