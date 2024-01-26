## 1. 安装 Sui 及配置

> 操作系统：Ubuntu 22.04

### 1.1 安装 Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update stable
```

### 1.2 安装 Sui

```bash
sudo apt-get update
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

安装 sui

```bash
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```

### 1.3 安装 move 插件

在 intellij 插件市场搜索安装 `Sui Move Lanaguage`

### 1.4 添加主网和测试网

```bash
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
sui client new-env --alias mainnet --rpc https://sui-mainnet.nodeinfra.com:443

// 切换网络
sui client switch --env testnet
```

测试网水龙头 token

```bash
curl http://getsui.com/address/<ADDRESS>
```

钱包相关命令

```bash
// 导入钱包
sui keytool import <PATH>
// 切换address
sui client switch --address <ADDRESS>
// 当前保存的密钥
sui client addresses
// 当前启用的密钥
sui client active-address
```
