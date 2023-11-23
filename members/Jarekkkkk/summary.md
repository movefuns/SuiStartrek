# 学习成果

## Roadmap 1

- 使用 dapp kit 交互
- 發布合約 ( counter & Coin )

## Roadmap 2

- 完成一個主網 NFT 的發布合約 ,並 mint 一個名稱為自己 githubid 名稱或微信名稱名字的 nft 圖片用自己的 github 頭像或者微信頭像

  - NFT id: 0x8b2cb53bbe95d8dd9fe93bf6e83528607a4a49621392e9e38c8eb6b0c043830d

- 完成剪刀石頭布小遊戲
- package: 0xc7bfbe15aa59670e27fc94a678548d2b678a49ea514cb7f3e3ded5d41e0caabb
- 玩法：輸入 shared object "Reg"，紀錄回合數，同時作為隨機數來源之一，玩家數入剪刀石頭布（0:石頭、1:布、2:剪刀），並等待 event 回傳勝負結果（0: 平手、1:玩家勝、2:玩家負）
- command

```
sui client call --gas-budget 10000000 --package 0xc7bfbe
15aa59670e27fc94a678548d2b678a49ea514cb7f3e3ded5d41e0caabb --module rock_paper_scissors --function play --args  0x3bbcc662cf13a03a564806a640b0716a90e168178a366bc0dfc8c5698cd1bf68 0
```
