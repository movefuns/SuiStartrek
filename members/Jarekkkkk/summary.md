# 学习成果

## Roadmap 1

- 使用 dapp kit 交互
- 發布合約 ( counter & Coin )

## Roadmap 2

- 完成一個主網 NFT 的發布合約 ,並 mint 一個名稱為自己 githubid 名稱或微信名稱名字的 nft 圖片用自己的 github 頭像或者微信頭像

  - NFT id: 0x43d7fa894620849effe106f3e9b5b8feb732aa6dcf420a8d4f2f61e8a7e42c37

- 完成剪刀石頭布小遊戲
- package: 0xed9feb0814c799fc87b4657ce2a2c16bc821de9ae142930895db5534d0682e31
- 玩法：輸入 shared object "Reg"，紀錄回合數，同時作為隨機數來源之一，玩家數入剪刀石頭布（0:石頭、1:布、2:剪刀），並等待 event 回傳勝負結果（0: 平手、1:玩家勝、2:玩家負）
- command

```
sui client call --gas-budget 10000000 --package 0xed9feb0814c799fc87b4657ce2a2c16bc821de9ae142930895db5534d0682e31 --module rock_paper_scissors --function play --args  0x5b44140d71c4ca036a02e270f5e08bf3497fc09a11f344d76a7eae3064c5112f 0
```
