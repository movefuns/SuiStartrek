# 学习日志

# SUI学习笔记
## 学习资料
https://movefuns.notion.site/Web3-9835c8dea4fd424bbe61e4fa599689ad
[sui官网](https://docs.sui.io/)

# 基础命令
sui --help
sui client --help
sui move --help

sui --version
move-analyzer --version
sui client addresses
sui client gas

[DC 领水](https://discord.com/channels/916379725201563759/971488439931392130/1209153961802866689)

命令行领水
```
curl --location --request POST 'https://faucet.devnet.sui.io/gas' --header 'Content-Type: application/json' --data-raw '{"FixedAmountRequest":{"recipient":"0x527e28dfeeb98ebac8fd78b6924780b34b6210d73c05b9d2523f8c0c580a3b8a"}}'
```

```
curl --location --request POST 'https://fullnode.testnet.sui.io:443' --header 'Content-Type: application/json' --data-raw '{"FixedAmountRequest":{"recipient":"0x527e28dfeeb98ebac8fd78b6924780b34b6210d73c05b9d2523f8c0c580a3b8a"}}'
```

# 创建项目
sui move new hello_world

# 发布项目
sui client publish --gas-budget 10000000

# DEMO
[hello_world合约](https://github.com/0xachong/project_sui/blob/master/hello_world/sources/hello_world.move)
packageID(智能合约)：0x33d7b16c55ac5f5e117ae42d970d98f6483ababe0a29e0bac5c7ab5265f1246f

# 发行代币

[代币合约](https://github.com/0xachong/project_sui/blob/master/coin/sources/coin.move)
发布的coin包1
https://suiexplorer.com/object/0x874be8424dfc6b1c901120b56e7102cfe055b2735dcc133ee7d0202182a80f7d?network=testnet
发布的coin包2
https://suiexplorer.com/object/0x38743985b71d2435e4b381bd25b1d527f069ae694d72e0ef9817674ea160972c?network=testnet

调用函数铸造代币
`sui client call --function mint --module managed --package 0x38743985b71d2435e4b381bd25b1d527f069ae694d72e0ef9817674ea160972c --args 0x7b2b9c68340fdba93b18bcb580ce81449589c6674f609669c0c07a0ed7e06826 100 0x527e28dfeeb98ebac8fd78b6924780b34b6210d73c05b9d2523f8c0c580a3b8a --gas-budget 100000000`

调用函数销毁代币
`sui client call --function burn --module managed --package 0x38743985b71d2435e4b381bd25b1d527f069ae694d72e0ef9817674ea160972c --args 0x7b2b9c68340fdba93b18bcb580ce81449589c6674f609669c0c07a0ed7e06826 0x9b52a6a8a80b4a13c6ca871b32cefe379ffe29b50f53c9fa2a391975b2961888 --gas-budget 100000000`

# mint NFT

[NFT合约](https://github.com/0xachong/project_sui/blob/master/nft/sources/nft.move)
编译项目
`sui move build`
发布项目
`sui client publish --gas-budget 10000000`

调用函数铸造nft
`sui client call --function mint_to_sender --module devnet_nft --package 0x1e6be540a65d246eb7da95c732207271392b590c5cf9305f4246f238d328b304 --args nft_name nft_description https://ordinals.com/content/9997493013e8dceb5320737a8396d2991b4f766596569f6d14a34b157520ae69i0 --gas-budget 10000000`

# 铸造游戏package

[游戏合约](https://github.com/0xachong/project_sui/blob/master/nft/sources/game.move)

`https://suiexplorer.com/txblock/5BmN8MLg4Fk1Paa9NsBZiAhz1GMvEMVRydMPNG2fL71k?network=testnet`

### 调用play函数
`sui client call --function play --module finger_guessing --package 0x6e9c7dd522a751db152a8d8ae982f1ca8395ef622992195e2bd3a13facd22516  --args  0x0efd2a58c5822b8e7200e457808a4c9b7996648413733c56f25b4cd6a034ecc6  0   --gas-budget 20000000`