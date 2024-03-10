# 学习日志

## 1. 配置 Sui 环境

### 1.1 安装 Sui

```shell
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui


### 1.2 localnet 环境

创建 localnet 环境

```
sui client new-env --alias localnet --rpc http://127.0.0.1:9000
```


### 1.4 testnet 环境

创建 testnet 环境

```
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
```

获取 testnet token

- cat <KEYSTORE_PATH>/sui.keystore 找到私钥。<KEYSTORE_PATH>一般存放在~/.sui/sui_config 文件夹下面
- sui keytool convert <PRIVATE_KEY>得到 hex 的密钥
- 打开 sui wallet, 导入私钥，创建账号
- 在 sui wallet 中切换到 testnet 网络，然后点击 Request Testnet SUI Tokens 按钮得到测试币

## 2. 部署 Package

- 生成代码

```
sui move new <package名称>
```

- 编译

```
sui move build
```

- 发布

```
sui client publish --skip-fetch-latest-git-deps --skip-dependency-verification  --gas-budget 100000000
```

- 访问 https://suiexplorer.com/ 查看
