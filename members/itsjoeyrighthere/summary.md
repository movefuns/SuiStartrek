# 学习成果

## Roadmap  1  
1. hello world
- 项目源码: [hello_world](https://github.com/itsjoeyrighthere/hello_sui/tree/main/hello_world)
- package id: 0x2664f32a48196d7e228f1ba82a4b8bf7bdd00d32284db5150b2329c90d42b1f5 
- sui explorer: [devnet package](https://suiexplorer.com/object/0x2664f32a48196d7e228f1ba82a4b8bf7bdd00d32284db5150b2329c90d42b1f5?network=devnet)

2. ERC20
- 项目源码：[my_first_coin](https://github.com/itsjoeyrighthere/hello_sui/tree/main/my_first_coin)
- package id: 0xbd298feee69b1d2ac186f795d4d29844e51fa08680550d0f463730dab58c9f38
- sui explorer: [devnet package](https://suiexplorer.com/object/0xbd298feee69b1d2ac186f795d4d29844e51fa08680550d0f463730dab58c9f38?network=devnet)


## Roadmap 2
1. NFT
- 项目源码: [my_first_nft](https://github.com/itsjoeyrighthere/hello_sui/tree/main/my_first_nft)
- package id: 0x06cd0b8f114dd9f8f02e3db869160ad81d53276771060dec4344b12dc68aeadf
- sui explorer: [testnet package](https://suiexplorer.com/object/0x06cd0b8f114dd9f8f02e3db869160ad81d53276771060dec4344b12dc68aeadf?network=testnet)
- nft object id: 0x37c29c0a671efe0b7d30f69eeb1c75591d5d8ab44bafd1a09b8fc63d9218dfc3 [testnet nft](https://suiexplorer.com/object/0x37c29c0a671efe0b7d30f69eeb1c75591d5d8ab44bafd1a09b8fc63d9218dfc3?network=testnet)
- 调用方法: `sui client call --function mint_to_sender --module my_nft --package 0x06cd0b8f114dd9f8f02e3db869160ad81d53276771060dec4344b12dc68aeadf --args [name] [description] [url] --gas-budget 100000000`

2. 小游戏
- 玩法介绍
    1. 玩家猜测一个数字，范围在1-6之间
    2. 合约生成一个随机数，范围在1-6之间
    3. 如果用户与合约生成的数字相同，则玩家获胜，否则失败
    4. 玩家获胜就向他发送一个合约自定义的sword
- 项目源码: [my_first_game](https://github.com/itsjoeyrighthere/hello_sui/tree/main/my_first_game)
- package id: 0x00134d11b2d344ee0d569d49c8975f460fff7ab266d2798895f90257d0d8daf3
- suiexplorer: [testnet package](https://suiexplorer.com/object/0x00134d11b2d344ee0d569d49c8975f460fff7ab266d2798895f90257d0d8daf3?network=testnet)
- 调用方法: `sui client call --package 0x00134d11b2d344ee0d569d49c8975f460fff7ab266d2798895f90257d0d8daf3 --module guess_number --function play --args [number] 0x6  --gas-budget 10000000`

