# 学习成果

## 2024/03/13
### 了解sui生态

### 开发环境搭建
基于Ubuntu 22.04 LTS + VSCode Remote SSH
1. 安装基础依赖
```shell
apt install -y curl git-all libssl-dev libclang-dev cmake pkg-config libprotobuf-dev protobuf-compiler clang
```

2. 安装Rust和Cargo
Rust是一种系统编程语言，类似于C++，但是更安全，更快。Rust的包管理器是Cargo【类似nodejs与npm的关系】
```shell
# https://github.com/rust-lang/rustup/blob/master/rustup-init.sh
# https://www.rust-lang.org/tools/install

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# 1) Proceed with standard installation (default - just press enter)
# 2) Customize installation
# 3) Cancel installation
# > 1
```
- 查看Rust版本： `rustc --version` 【重启终端重载bash环境变量】
- 卸载Rust： `rustup self uninstall`

3. 安装sui(贼慢)
```shell
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
```

- 查看sui版本: `sui`

### Sui cli 常用命令
- 参考文档：https://docs.sui.io/references/cli/client

`sui client`
- `sui client` 创建钱包
- `sui client new-address ed25519` 创建新钱包
- `sui client addresses` 查看所有钱包
- `sui client active-address` 当前活跃地址
- `sui client switch --address [ADDRESS]` 切换活跃地址
- `sui client objects [ADDRESS]` 查看地址信息,包括balance,nft...
- `sui client publish --gas-budget 10000000` 发布合约(--gas-budget 10000000 为gas预算)

`sui keytool`
- `sui keytool import "助记词" ed25519` 导入钱包

`sui move`
- `sui move new move_demo` 创建新的move文件(合约)
创建完成后会生成一个move_demo文件夹，其中`Move.toml`为配置文件，sources用来存放move合约代码
- `sui move build` 编译move合约

### 配置文件 Move.toml

- `[package]`: 简介与版本控制，如果需要给别人使用该package，可以命名为Object ID
- `[dependencies]`: 依赖，可以引入其他package

