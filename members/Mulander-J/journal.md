# 学习日志

## Learn-001: Sui Start

At 2024.02.02.

### 投石问路 Glance of Sui

Move出来有一阵了，23年听说过Aptos和Sui；正好当下工作接触到Aptos，就顺带学习下Sui+Move。

[Sui](sui.io) 开发环境一览，对于rust和node使用者相对友好？

**[Sui Doc](https://docs.sui.io)**
- Sui API
  - [JSON-RPC](https://docs.sui.io/references/sui-api)
  - [Graphql](https://docs.sui.io/references/sui-graphql)
- [Sui Cli](https://github.com/MystenLabs/sui)
- Sui SDK
  - [typescript](https://sdk.mystenlabs.com/typescript)
  - [rust](https://github.com/MystenLabs/sui/tree/main/crates/sui-sdk)
- [Sui Framework](https://github.com/MystenLabs/sui/tree/main/crates/sui-framework/docs)


### 初入山门 What's Sui

- What's Startrek
- What's Sui
- What's Move

| 模块 | 主题 | 讲师 | 组织 | 链接 |
| ---- | ---- | ---- | ---- | ---- |
| Workshop | 开营仪式 | Xuan | MoveFuns DAO | [点击观看](https://www.youtube.com/embed/UxBAIr6d2-8?si=5XqVmzwKynWstX_0) |
| Workshop | 什么是Move | UVD | MoveFuns DAO | [点击观看](https://www.youtube.com/embed/VJweQrWJCxM?si=IaWbfetsZ7ZxkWPP) |
| Workshop | Move object & 所有权 | UVD | MoveFuns DAO | [点击观看](https://www.youtube.com/embed/jUiPV5UbiTA?si=hXU52a2RkbYymp1T) |

### 一扫门前雪 Install Sui

> windows11 / WSL2 / Ubuntu 22.04.2 LTS

**Sui 开发环境配置**
- [Sui(Github)](https://github.com/MystenLabs/sui) 
- [sui install doc(en)](https://docs.sui.io/guides/developer/getting-started/sui-install)
- [sui install doc(zh-cn)](https://intro-zh.sui-book.com/unit-one/lessons/1_%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83.html)
- [sui install video($bili^2$)](https://www.bilibili.com/video/BV1RY411v7YU/)

```bash
# 已安装Rust
➜  rustc -V
rustc 1.73.0 (cc66ad468 2023-10-03)
# 下载依赖
➜  sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
# Install Sui binaries from source
# 安装mainnet版本 branch
➜  cargo install --locked --git https://github.com/MystenLabs/sui.git --branch mainnet sui
# 安装testnet版本 testnet branch
➜  cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
# 构建会比较慢，耐心等待
Compiling ...
Building[===>]
# 检验 binaries 是否安装成功
➜  sui --version
sui 1.17.3-ebcb58ff2

➜  ~ sui -h
A Byzantine fault tolerant chain with low-latency finality and high throughput

Usage: sui <COMMAND>

Commands:
  start             Start sui network
  network
  genesis           Bootstrap and initialize a new sui network
  genesis-ceremony
  keytool           Sui keystore tool
  console           Start Sui interactive console
  client            Client for interacting with the Sui network
  validator         A tool for validators and validator candidates
  move              Tool to build and test Move applications
  fire-drill        Tool for Fire Drill
  help              Print this message or the help of the given subcommand(s)

Options:
  -h, --help     Print help
  -V, --version  Print version
```

**Issues**

报`SSL error`大概率为网络波动或者需要更新代理配置。

```bash
➜  ~ cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
    Updating git repository `https://github.com/MystenLabs/sui.git`
error: failed to fetch into: /home/${user}/.cargo/git/db/sui-6ac459c53b1b685a

Caused by:
  network failure seems to have happened
  if a proxy or similar is necessary `net.git-fetch-with-cli` may help here
  https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-with-cli

Caused by:
  SSL error: unknown error; class=Ssl (16)
```

## Learn-002: Aptos Start

At 2024.02.04.

### Glance of Aptos

[aptosfoundation.org](https://aptosfoundation.org/) 开发环境一览，对于游戏友好？

**[aptos.dev](https://aptos.dev/)**
- API
  - [Rest](https://aptos.dev/apis/fullnode-rest-api)
  - [Graphql](https://aptos.dev/indexer/indexer-landing)
- SDK
  - [aptos-core/sdk](https://github.com/aptos-labs/aptos-core/tree/main/sdk)
  - [aptos-core/ecosystem/python](https://github.com/aptos-labs/aptos-core/tree/main/ecosystem/python/sdk)
  - [aptos-ts-sdk](https://github.com/aptos-labs/aptos-ts-sdk)
  - [Aptos-Unity-SDK](https://github.com/aptos-labs/Aptos-Unity-SDK)
- [MMove Framework](https://aptos.dev/reference/move)

### Install Aptos

> windows11 / WSL2 / Ubuntu 22.04.2 LTS

**Aptos 开发环境配置**
- [aptos-core/cli](https://github.com/aptos-labs/aptos-core/releases?q=cli&expanded=true)
- [aptos cli doc(en)](https://aptos.dev/tools/aptos-cli/)

```bash
# Install CLI by script
➜  python3 --version
Python 3.10.12

➜  curl -fsSL "https://aptos.dev/scripts/install_cli.py" | python3
Latest CLI release: 2.4.0
Currently installed CLI: None
Determined target to be: Ubuntu-22.04-x86_64

Welcome to the Aptos CLI installer!

This will download and install the latest version of the Aptos CLI at this location:

/home/user/.local/bin

Installing Aptos CLI (2.4.0): Downloading...
Installing Aptos CLI (2.4.0): Done!

The Aptos CLI (2.4.0) is installed now. Great!

You can test that everything is set up by executing this command:

aptos info

➜  aptos info
{
  "Result": {
    "build_branch": "main",
    "build_cargo_version": "cargo 1.74.1 (ecb9851af 2023-10-18)",
    "build_clean_checkout": "true",
    "build_commit_hash": "8f4663da411befd7314f9d14312fc40f113309d4",
    "build_is_release_build": "true",
    "build_os": "linux-x86_64",
    "build_pkg_version": "2.4.0",
    "build_profile_name": "cli",
    "build_rust_channel": "1.74.1-x86_64-unknown-linux-gnu",
    "build_rust_version": "rustc 1.74.1 (a28077b28 2023-12-04)",
    "build_tag": "",
    "build_time": "2024-01-05 12:43:33 +00:00",
    "build_using_tokio_unstable": "true"
  }
}

➜  aptos -h
Command Line Interface (CLI) for developing and interacting with the Aptos blockchain

Usage: aptos <COMMAND>

Commands:
  account     Tool for interacting with accounts
  config      Tool for interacting with configuration of the Aptos CLI tool
  genesis     Tool for setting up an Aptos chain Genesis transaction
  governance  Tool for on-chain governance
  info        Show build information about the CLI
  init        Tool to initialize current directory for the aptos tool
  key         Tool for generating, inspecting, and interacting with keys
  move        Tool for Move related operations
  multisig    Tool for interacting with multisig accounts
  node        Tool for operations related to nodes
  stake       Tool for manipulating stake and stake pools
  update      Update the CLI itself
  help        Print this message or the help of the given subcommand(s)

Options:
  -h, --help     Print help
  -V, --version  Print version
```
