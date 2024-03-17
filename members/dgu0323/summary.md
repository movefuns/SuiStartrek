# 学习成果

## Roadmap 1 FT Contract

包括 3 个合约：

* Counter: 官方 dapp 的 Counter [github](https://github.com/dgu0323/sui_homework/tree/main/hello)
* Managed Coin: 指定权限人才可以 mint [github](https://github.com/dgu0323/sui_homework/tree/main/managed_coin)
* Shared Coin: 所有人都可以 mint [github](https://github.com/dgu0323/sui_homework/tree/main/shared_coin)

### Counter

```
packageId: 0x4a3e8ebeb9bfdceeaac1d3126061e1af56b0be852352fe37c50dab4fccbea1f6
```

![](https://james-01-1256894360.cos.ap-beijing.myqcloud.com/2024-02-14-033939.png)

![](https://james-01-1256894360.cos.ap-beijing.myqcloud.com/2024-02-14-034106.png)

### Managed Coin

````
deployer address: 0xe69934571665b5a3f750559c40c54a1e35678910a563e436404d0461a31f39e3
deploy trx: AEBf5SEQVj1BGvGsXLpuA99i8TpVPifs8rc2xtdpjmrR
packageId: 0xd7926f3e1ae7edfd310f91d28ff6f240d22dd6986dd0e9cbb01371f3d67129fe
````

![](https://james-01-1256894360.cos.ap-beijing.myqcloud.com/2024-02-16-122636.png)

操作测试

```
# deployer mint 3000 to him
sui client call --gas-budget=100000000 \
--package=0xeea9191a6167d10b4e851f764e61e334f920060e9e34fa3056c4b7a1e74f2632 \
--module=btc --function=mint \
--args 0xe2098d0d1d6f9745aff209fb38a4c50bf179a43bdbd320143292dd277674ae5a 3000000000

# deployer mint 1000 to somebody
sui client call --gas-budget=100000000 \
--package=0xeea9191a6167d10b4e851f764e61e334f920060e9e34fa3056c4b7a1e74f2632 \
--module=btc --function=mint_to \
--args 0xe2098d0d1d6f9745aff209fb38a4c50bf179a43bdbd320143292dd277674ae5a 1000000000 0x5f260c8eec8cf438717a3d9e78e51b69fe34deaa6820c27d28c9618f8140751f
```

### Shared Coin

```
deployer address: 0xe69934571665b5a3f750559c40c54a1e35678910a563e436404d0461a31f39e3
deploy trx: Cb8Hr8WvWHSiUHXLSV6Ya2W2kcVHbQpFfgPNfmseBDqx
packageId: 0xcb42e2beefeae3cfc8d066e8148e17827fad5790237962a6068c2900e8f5e4fb
```

![](https://james-01-1256894360.cos.ap-beijing.myqcloud.com/2024-02-16-131731.png)

操作测试

```
# deployer mint 3000 to him
sui client call --gas-budget=100000000 \
--package=0xcb42e2beefeae3cfc8d066e8148e17827fad5790237962a6068c2900e8f5e4fb \
--module=ETH --function=mint \
--args 0x6fb3193de8c7d5ab8ce7143832cd7212325a67cddf6597ab3c60a74df6ec6643 3000000000

# swith to someone
sui client switch --address 0x5f260c8eec8cf438717a3d9e78e51b69fe34deaa6820c27d28c9618f8140751f

# someone mint 2000 to him
sui client call --gas-budget=100000000 \
--package=0xcb42e2beefeae3cfc8d066e8148e17827fad5790237962a6068c2900e8f5e4fb \
--module=ETH --function=mint \
--args 0x6fb3193de8c7d5ab8ce7143832cd7212325a67cddf6597ab3c60a74df6ec6643 3000000000
```



## RoadMap2 NFT

[Github Repo](https://github.com/dgu0323/sui_homework/tree/main/nft)

```
deployer address: 0xe69934571665b5a3f750559c40c54a1e35678910a563e436404d0461a31f39e3

# 主网部署和mint信息
deploy trx: FwPfvqLHAdgv41Uqgc8quadTYAK5nLF8KupDwgEdepgd
packageId: 0x6063f1a93f062710d71d5c475d9261aa4ba5d2084b1a2ec43db6b52dae18c294

mint trx: EYhbAjh4QY2rLC7Gao2HFgBBpdhCUycGozHfD6B6KUoN
nft objId: 0x3222dba8d5c47f1ccffb2894f7e873fd0c763aa8d5de6d4654349cb3d46aac60
```

![](https://james-01-1256894360.cos.ap-beijing.myqcloud.com/2024-02-18-044516.png)

![](https://james-01-1256894360.cos.ap-beijing.myqcloud.com/2024-02-18-044454.png)

## RoadMap2 Game

[GitHub Repo](https://github.com/dgu0323/sui_homework/tree/main/game)

```
deployer address: 0xe69934571665b5a3f750559c40c54a1e35678910a563e436404d0461a31f39e3
deploy trx: Sq62iZyMQCCPaQXHeapyU2uWSzq7kc8Lo3bdJ5uSnHN
packageId: 0x2d25f29efddbd0f7fd9a5271ecd29659add2a1e1a0fbf007214d41668c73c01a
```

### 概述

石头剪子布 - 奖金版本

* deployer 可以添加 SUI 到奖池作为奖金
* 某个玩家开启游戏后，该游戏自动从奖池中划拨一部分SUI作为本次比赛的奖金，然后等待其他玩家加入
* 其他玩家加入
* 两名玩家分别出示手势的hash
* 两名玩家分别出示手势的salt
* 如果两名玩家都出示完毕，则自动开奖
* 获胜玩家拿到本次比赛的奖金，平局则奖金退还给奖池

### 玩法

```
######################################################
#  玩家信息
######################################################
player1: 0x5f260c8eec8cf438717a3d9e78e51b69fe34deaa6820c27d28c9618f8140751f
player2: 0x237a4728defca6bb0c2a4ccc643e71c4ea04c361c3f3c76a164401e2fa700dd8

######################################################
# 游戏信息
######################################################
AdminCap: 0x4db505eebf7fb8143169ef678a9602abacc693c4a98225d0b4268f3bfc76eaf5
GameSpaceId: 0x4675043eb33a78da362540eeaeff32c9564230a644902fe72d5f9107b3f839b7
gameId: 0xdb38c2ebfd101cc904c0ad939c02e765a30da77554c827552f5a6bca67c1392a  // 开启游戏后生成

######################################################
# 手势信息  salt 都是 1234
######################################################
ROCK
value: 1
hash: 0x6fb2b41d1dcaa3aaf7ff4d5957674dd07299458ecd66945e87b3e9b4e021fad5

PAPER
value: 2
hash: 0x7858b0ac8188be66a92fd6d9d6138c098cd73e4bf13c14ad64a38166b379af65

SCISSORS
value: 3
hash: 0x580f78bc0565b49a697828240fb4c83bde310251a23151078c03c6239d4d24e7

######################################################
# 开始游戏
######################################################

# deployer 往奖池增加sui
sui client switch --address 0xe69934571665b5a3f750559c40c54a1e35678910a563e436404d0461a31f39e3

sui client call --gas-budget=100000000 \
--package=0x2d25f29efddbd0f7fd9a5271ecd29659add2a1e1a0fbf007214d41668c73c01a \
--module=rock_paper_scissors_advanced --function=add_prize \
--args 0x4db505eebf7fb8143169ef678a9602abacc693c4a98225d0b4268f3bfc76eaf5  0x4675043eb33a78da362540eeaeff32c9564230a644902fe72d5f9107b3f839b7 0x51646a3a3c970be947d4aa2755c302fb037577b7c7d93633cd5504bfde49cd78

// 加完以后奖池当前sui: 9969838276

# 玩家1开始游戏
sui client switch --address 0x5f260c8eec8cf438717a3d9e78e51b69fe34deaa6820c27d28c9618f8140751f

sui client call --gas-budget=100000000 \
--package=0x2d25f29efddbd0f7fd9a5271ecd29659add2a1e1a0fbf007214d41668c73c01a \
--module=rock_paper_scissors_advanced --function=start_game \
--args 0x4675043eb33a78da362540eeaeff32c9564230a644902fe72d5f9107b3f839b7

# 玩家2加入游戏
sui client switch --address 0x237a4728defca6bb0c2a4ccc643e71c4ea04c361c3f3c76a164401e2fa700dd8

sui client call --gas-budget=100000000 \
--package=0x2d25f29efddbd0f7fd9a5271ecd29659add2a1e1a0fbf007214d41668c73c01a \
--module=rock_paper_scissors_advanced --function=add_game \
--args 0xdb38c2ebfd101cc904c0ad939c02e765a30da77554c827552f5a6bca67c1392a


# 玩家1 add hash (ROCK)
sui client switch --address 0x5f260c8eec8cf438717a3d9e78e51b69fe34deaa6820c27d28c9618f8140751f

sui client call --gas-budget=100000000 \
--package=0x2d25f29efddbd0f7fd9a5271ecd29659add2a1e1a0fbf007214d41668c73c01a \
--module=rock_paper_scissors_advanced --function=add_hash \
--args 0xdb38c2ebfd101cc904c0ad939c02e765a30da77554c827552f5a6bca67c1392a 0x6fb2b41d1dcaa3aaf7ff4d5957674dd07299458ecd66945e87b3e9b4e021fad5

# 玩家2 add hash (PAPER)
sui client switch --address 0x237a4728defca6bb0c2a4ccc643e71c4ea04c361c3f3c76a164401e2fa700dd8

sui client call --gas-budget=100000000 \
--package=0x2d25f29efddbd0f7fd9a5271ecd29659add2a1e1a0fbf007214d41668c73c01a \
--module=rock_paper_scissors_advanced --function=add_hash \
--args 0xdb38c2ebfd101cc904c0ad939c02e765a30da77554c827552f5a6bca67c1392a 0x7858b0ac8188be66a92fd6d9d6138c098cd73e4bf13c14ad64a38166b379af65

# 玩家1 add salt
sui client switch --address 0x5f260c8eec8cf438717a3d9e78e51b69fe34deaa6820c27d28c9618f8140751f

sui client call --gas-budget=100000000 \
--package=0x2d25f29efddbd0f7fd9a5271ecd29659add2a1e1a0fbf007214d41668c73c01a \
--module=rock_paper_scissors_advanced --function=add_salt \
--args 0x4675043eb33a78da362540eeaeff32c9564230a644902fe72d5f9107b3f839b7 0xdb38c2ebfd101cc904c0ad939c02e765a30da77554c827552f5a6bca67c1392a 1234


# 玩家2 add salt
sui client switch --address 0x237a4728defca6bb0c2a4ccc643e71c4ea04c361c3f3c76a164401e2fa700dd8

sui client call --gas-budget=100000000 \
--package=0x2d25f29efddbd0f7fd9a5271ecd29659add2a1e1a0fbf007214d41668c73c01a \
--module=rock_paper_scissors_advanced --function=add_salt \
--args 0x4675043eb33a78da362540eeaeff32c9564230a644902fe72d5f9107b3f839b7 0xdb38c2ebfd101cc904c0ad939c02e765a30da77554c827552f5a6bca67c1392a 1234

// 最终：玩家2得到奖金

```



