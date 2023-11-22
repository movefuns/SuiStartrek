# 学习日志

## Week1（2023/11/13 - 2023/11-19）
### 安装环境
* [B站视频](https://www.bilibili.com/video/BV1RY411v7YU)
* [官方文档](https://docs.sui.io/guides/developer/getting-started/sui-install)

  
### 安装成功测试
```
sui --version
sui 1.14.0-a48eee624
```
### 领水
```
curl --location --request POST 'https://faucet.devnet.sui.io/gas'    --header 'Content-Type: application/json'  --data-raw '{ "FixedAmountRequest" : { "recipient" : "0x75027df10221b8667ffe3a820b15c7a94b9d5bb917effd0f0b7a947c1d2c9476"}}' 

{"transferredGasObjects":[{"amount":10000000000,"id":"0xa8be08de49ebfebda196ed62f9b96fa5af51f38ca6947410ec65b2793552793c","transferTxDigest":"AjRk83qDur1h1HNAdQrsqhq9uPcN584MPN81WpgQwxx4"}],"error":null}%   ```
```
### gas
```
sui client gas      
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.14.1
╭────────────────────────────────────────────────────────────────────┬─────────────╮
│ gasCoinId                                                          │ gasBalance  │
├────────────────────────────────────────────────────────────────────┼─────────────┤
│ 0xa8be08de49ebfebda196ed62f9b96fa5af51f38ca6947410ec65b2793552793c │ 10000000000 │
╰────────────────────────────────────────────────────────────────────┴─────────────╯
```
### 当前环境
```
sui client active-env
devnet

```

###  地址
```
angjiaojiao@192 hell_world % sui client addresses
╭───────────────┬──────────────────────────────────────────────────────────────────────────╮
│ activeAddress │  0x75027df10221b8667ffe3a820b15c7a94b9d5bb917effd0f0b7a947c1d2c9476      │
│ addresses     │ ╭──────────────────────────────────────────────────────────────────────╮ │
│               │ │  0x75027df10221b8667ffe3a820b15c7a94b9d5bb917effd0f0b7a947c1d2c9476  │ │
│               │ ╰──────────────────────────────────────────────────────────────────────╯ │
╰───────────────┴──────────────────────────────────────────────────────────────────────────╯

```

### 发布
```
ui client publish --gas-budget 3000
[warn] Client/Server api version mismatch, client api version : 1.14.0, server api version : 1.14.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hell_world
Successfully verified dependencies on-chain against source.
Cannot find gas coin for signer address [0x75027df10221b8667ffe3a820b15c7a94b9d5bb917effd0f0b7a947c1d2c9476] with amount sufficient for the required gas amount [3000].

```
