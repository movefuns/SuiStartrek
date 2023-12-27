# 学习日志

## Stage 1 (23.11.13 ~ 23.11.19)

- [x] Set up Sui Wallet
- [x] Set up Move Env
- [x] Deploy an ERC-20 Contract

## Stage 2 (23.11.20 ~ 23.12.16)

- [x] Deploy two ERC-20 Contracts
- [x] Deploy an ERC-721 Contract
- [x] Deploy a simple On-chain game

## Stage2 Game

简单的石头剪刀布游戏，合约初始化时创建了三个共享对象，分别表示玩家出手的动作：

| FistName | Object ID                                                          |
| -------- | ------------------------------------------------------------------ |
| stone    | 0xef59ab7f4c7f004fb1ac9dc6b6c018c91ec4fbb83e43c2828a6f02e1bce0f578 |
| paper    | 0xf62ea7cf00a4297b579ecc9cd4132ff74094c95a74bffb7a0d47d199903368bf |
| scissors | 0x89ebccbde1eb629d5b706a57795be97c4c3bb7d4f6f4a9cc0d8b23bebd3109d5 |

合约使用 `weather-rocale` 作为随机数来源，其对象 ID 为 0x1aedcca0b67b891c64ca113fce87f89835236b4c77294ba7e2db534ad49a58dc

调用 `make_fist(fist_id, oracle_id)`，即表示一次出手；合约将创建一个 `Record` 对象记录本次结果。

```bash
# 下面是出剪刀的一个示例
sui client call --package 0x79db1ef58c455db20236e6ee19daacd9c17f840b3b9617dc2ec3cf58df28cdfc --module game --function make_fist --args 0xf62ea7cf00a4297b579ecc9cd4132ff74094c95a74bffb7a0d47d199903368bf 0x1aedcca0b67b891c64ca113fce87f89835236b4c77294ba7e2db534ad49a58dc  --gas-budget 3000000 
```

查询交易哈希拿到 Record 对象 ID，然后查询游戏结果：

```bash
sui client tx-block HRePSVGBqauaGiyiEn2wMhPBPf6tZ3EjpaUKSvniobEo

sui client object 0xf14b1c071a2e7dafa9aa91767845c0c864d2e8c0f70400ce5be8ab6b3949bfec
```

结果如下：

```bash
╭───────────────┬──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ objectId      │  0xf14b1c071a2e7dafa9aa91767845c0c864d2e8c0f70400ce5be8ab6b3949bfec                                                  │
│ version       │  38707341                                                                                                            │
│ digest        │  8vKDkTbk8NrBUELZ4rx8A5kFbsMSc15FuWGD98brzLyC                                                                        │
│ objType       │  0x79db1ef58c455db20236e6ee19daacd9c17f840b3b9617dc2ec3cf58df28cdfc::game::Record                                    │
│ ownerType     │  AddressOwner                                                                                                        │
│ prevTx        │  HRePSVGBqauaGiyiEn2wMhPBPf6tZ3EjpaUKSvniobEo                                                                        │
│ storageRebate │  1390800                                                                                                             │
│ content       │ ╭───────────────────┬──────────────────────────────────────────────────────────────────────────────────────────────╮ │
│               │ │ dataType          │  moveObject                                                                                  │ │
│               │ │ type              │  0x79db1ef58c455db20236e6ee19daacd9c17f840b3b9617dc2ec3cf58df28cdfc::game::Record            │ │
│               │ │ hasPublicTransfer │  false                                                                                       │ │
│               │ │ fields            │ ╭──────────┬───────────────────────────────────────────────────────────────────────────────╮ │ │
│               │ │                   │ │ id       │ ╭────┬──────────────────────────────────────────────────────────────────────╮ │ │ │
│               │ │                   │ │          │ │ id │  0xf14b1c071a2e7dafa9aa91767845c0c864d2e8c0f70400ce5be8ab6b3949bfec  │ │ │ │
│               │ │                   │ │          │ ╰────┴──────────────────────────────────────────────────────────────────────╯ │ │ │
│               │ │                   │ │ opponent │  stone                                                                        │ │ │
│               │ │                   │ │ player   │  paper                                                                        │ │ │
│               │ │                   │ │ result   │  win                                                                          │ │ │
│               │ │                   │ ╰──────────┴───────────────────────────────────────────────────────────────────────────────╯ │ │
│               │ ╰───────────────────┴──────────────────────────────────────────────────────────────────────────────────────────────╯ │
╰───────────────┴──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## Reference

- [Sui Move Intro](https://intro-zh.sui-book.com/unit-one/index.html)
- [Sui Co-learn](https://github.com/movefuns/co-learn-sui)
