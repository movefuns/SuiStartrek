# 学习日志

# Roadmap 1

## 安装

### 安装 Sui 命令行

Sui 的命令行有三种安装方式，我因为我本身对 Rust 有一定的了解，Sui 命令行本身是 rust 编写的所以我选择了用
编译安装的方式

- 按照 Rust 官网 [get-started](https://www.rust-lang.org/learn/get-started) 的内容

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

```
1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
```

本地安装 Sui Binaries
参考页面

### 安装依赖 (取决于操作系统)
Rust备选安装方法
Homebrew备选安装方法
推荐Rust入门课

安装 Sui binaries

cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui

检验 binaries 是否安装成功:

sui --version
sui 1.18.0-b1fe1f07f

### 为 VS Code 配置 Sui Move Analyzer 插件
使用cargo安装: cargo install --git https://github.com/movebit/move --branch move-analyzer2-release move-analyzer

从 VS Marketplace 安装 sui-move-analyzer 插件

### Sui CLI 基础用法

管理网络
切换网络: sui client switch --env [network alias]
默认网络别名:
本地网 localnet: http://0.0.0.0:9000
开发网 devnet: https://fullnode.devnet.sui.io:443
列出当前所有网络别名: sui client envs

suhao@suhao ~ %  sui client envs
Config file ["/Users/suhao/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?
Cannot open wallet config file at "/Users/suhao/.sui/sui_config/client.yaml". Err: Unable to load config from /Users/suhao/.sui/sui_config/client.yaml
suhao@suhao ~ %  sui client envs
Config file ["/Users/suhao/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?y
Sui Full node server URL (Defaults to Sui Devnet if not specified) :
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2: for secp256r1):
1
Generated new keypair and alias for address with scheme "secp256k1" [great-quartz: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c]
Secret Recovery Phrase : [pond worry swing oven kangaroo obscure south young panther element wing profit]
╭────────┬────────────────────────────────────┬────────╮
│ alias  │ url                                │ active │
├────────┼────────────────────────────────────┼────────┤
│ devnet │ https://fullnode.devnet.sui.io:443 │ *      │
╰────────┴────────────────────────────────────┴────────╯

添加新的网络别名: sui client new-env --alias <ALIAS> --rpc <RPC>
查询启用地址和 Gas Objects
查询当前保存了密钥的地址: sui client addresses
查询当前启用的地址: sui client active-address
列出所拥有的 gas objects: sui client gas
获得开发网 Devnet 的 Sui Tokens
加入 Sui Discord
完成身份验证步骤
进入 #devnet-faucet 频道
输入 !faucet <WALLET ADDRESS>
如果使用Discord不方便或faucet故障，可以直接在终端输入指令

curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{"FixedAmountRequest":{"recipient":"0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c"}}'

╭────────────────────────────────────────────────────────────────────┬─────────────╮
│ gasCoinId                                                          │ gasBalance  │
├────────────────────────────────────────────────────────────────────┼─────────────┤
│ 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461 │ 10000000000 │
╰────────────────────────────────────────────────────────────────────┴─────────────╯

获得测试网 Testnet 的 Sui Tokens
加入 Sui Discord
完成身份验证步骤
进入 #testnet-faucet 频道
输入 !faucet 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461


- [第一个 Sui 智能合约](./docs/counter.md)
- [第一个 Sui NFT](./docs/nft.md)
- [第一个 Sui Game](./docs/tic-tac-toe.md)
