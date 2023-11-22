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

"D:\1sui\SuiStartrek\members\extravert\asserts\XQ_0]7(3K19OZ5~N4(Y(2OW.png"

成功下载rust，cargo

![image-20231122170421387](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\image-20231122170421387.png)



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

![image-20231122171352702](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\image-20231122171352702.png)



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

$ sui client envs
╭────────┬────────────────────────────────────┬────────╮
│ alias  │ url                                │ active │
├────────┼────────────────────────────────────┼────────┤
│ devnet │ https://fullnode.devnet.sui.io:443 │ *      │
╰────────┴────────────────────────────────────┴────────╯

切换网络



查看当前网络地址

```shell
sui client active-address
0xef8ed60de2540e7d1b85c84d2071d744b717430888bd7ee4eeb1d73b4875391c

```

`sui client addresses`命令查看本地网络上的所有地址

sui client addresses
╭───────────────┬──────────────────────────────────────────────────────────────────────────╮
│ activeAddress │  0xef8ed60de2540e7d1b85c84d2071d744b717430888bd7ee4eeb1d73b4875391c      │
│ addresses     │ ╭──────────────────────────────────────────────────────────────────────╮ │
│               │ │  0xef8ed60de2540e7d1b85c84d2071d744b717430888bd7ee4eeb1d73b4875391c  │ │
│               │ ╰──────────────────────────────────────────────────────────────────────╯ │
╰───────────────┴──────────────────────────────────────────────────────────────────────────╯

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

sui client gas
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.14.1
╭────────────────────────────────────────────────────────────────────┬─────────────╮
│ gasCoinId                                                          │ gasBalance  │
├────────────────────────────────────────────────────────────────────┼─────────────┤
│ 0xd2b5d5ac469bceda258cc98e27b3ec24a813e19e9ac6fa01dbdb11b1f18e3e6c │ 10000000000 │
╰────────────────────────────────────────────────────────────────────┴─────────────╯



### 安装sui钱包

sui wallet

<img src="C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\image-20231122180049326.png" alt="image-20231122180049326" style="zoom:50%;" />

surf wallet

<img src="C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\image-20231122180154225.png" alt="image-20231122180154225" style="zoom:50%;" />

## 合约开发入门

### 创建项目

创建一个空的包

```bash
sui move new my_first_package
```

目录结构

![image-20231122183032064](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\image-20231122183032064.png)

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