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

## 2. NFT 学习

类比以太坊的 ERC-721，Sui 的 NFT 也是类似的。
合约源码：https://github.com/sycute/learn-move-sui/tree/main/contracts/nft

tx_id: https://suiexplorer.com/txblock/DHtP6xyShvjGCZpPyK19SSV6db6fu8sALGn1GPYPvuxk?network=testnet
PackageID: 0x6be5ae949644e92fb04cb1714fca6ffcbd830243827d3d60a229ff2badf3785e

mint 操作：https://suiexplorer.com/txblock/9UYCuBvkwTWCa8eWWFbomUGgqEDi3x2gvbAUoYvR3j7J?network=testnet
burn 操作: https://suiexplorer.com/txblock/8zFbb2F5FRzSnq1LtqwsPsskMqZ5XCMqw7ewX1Bgh4Ky?network=testnet

## 3. erc20 学习

使用 Sui 的 coin 库很方便创建同质化代币。此处使用 cap 做管理员权限，限制 mint。

合约源码：
tx: https://suiexplorer.com/txblock/7hMVAFti5A5DY6f6s2QibbdLdhjEB4tbJrtKpxA8eQTA?network=testnet
PackageID: https://suiexplorer.com/txblock/7hMVAFti5A5DY6f6s2QibbdLdhjEB4tbJrtKpxA8eQTA?network=testnet

## 4. 回合制卡牌对战游戏

- 玩家创建卡牌（随机生成攻击力和防御）
- 玩家创建房间/加入房间
- 玩家选择攻击或者防御，攻击消耗行动力
  一方血量归零，游戏结束。

tx: https://suiexplorer.com/txblock/Cerf6hYarncSXeiWY3Rv8288ChjBfPkUyW1brF3kJ1qo?network=testnet

回合制卡牌对战页面试玩（测试网 https://sui-card-battle.pages.dev）

## 5. 学习记录文章

[配置环境](https://learnblockchain.cn/article/7663)
[NFT合约](https://learnblockchain.cn/article/7666)
[卡牌对战游戏](https://learnblockchain.cn/article/7665)

[同步发表在掘金](https://juejin.cn/column/7347616740853022770)
