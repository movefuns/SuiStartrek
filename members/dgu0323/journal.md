# 学习日志

## 环境准备

[官方文档](https://docs.sui.io/guides/developer)

### install

```
# install sui
brew install sui

# check sui install
sui --version

# install rust
省略，已经装好
```

## IDE 插件

### IDEA

https://github.com/movefuns/intellij-move/blob/master/README.zh_CN.md

### VS Code

sui-move-analyzer

```
cargo install --git https://github.com/movebit/move --tag sui_move_analyzer_release_v1.1.3 sui-move-analyzer
```

安装目录：`~/.cargo/bin/sui-move-analyzer`

```
# check install
sui-move-analyzer --version
sui-move-analyzer 1.1.3
```

sui-move-analyzer By [MoveBit](https://www.movebit.xyz/)

MoveBit 是 move 生态的安全审计公司，比如 sui 和 aptos 生态的各类 dapp

## sui 简单的 dapp

[官方文档](https://sdk.mystenlabs.com/typescript)

官方支持 npm, pnpm, yarn, 推荐使用 pnpm 因为速度快

### 创建 dapp

[官方文档](https://sdk.mystenlabs.com/dapp-kit/create-dapp)

```
# 创建项目
mkdir suitest
cd suitest
pnpm create @mysten/dapp
## 选 react-e2e-counter 包括一个合约

# 设置本地env
## 查看本地env，默认没有，点y创建
sui client envs
## 添加devnet 和 testnet 的 env
sui client new-env --alias devnet --rpc https://fullnode.devnet.sui.io:443
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443
## 生成配置文件 ~/.sui/sui_config/client.yaml
## 切换devnet
sui client switch --env devnet

# 创建钱包/地址
## 查看本地所有地址
sui client addresses
## 查看默认激活地址
sui client active-address
## 创建新钱包
sui client new-address ed25519
## 切换到新钱包
sui client switch --address 0xe69934571665b5a3f750559c40c54a1e35678910a563e436404d0461a31f39e3
## 领水
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0xe69934571665b5a3f750559c40c54a1e35678910a563e436404d0461a31f39e3"
    }
}'
### 结果
{
    "transferredGasObjects":
    [
        {
            "amount": 10000000000, // 金额
            "id": "0x588edab10f1cf860e4e3ed82288b4ac487de532d88b11664eaa1843cbfe84753", // 对象id
            "transferTxDigest": "8RBs2y3ZfcoKJDtEy9E4B9vv1HJKB57STjTJ998Mocmd" // 交易id
        }
    ],
    "error": null
}

## 查看私钥
cat ~/.sui/sui_config/sui.keystore
## 私钥顺序和 sui keytool list 的顺序一致
## 如果用私钥导入钱包需要将base64转换hex
sui keytool convert APY8fitI2XKrzz/0ZumTGoMpEDGoQu8rWPkvbqkZitnL
## 在网页钱包中用私钥导入本地terminal
sui keytool import <private_key> ed25519

## 删除本地地址
在 ~/.sui/sui_config/sui.keystore 中删除不要的即可

## 查看余额
sui client gas

## 查看 balance from explorer
https://suiexplorer.com/address/0xe69934571665b5a3f750559c40c54a1e35678910a563e436404d0461a31f39e3?network=devnet
## 查看 transaction from explorer
https://suiexplorer.com/txblock/8RBs2y3ZfcoKJDtEy9E4B9vv1HJKB57STjTJ998Mocmd?network=devnet

# 发布合约
cd move
sui client publish --gas-budget 100000000 counter
## 查看交易
https://suiexplorer.com/txblock/5r5qdVQ2QaYofgYqHGUcAYnR3cjZwKSo8SaJZQ2paY6e?network=devnet
packageId: 0x4a3e8ebeb9bfdceeaac1d3126061e1af56b0be852352fe37c50dab4fccbea1f6

# 修改前端代码中的packageId
文件：src/constants.ts
export const DEVNET_COUNTER_PACKAGE_ID = "0x4a3e8ebeb9bfdceeaac1d3126061e1af56b0be852352fe37c50dab4fccbea1f6";

# 安装前端依赖
pnpm install

# 启动前端项目
pnpm dev

## 访问 http://localhost:5173/
```

## ERC20

```
sui client publish --gas-budget 100000000 coin

sui move new sharecoin
sui move build
sui client publish --gas-budget 100000000 sharecoin
```

## 命令行支付

```
# 查看当前余额是utxo
sui client gas

# pay sui
sui client pay-sui --input-coins 0x588edab10f1cf860e4e3ed82288b4ac487de532d88b11664eaa1843cbfe84753 --amounts 1000000000 --recipients 0x09b724887e8f2f6f3e13ed09a03bf9a577d7c668b735627cd14aa9dc129441d2 --gas-budget 10000000

-input-coins 为某个utxo id
1sui = 1 + 9个0
```

