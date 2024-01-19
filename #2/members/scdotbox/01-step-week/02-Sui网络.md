# Sui 网络

+ Sui 网络提供不同的环境，用于 Sui Move 语言开发和测试合约程序，包括：
    + 本地网络
    + Sui 官方测试网络
    + Sui 官方开发网络
    + Sui 官方正式网络

+ 因为合约程序的开发、测试和使用，需要 Gas 费用，不同的网络内也是需要申请、购买、转账等获取 Gas 费用


## 1. Sui网络相关用法
### 1.1查询网络
```bash
# 列出当前所有网络别名
sui client envs

# 添加新的网络别名
sui client new-env --alias <ALIAS> --rpc <RPC>
# eg1: 添加主网rpc到本地cli环境
# sui client new-env --alias mainnet --rpc https://sui-mainnet.nodeinfra.com:443
# eg2: 添加本地网rpc到本地cli环境
# sui client new-env --alias localnet --rpc http://127.0.0.1:9000

# 切换当前网络
sui client --switch envs <alias>
```


## 2. 本地网络
+ todo：本地网络搭建和加入

## 3.测试网络获取 Gas 费用
切换到测试网络
```bash
sui client --switch envs testnet
```
1. 方案1
    1. 加入 [Sui Discord](https://discord.gg/sui)
    2. 完成身份验证步骤
    3. 进入 #devnet-faucet 频道
    4. 输入 !faucet <WALLET ADDRESS>
2. 方案2
```bash
curl --location --request POST '<https://faucet.testnet.sui.io/gas>' \\
--header 'Content-Type: application/json' \\
--data-raw '{"FixedAmountRequest":{"recipient":"<WALLET ADDRESS>"}}'
```

## 4.开发网络获取 Gas 费用
切换到测试网络
```bash
sui client --switch envs devnet
```
1. 方案1
    1. 加入 [Sui Discord](https://discord.gg/sui)
    2. 完成身份验证步骤
    3. 进入 #devnet-faucet 频道
    4. 输入 !faucet <WALLET ADDRESS>
2. 方案2
```bash
curl --location --request POST '<https://faucet.devnet.sui.io/gas>' \\
--header 'Content-Type: application/json' \\
--data-raw '{"FixedAmountRequest":{"recipient":"<WALLET ADDRESS>"}}'
```


## 参考：
1. [Sui CLI 命令](https://docs.sui.io/references/cli/client)
2. [sui-move-intro-course](https://github.com/sui-foundation/sui-move-intro-course/blob/main/unit-one/lessons/1_set_up_environment.md)
