# ROADMAP_1 Sui Move 开发入门

## 第0步：安装 SUI

_为了安装 sui，我在 windows 电脑上新安装了 wsl2 的 ubuntu20.04 发行版，这是 sui 官方支持的 Linux 版本。_

### 一、配置系统环境

在一个全新的系统里，要先安装必备的软件才可以安装 sui 的二进制文件。

#### 1. 终端走代理

无论是 WSL ，还是任何一个系统，首先自己的保证 `terminal` 走代理，丝滑的网络是解决大多数问题的基础。

#### 2. 更新系统包

`sudo apt-get update`

一般来说 Linux 都有预装 git ，没有的话也记得安装一下。

#### 3. 安装 Rust

rust 和 cargo 是安装 Sui 必不可少的。

在 Rust 官网的 [Getting started](https://www.rust-lang.org/learn/get-started) 可以找到适合你的安装方式，我现在用 WSL，用下面这行命令就好：

`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

在安装过程中有跳出选项填 `Y` 就可以。

安装完成后，重启终端，分别输入 `cargo -version` 和 `rustc --verison` 可以查看是否安装成功。

例如显示 `cargo 1.73.0 (9c4383fb5 2023-08-26)` 和 rustc `1.73.0 (cc66ad468 2023-10-03)` 就说明安装成功。

#### 4. 安装 Node.js

`node.js` 和 `npm` 不是安装 `sui` 所需要的，但却是之后做 dApp 是需要的，现在可以顺便安装了。

我日常习惯使用 [nvm](https://github.com/nvm-sh/nvm) 来管理不同版本的 node 和 npm, 同样也可以快速安装升级 node

1. 安装 nvm ： `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash`

2. 重启终端，运行 `nvm --verison` 有返回 0.39.5 之类的版本号，就说明安装成功了。

3. 安装 node `nvm install node`, 安装完成可自行验证 node 和 npm 是否安装成功。

4. 安装 pnpm，目前用不到，之后大概率会用到。

```sh
corepack enable
corepack prepare pnpm@latest --activate
```

### 二、安装 sui 的二进制文件

#### 1. 安装所需依赖

```sh
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

在终端中运行这行命令，中间所有问题都输入 “y”，再耐心等一段时间，安装 sui 所需的依赖就全部安装完成了。

#### 2. 安装 sui 二进制文件

```sh
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```

这就是最重要的一步了，输入上面这行命令，理论上就应该开始安装了。

这也是考验网络，电脑 CPU 的时候，如果你跟我一样电脑配置比较普通，可以在参数中加个 `-j*`, `*` 填数字，可以让 cargo 用 `*` 个 CPU 核心编译文件。

例如我的 CPU 是 6 核，我选择用 4 个核心编译

```sh
cargo install -j4 --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```

或许当你漫长的等待之后，在看到以下这些内容的时候，sui 应该安装成功了。

```sh
    Finished release [optimized + debuginfo] target(s) in 17m 01s
    Installing /home/user/.cargo/bin/sui
```

还不放心？再确认一下

```sh
$ sui --version
sui 1.14.0-8b46c5ed9
```

看到版本号说明 SUI 安装成功！

## 第一个 sui 的 dApp

### 一、 添加 Sui client 配置文件

本地安装好 sui 之后，还需要添加 Sui client 的配置文件

#### 1. 添加 sui client 配置文件

运行：

```sh
sui client
```

会出现一些问题，一直选默认选项就可以

```sh
Config file ["/home/moon/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?y #输入 y ,回车

Sui Full node server URL (Defaults to Sui Devnet if not specified) : #默认直接回车
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2: for secp256r1):
0 #输入 0 ，回车
```

#### 2. 连接到常用的 RPC

先检查当前可用的环境

```sh
sui client envs
```

可以看到目前只有 `devnet` 一个网络连接

```bash
╭────────┬────────────────────────────────────┬────────╮
│ alias  │ url                                │ active │
├────────┼────────────────────────────────────┼────────┤
│ devnet │ https://fullnode.devnet.sui.io:443 │ *      │
╰────────┴────────────────────────────────────┴────────╯
```

目前只连接 `devnet` 网络足够，如果之后需要连接其他 RPC ，参考 [Connect to a custom RPC endpoint](https://docs.sui.io/guides/developer/getting-started/connect#connect-to-a-custom-rpc-endpoint)

### 二、使用脚手架工具搭建 dApp

#### 1. 创建 dApp 项目

在确保自己安装了 `pnpm` 之后，在终端内运行：

```bash
pnpm create @mysten/create-dapp
```

在这里我们使用了 [@mysten/create-dapp](https://sui-typescript-docs.vercel.app/dapp-kit/create-dapp) 脚手架工具创建一个新的 Sui dApp 。

会有两个模板供你选择，这里选择第二个，有完整的交互代码，同时也可以给自己的项目命名：

```bash
$ pnpm create @mysten/create-dapp
.../share/pnpm/store/v3/tmp/dlx-7538     | +108 +++++++++++
.../share/pnpm/store/v3/tmp/dlx-7538     | Progress: resolved 108, reused 103, downloaded 5, added 108, done
? Which starter template would you like to use? …
  react-client-dapp React Client dApp that reads data from wallet and the blockchain
▸ react-e2e-counter React dApp with a move smart contract that implements a distributed counter

✔ Which starter template would you like to use? · react-e2e-counter
? What is the name of your dApp? (this will be used as the directory name) ‣ my-first-sui-dapp
```

#### 2. 领取 devent 代币

进入新建的 dApp 文件夹，项目自带的 `README.md` 已经将步骤写得很详细了，正常按照此步骤操作即可。

不过我们之前已经做了很多工作，其中很多步骤可以忽略。

由于模板默认使用 `devnet` 网络，我们先确认自己当前本地选择了 sui 的哪个网络：

```bash
$ sui client envs
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443  │ *      │
│ mainnet │ https://fullnode.mainnet.sui.io:443 │        │
│ local   │ http://127.0.0.1:9000               │        │
╰─────────┴─────────────────────────────────────┴────────╯
```

在 `devnet` 网络则无需改变，假如不是，也可以切换一下：

```bash
sui client switch --env devnet
```

查看当前钱包地址：

```bash
$ sui client active-address
0x4ea91b8374e431fa8a9895ee60b38fbe0adecb89b93059a9359ed329d2e6399c
```

给此钱包领取 `devnet` 上的 10sui ，将 `"recipient"` 中的内容换成自己的钱包地址：

```bash
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "<YOUR_ADDRESS>"
    }
}'
```

#### 3. 发布合约

进入 dApp 项目的 `move` 文件夹中，发布一个合约：

```bash
$ cd move/
move$

move$ sui client publish --gas-budget 100000000 counter
```

运行以上命令后，在终端中返回信息中的 `Published Objects` 中找到 `PackageID` 的值，将这个值填入 `src/constants.ts` 中：

```bash
export const DEVNET_COUNTER_PACKAGE_ID = "0xTODO";
```

#### 4. 启动 dApp

到 dApp 根目录下

```bash
pnpm install
pnpm dev
```

链接浏览器插件钱包，一定主要钱包网络要切换到 `devnet`，同时这个钱包里也要有一定测试币来支付 gas，这样第一个 sui dApp 就完成了

Task1:

由于 `devnet` 出现问题，暂时无法完成

## 发布两个 coin 合约

### 1. 创建新项目

```bash
sui move new first_coin # 项目填自己想要的名称即可
```

在 `source/` 下创建 `move` 文件，例如 `first_coin.move`

示例代码在 [创建 ERC20 代币](https://examples.sui-book.com/samples/coin.html)

编译合约

```bash
$ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING first_coin
```

### 2. 发布合约

 由于  `devnet` 挂了，这个合约是在 `testnet` 上部署的

编译合约之后会生成 `bulid` 文件夹，`cd build` 进入文件夹，然后部署合约

```bash
$ sui client publish --gas-budget 100000000 first_coin

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING first_coin
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
F8SxcwRhCWH3bFcQASFeV6xbCrQEa8amYi9WGmeKnQbr
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data
                                                  │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897
                                                  │
│ Gas Owner: 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897
                                                  │
│ Gas Budget: 100000000
                                                  │
│ Gas Price: 1000
                                                  │
│ Gas Payment:
                                                  │
│  ┌──
                                                  │
│  │ ID: 0x248dfc116dcffefaab699438572b9abdc7545830e29866e7eda290540d4ff7cb
                                                  │
│  │ Version: 12675209
                                                  │
│  │ Digest: FxZuQwfARTiuQTUZtogpPo8ckXSC1thWS3QjjP12rSpx
                                                  │
│  └──
                                                  │
│
                                                  │
│ Transaction Kind : Programmable
                                                  │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897" })]                     │
│ Commands: [
                                                  │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),
                                                  │
│ ]
                                                  │
│
                                                  │
│
                                                  │
│ Signatures:
                                                  │
│    /VJCJ1VY0kxlzhaEv8gtltfnNXUjIv6aio5pyMJtFIDxszn8D/uIzMWJ7+E8LoVhyAoZJ5LDm0PADcXW1QXkBg==
                                                  │
│
                                                  │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: F8SxcwRhCWH3bFcQASFeV6xbCrQEa8amYi9WGmeKnQbr                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 193                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1e8048e13a749414121a971f067b72e781bced31015d722c1ed66a0ab2a8832a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: BXiJK7BUByNa6tEQtBUghMeAzYWg5iLPMURFCPztC7Cn                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x56ac2b58ea219e6ffa31913c4a89cc88201354ef67ecad14eaf1e5c90ca24c1a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 12675210                                                                              │
│  │ Digest: 6pGSs5EnRNRtVa2bXmWsFLWDhMxQdDWyyoVdb66atfFH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x71b4c3ce628c02c3cb3257832c36ebbcb24a0f9bfea05d3b2039f73d524fd2e6                         │
│  │ Owner: Account Address ( 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897 )  │
│  │ Version: 12675210                                                                              │
│  │ Digest: 67AujqwzqTVfN4ayZPSrvK5n4jft4Cz5xXNUt4QEvxgx                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x94ed150b87ca6d5526ac4cca1c2ccaf16417a807bf1f009c9e6210085bc8f14a                         │
│  │ Owner: Account Address ( 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897 )  │
│  │ Version: 12675210                                                                              │
│  │ Digest: CuTLbTmAsS6rgyBafSBE73nSGMxPysZggoFKxHBr2v5g                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x248dfc116dcffefaab699438572b9abdc7545830e29866e7eda290540d4ff7cb                         │
│  │ Owner: Account Address ( 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897 )  │
│  │ Version: 12675210                                                                              │
│  │ Digest: DyTSLdrd79Ke6kSjMVMZ5AqYU3xNqCeFndUtJjUH71Me                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x248dfc116dcffefaab699438572b9abdc7545830e29866e7eda290540d4ff7cb                         │
│  │ Owner: Account Address ( 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897 )  │
│  │ Version: 12675210                                                                              │
│  │ Digest: DyTSLdrd79Ke6kSjMVMZ5AqYU3xNqCeFndUtJjUH71Me                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 12752800                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3pcBpJcaTZJstk5Ssu13zXjSaNQX2Xw1U2F66C9dajq5                                                   │
│    B4SeBZuyptHAgjSrWBECoP5MhUMmXnkSg8pwmwBaB9hQ                                                   │
│    Bkvb1fhqAgtZFiV16EweRNXFgutju5LV87tVA8W6c7za                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects:
 ┌──
 │ ObjectID: 0x56ac2b58ea219e6ffa31913c4a89cc88201354ef67ecad14eaf1e5c90ca24c1a
 │ Sender: 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897
 │ Owner: Immutable
 │ ObjectType: 0x2::coin::CoinMetadata<0x1e8048e13a749414121a971f067b72e781bced31015d722c1ed66a0ab2a8832a::first_coin::FIRST_COIN>
 │ Version: 12675210
 │ Digest: 6pGSs5EnRNRtVa2bXmWsFLWDhMxQdDWyyoVdb66atfFH
 └──
 ┌──
 │ ObjectID: 0x71b4c3ce628c02c3cb3257832c36ebbcb24a0f9bfea05d3b2039f73d524fd2e6
 │ Sender: 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897
 │ Owner: Account Address ( 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897 )
 │ ObjectType: 0x2::coin::TreasuryCap<0x1e8048e13a749414121a971f067b72e781bced31015d722c1ed66a0ab2a8832a::first_coin::FIRST_COIN>
 │ Version: 12675210
 │ Digest: 67AujqwzqTVfN4ayZPSrvK5n4jft4Cz5xXNUt4QEvxgx
 └──
 ┌──
 │ ObjectID: 0x94ed150b87ca6d5526ac4cca1c2ccaf16417a807bf1f009c9e6210085bc8f14a
 │ Sender: 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897
 │ Owner: Account Address ( 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897 )
 │ ObjectType: 0x2::package::UpgradeCap
 │ Version: 12675210
 │ Digest: CuTLbTmAsS6rgyBafSBE73nSGMxPysZggoFKxHBr2v5g
 └──

Mutated Objects:
 ┌──
 │ ObjectID: 0x248dfc116dcffefaab699438572b9abdc7545830e29866e7eda290540d4ff7cb
 │ Sender: 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897
 │ Owner: Account Address ( 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>
 │ Version: 12675210
 │ Digest: DyTSLdrd79Ke6kSjMVMZ5AqYU3xNqCeFndUtJjUH71Me
 └──

Published Objects:
 ┌──
 │ PackageID: 0x1e8048e13a749414121a971f067b72e781bced31015d722c1ed66a0ab2a8832a
 │ Version: 1
 │ Digest: BXiJK7BUByNa6tEQtBUghMeAzYWg5iLPMURFCPztC7Cn
 | Modules: first_coin
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x6ae6dec21ed0f6d60022a1a17d7af806b3ee91e957a2e0135a00c78befb08897 )
 │ CoinType: 0x2::sui::SUI
 │ Amount: -12774680
 └──
```

在 `testnet` 上可以查看到合约记录

1. [F8SxcwRhCWH3bFcQASFeV6xbCrQEa8amYi9WGmeKnQbr](https://suiexplorer.com/txblock/F8SxcwRhCWH3bFcQASFeV6xbCrQEa8amYi9WGmeKnQbr?network=testnet)
2. [JCdFR7kNksmf37T9eCYTSerEuNBB1KVWYRV32iPcYSK6](https://suiexplorer.com/txblock/JCdFR7kNksmf37T9eCYTSerEuNBB1KVWYRV32iPcYSK6?network=testnet)