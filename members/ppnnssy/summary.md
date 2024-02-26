# 学习成果

## Roadmap 1

- [发布的 helloworld 合约](https://suiexplorer.com/object/0x32bd94b98e4427ffe203eccb899efbc1553a3d82c6c50c5814ee5bdcb21f4b97?network=testnet)

## Roadmap 2 Game

- [剪刀石头布合约](https://suiexplorer.com/object/0x0b9b0e8d996aa57abca7e239b1c190d26cc9dcff077fe36fc6882c26e28a00d8?network=testnet)

命令行调用合约函数出拳(合约部署在 testnet)：
sui client call --function make_chose --module finger_guessing --package 0x0b9b0e8d996aa57abca7e239b1c190d26cc9dcff077fe36fc6882c26e28a00d8 --args 0x6 1 --gas-budget 10000000
结果在事件中能看到
参数 1：固定 0x6，用 clock 生成随机数
参数 2：1-石头 2-剪刀 3-布
事件中的 result：0-输 1-赢 2-和
