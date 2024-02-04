# 学习日志

## Move->Sui->Startrek

At 2024.02.02.

### 投石问路

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


### 初入山门

- What's Startrek
- What's Sui
- What's Move

| 模块 | 主题 | 讲师 | 组织 | 链接 |
| ---- | ---- | ---- | ---- | ---- |
| Workshop | 开营仪式 | Xuan | MoveFuns DAO | [点击观看](https://www.youtube.com/embed/UxBAIr6d2-8?si=5XqVmzwKynWstX_0) |
| Workshop | 什么是Move | UVD | MoveFuns DAO | [点击观看](https://www.youtube.com/embed/VJweQrWJCxM?si=IaWbfetsZ7ZxkWPP) |
| Workshop | Move object & 所有权 | UVD | MoveFuns DAO | [点击观看](https://www.youtube.com/embed/jUiPV5UbiTA?si=hXU52a2RkbYymp1T) |

### 一扫门前雪

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
# 安装testnet版本 testnet branch
➜  cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
# 构建会比较慢，耐心等待
Compiling ...
Building[===>]
# 检验 binaries 是否安装成功
➜  sui --version
sui 1.17.3-ebcb58ff2
# 安装其他版本 mainnet branch
➜  cargo install --locked --git https://github.com/MystenLabs/sui.git --branch mainnet sui
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
