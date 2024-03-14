# 学习日志

1.安装环境https://docs.sui.io/guides/developer/getting-started/sui-environment
这里测试翻墙之后更快

2.发布合约命令

> sui client publish --gas-budget 100000000 --skip-dependency-verification

## 剪刀石头布合约

一个简单的剪刀石头布合约，只需要玩家做出选择就好，合约会随机生成【剪刀，石头，布】其中一种
一轮游戏（一次交易）的结果通过事件 event 返回

调用合约函数命令：

> sui client call --function <函数名> --module <模块名> --package <合约地址> --args <参数，个数必须符合函数要求> --type-args <调用函数需要的泛型类型如 0xf48ce3614a2d6d0035569f275f36879d2c86a459b68cbd8231722a401c472250::ctfa::CTFA > --gas-budget 10000000
