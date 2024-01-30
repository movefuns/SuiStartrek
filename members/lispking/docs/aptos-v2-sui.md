---
marp: true
headingDivider: 2
paginate: true
footer: github · [lispking](https://github.com/lispking)
---

# Aptos 和 Sui 环境差异分析

###### Author: github/lispking
###### Write By 01.30.2024

## Aptos Move.toml

* 优势：一个 Aptos 可执行文件解决编译和部署能力
* 劣势：需手动配置钱包 Address

```toml
[package]
name = "my_todo_list"
version = "1.0.0"
authors = []

[addresses]
todolist_addr='<YOUR_ADDRESS>'

[dev-addresses]

[dependencies.AptosFramework]
git = "https://github.com/aptos-labs/aptos-core.git"
rev = "devnet"
subdir = "aptos-move/framework/aptos-framework"

[dev-dependencies]
```

## Sui Move.toml

* 优势：无须配置钱包 Address
* 劣势：针对三种网络(mainnet,devnet,testnet)可执行文件，需分别用对应版本编译和部署，意味着不能用 mainnet 编译完，再部署到 devnet 网络）

```toml
[package]
name = "first_package"
version = "0.0.1"

[dependencies]
Sui = { git = "https://github.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "devnet" }

[addresses]
first_package = "0x0"
```

> 赞优势，但差评劣势

## 编译命令

* Aptos 合约编译

    ```bash
    aptos move compile
    aptos move clean
    ```

* Sui 合约编译

    ```bash
    sui move build
    ```

    > 无 clean 命令，差评

## 合约部署

* Aptos 实现

    ```bash
    aptos move publish --skip-fetch-latest-git-deps --assume-yes
    ```

* Sui 实现

    ```bash
    # 首次需执行以下命令，否则，会提示 <FILE-PATH>/.sui/sui_config/client.yaml 不存在
    sui client --yes envs

    # 合约部署，需指定 Gas，值不能太小，官方文档推荐的值 20000000 不好用，经常部署不上去，建议调大一点，改用 100000000
    sui client publish --skip-fetch-latest-git-deps --gas-budget <GasBudget>
    ```

## 从密钥还原钱包

* Aptos 实现

    ```bash
    aptos init --private-key <PrivateKey> --assume-yes --network <network>
    ```

* Sui 实现

    ```bash
    sui keytool import <PrivateKey> <KeyScheme>
    ```

## DevNet 取测试币

* Aptos 实现

    ```bash
    aptos account fund-with-faucet --account default
    ```

    > 贴心，值得点赞

* Sui 实现

    ```bash
    curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
    --header 'Content-Type: application/json' \
    --data-raw '{
        "FixedAmountRequest": {
            "recipient": "<YOUR SUI ADDRESS>"
        }
    }'
    ```

    > 差评，还有一种差评途径是到 Discord 手工取水


## 环境变量均缺失

* Aptos 和 Sui 均给差评，均没有文档说明这块，只能看源码了解到一二

* MOVE_HOME 两者并没提示，差评

* Sui 提供 SUI_CONFIG_DIR 比 Aptos 贴心，但是文档没提出来，还是差评


## help 指南

* aptos -h 做得较为清晰友好

* sui -h 稍为差一些


## 环境评估结论

### Sui 学习门槛比 Aptos 要高一些

### 若将整体取水流程串起来，Aptos 两步完成，而 Sui 需要四步完成

* Aptos 流程：导入密钥还原钱包 > 取水
* Sui 流程：初始化环境 > 导入密钥还原钱包 > 切换钱包地址到对应网络 > 取水

> 若两者能互相综合各自优势整合，对初学者将会更友好