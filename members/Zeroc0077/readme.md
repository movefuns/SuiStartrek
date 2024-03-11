# 星航计划加入申请表

### 个人介绍

* Github ID: [Zeroc0077](https://github.com/Zeroc0077)

* Telegram ID: zeroc

* Discord ID: zeroc

(首次如果没有，学习完毕钱包在填写)
* Sui 账号地址: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6

自由职业者

### 学习日志

- [学习日志](journal.md)
- [学习总结](summary.md)

### 学习成果

Roadmap
1.  
- 项目源码: [roadmap1](./roadmap1)
- 发布的ERC20:
package1: 0x3de5614a07133368b51a9ae66f945eaf8423c2e2e922e630b83659a67f4d80f1
package2: 0x80b3fde935af3a1d2b52a58219ef3b9537609dabdbacf7b4ffabe7d18c0508f1

2.
- 项目源码: [roadmap2](./roadmap2)

- nft package: [0x92d1918cb61720debc2c87499580428f5b76aa41aa8c7a9427cfadee2b6b8977](https://suiexplorer.com/object/0x92d1918cb61720debc2c87499580428f5b76aa41aa8c7a9427cfadee2b6b8977?module=mynft&network=testnet)

- game package: [0x6931ef6ceaa4f78a0596e3dd64a8fc846233162d4794da17593730649b27680d](https://suiexplorer.com/object/0x6931ef6ceaa4f78a0596e3dd64a8fc846233162d4794da17593730649b27680d?network=testnet)

玩法：
```bash
# 调用 participate 函数参与游戏
sui client call --package 0x6931ef6ceaa4f78a0596e3dd64a8fc846233162d4794da17593730649b27680d --module mygame --function participate --args "0xea1c68604122e43fb5d5f49504baf69ef76571f5a6aa51101946cb912d45aff1" "1" "0x09f066e58503b647ac44536a54e4cda1d6fde9d444e80d90d2386c347786ecb1" --gas-budget 10000000
# Transaction Digest: BatxA3T81hJgKTFdwJr7gGR2JVC9D1XQED7ccovkxC3F
# 调用 battle 函数获取结果
sui client call --package 0x6931ef6ceaa4f78a0596e3dd64a8fc846233162d4794da17593730649b27680d --module mygame --function battle --args "0xea1c68604122e43fb5d5f49504baf69ef76571f5a6aa51101946cb912d45aff1" "0xa5de7a86e736c7cd81d2d2af473e2f8066fcfe4e8fa951daa423a8499d54a86a" --gas-budget 100000000
# Transaction Digest: A65ts5c1cqWVm7pZ39W54yDrqyWBCm6Ux5D8Hi7WGrhN
```

3. 
