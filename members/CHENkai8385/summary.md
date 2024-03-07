# 学习成果

## 阶段一任务：部署智能合约

[代码仓库](https://github.com/CHENkai8385/sui_study/blob/main/hello_world/sources/hello.move)

https://suiexplorer.com/txblock/3VVxT2KJXdrQMVLzgGKM9W1qh9GQ4L3k4BQnPAwhvBzD?network=testnet
packageid:0x8b79c94da042350f128cc8071950409fa1e124de06db986fb1c3fc6fb22c0aac

## 阶段二任务

### NFT部署及Mint

[代码仓库](https://github.com/CHENkai8385/sui_study/blob/main/nft_demo/sources/mynft.move)

部署记录：https://suiexplorer.com/txblock/CeR3kie9YR3iz6FA6rwWtRXH2o5TR7LHxyQzG6BLTj4q?network=testnet

packgeId：0xe14500e34063d7400ffa934cfcde675ca18f50a08c74bc6cf047293d3aee15df

Mint记录：https://suiexplorer.com/txblock/7rdUmoh73sYN6hkh1V8Ht7aAEzQmkQpCNJrbQ7QqxvQm?network=testnet

ObjectId: 0x1c9bdf641aeaff43f3e96531db2c45858a130406eee6c0f77f79ee45db8b1a68

我的NFT查看：https://suiexplorer.com/object/0x1c9bdf641aeaff43f3e96531db2c45858a130406eee6c0f77f79ee45db8b1a68?network=testnet

### 数字比大小游戏

[代码仓库](https://github.com/CHENkai8385/sui_study/blob/main/game_demo/sources/mygame.move)
packageID：0x4a374a6fd8bc863a6f8bad0564e6935619f86a36fe980ed9d7a1ca83228c5c20 

[链上记录](https://suiexplorer.com/txblock/AkocXKmkWKtk2BkJp4xUz7ydjZREjpfA9Mm71B6qU2J8?network=testnet)

play命令：只需要把第一个参数2换为你想输入的数字即可

```sui client call --function play --module mygame --package 0x4a374a6fd8bc863a6f8bad0564e6935619f86a36fe980ed9d7a1ca83228c5c20 --args 2 0x6 --gas-budget 10000000```

游戏结果展示：

``````
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                 │
│  │ EventID: 5TUrD2QhmzgfyQuiNWdaLqJPfUpfqvdjVeLkg4nJEKpJ:0                                           │
│  │ PackageID: 0x4a374a6fd8bc863a6f8bad0564e6935619f86a36fe980ed9d7a1ca83228c5c20                     │
│  │ Transaction Module: mygame                                                                        │
│  │ Sender: 0xba64eccae040d94e77f478f26bb0bbc868afd673757116ee52a7901c9686e465                        │
│  │ EventType: 0x4a374a6fd8bc863a6f8bad0564e6935619f86a36fe980ed9d7a1ca83228c5c20::mygame::GameResult │
│  │ ParsedJSON:                                                                                       │
│  │   ┌─────────────────┬─────────┐                                                                   │
│  │   │ computer_number │ 3       │                                                                   │
│  │   ├─────────────────┼─────────┤                                                                   │
│  │   │ result          │ you win │                                                                   │
│  │   ├─────────────────┼─────────┤                                                                   │
│  │   │ your_number     │ 9       │                                                                   │
│  │   └─────────────────┴─────────┘                                                                   │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯╭
``````



 
