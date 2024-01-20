# 星航计划加入申请表

### 个人介绍

* Github ID: [lidashu](https://github.com/lidashu)

* Telegram ID: yitanglh

* Discord ID: xiaoyifu

(首次如果没有，学习完毕钱包在填写)
* Sui 账号地址: 0xd1b6971304448433923da52a895100a09286ea936aa140d690b243f4f58440ae

多年web后端研发，web3初学者

### 学习日志

- [学习日志](journal.md)
- [学习总结](summary.md)

### 学习成果

#### Roadmap  1  
- learn Sui: https://docs.sui.io/references
- 项目源码: https://github.com/lidashu/learn_sui
- 发布的ERC20: 0x86fdfec8e82161d5331a86e671e2615d52577b4ea4ec482331718ce6d40d7e79

#### Roadmap 2

主链发布的NFT

- 部署的ERC20_1: https://suiexplorer.com/object/0x37fcd64d939914670104fc1f0bc16508fea45b9e12c42cde8dad24d528cedf9a?network=mainnet
- 部署的ERC20_2: https://suiexplorer.com/object/0x343b3f6ed76d9b186dd3fef38c229204eda78b4beb6d930c10e6e507cd5be4a4?network=mainnet
- 部署的NFT模块：https://suiexplorer.com/object/0xe83fbbc226c351eb04b69bbd3f98f0001d84b727805aec6680c9c30126e5d664?network=mainnet
- mint的NFT: https://suiexplorer.com/object/0xf416e483f13d72243a6ab851be29da566680337da5801ba5fe1c0ae0ca0fbe24?network=mainnet

游戏

- 推箱子游戏sokoban 目前部署在testnet上
- package: 0xd04776f4e65a21e4763abc697f5349255a2d67476c562d00e91af9a790c8c482
- 代码： https://github.com/lidashu/learn_sui/tree/main/roadmap02
- 关卡：
- level 1: 0x39e1b1103482581ff6e6c7dc12be501b4239f91909bbfca9ce0e6f81e0cc45f3
- 图案：

    0-空地 1-墙 2-目标 3-箱子 4-操作者

    1 1 1 1 1
    1 0 0 0 1
    1 2 3 4 1
    1 0 0 0 1
    1 1 1 1 1

- 操作：
    1 2 3
    4 5 6
    7 8 9
    2-上 8-下 4-左 6-右

- 解法：sui client call --gas-budget 5000000 --package 0xd04776f4e65a21e4763abc697f5349255a2d67476c562d00e91af9a790c8c482 --module "sokoban" --function "mint_to_winner" --args 0x39e1b1103482581ff6e6c7dc12be501b4239f91909bbfca9ce0e6f81e0cc45f3 \[4\]
成功后，会为玩家mint一个SokobanBadge


- level 2: 配置错了作废。。。

- level 3: 0x9b0e1781e803f1a89528d9e60f253a0bb80e5491a8ae3e300af717d7a61b1d18
- 图案：

    0-空地 1-墙 2-目标 3-箱子 4-操作者

    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
    0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 
    0 0 0 0 0 0 1 2 1 0 0 0 0 0 0 0 
    0 0 0 0 0 0 1 0 1 1 1 1 0 0 0 0 
    0 0 0 0 1 1 1 3 0 3 2 1 0 0 0 0 
    0 0 0 0 1 2 0 3 4 1 1 1 0 0 0 0 
    0 0 0 0 1 1 1 1 3 1 0 0 0 0 0 0 
    0 0 0 0 0 0 0 1 2 1 0 0 0 0 0 0 
    0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

- 操作：
    1 2 3
    4 5 6
    7 8 9

    2-上 8-下 4-左 6-右

- 解法： sui client call --gas-budget 5000000 --package 0xd04776f4e65a21e4763abc697f5349255a2d67476c562d00e91af9a790c8c482 --module "sokoban" --function "mint_to_winner" --args 0x9b0e1781e803f1a89528d9e60f253a0bb80e5491a8ae3e300af717d7a61b1d18 \[8,2,4,4,6,2,2,8,6,6\]
成功后，会为玩家mint一个SokobanBadge

#### Roadmap 3
- 升级合约：增加一个share object levelpack来保存所有mint的level，方便应用读取
- 开发应用前端
  参考：1. levels & icon from https://github.com/shunyue1320/sokoban
       2. frame from https://github.com/giulianoconti/sokoban-reactjs
- 静态发布应用：
  https://lidashu.github.io/sui-sokoban/

