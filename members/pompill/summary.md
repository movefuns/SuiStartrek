# 学习成果

成功发布了一个sui智能合约到testnet，赋予了mint权限

## Roadmap 1

-Cointype:
0x4623e63c1d66399652b3e9bf1724ce254c6662547741c6902f75d900a63ffe2d::hello_world::helloworld

## Roadmap 2

#### nft
-nft地址：0x116a7e0fb305a179592a636c65dd51170f87780477fcbb2a812fbf166036d32f
-package地址：0x7f514c386de566be5df51655dcb5c93f454328e0c688e4155e21a378389b0736

-代码地址：https://github.com/pompill/move-nft

#### 猜数字游戏
-游戏地址：0x9481854d0482b889a4eecd289a7d5a7f5b296fd9d5bb783e1d96a8bc40aed994
-代码地址: https://github.com/pompill/move-guessNumGame

-操作步骤：
第一个参数为你猜的数字，范围1-6，第二个参数则是共享对象：0x77dbc80518fe37062c6b2a98a7595b9ef2689d19205e5ad7d1b572c4d9f96e3e

执行execute后，会产生一个create object，可查看参与结果，返回对象中的win字段决定是否赢得比赛，true为赢，反之输掉了比赛

ps：由于是伪随机数，结果可能会比较不稳定，多玩几次就好了

执行命令: sui client call --module guessNumGame --function StartGame --package 0x9481854d0482b889a4eecd289a7d5a7f5b296fd9d5bb783e1d96a8bc40aed994 --args 1 0x77dbc80518fe37062c6b2a98a7595b9ef2689d19205e5ad7d1b572c4d9f96e3e --gas-budget 20000000


