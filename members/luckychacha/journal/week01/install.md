## 1. sui-cli 安装

### 1.1 安装Sui命令行

- 按照Rust官网  [get-started](https://www.rust-lang.org/learn/get-started) 的内容
```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
### 1.2 本地二进制安装

> 下载位置位于 `$HOME/.cargo/bin/sui`

```bash
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```

此命令同样可以用于更新Sui命令行工具。

### 1.3 本地源码安装

```bash
# 切换到最新的发布分支
(main)$ git checkout -b mainnet-v1.13.0 mainnet-v1.13.0
Switched to a new branch 'mainnet-v1.13.0'

# 编译
(mainnet-v1.13.0)$ cargo build --release
......漫长等待......
   Finished release [optimized + debuginfo] target(s) in 23m 10s
```

### 1.4 安装完成

```bash
❯ sui --version
sui 1.14.0-a48eee624
```

## 2. 浏览器钱包插件安装

在 chrome 应用商店中搜索 `sui wallet`，点击安装即可。

### 2.1 导入`sui-cli`创建的钱包的方法

#### 2.1.1 方法1

- 第一步

```
cd ~/.sui/sui_config
```  
- 第二步 取到私钥keypair字符串 

```
cat sui.keystore
```

- 第三步的: 用私钥keypair字符串转成原始私钥,
  - 去掉中间空格(换行)，在去掉最后两位，得到私钥。  

```
echo "AAmpCzo3n+thokZ1cVRN6v00000000000(这里你的字符串)"  | base64 -d | xxd -p
```

#### 2.1.2 方法2
```
sui keytool convert xxxx(store in sui.keystore)
```

## 3.领取 devnet 测试币

### 3.1 从 discord 领取

### 3.2 使用 curl 直接获取

```bash
❯ sui client active-address
0xYOUR_ADDRESS

❯ curl --location --request POST 'https://faucet.devnet.sui.io/gas' --header 'Content-Type: application/json' --data-raw '{\n
    "FixedAmountRequest": {\n
        "recipient": "0xYOUR_ADDRESS\n
    }\n
}'
```