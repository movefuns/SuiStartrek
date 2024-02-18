## 部署合约

```bash
sui client publish --gas-budget 100000000
[warn] Client/Server api version mismatch, client api version : 1.17.0, server api version : 1.18.0
UPDATING GIT DEPENDENCY https://gitlab.com/blockchain-labx/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING tictactoe
...
Successfully verified dependencies on-chain against source.
Error executing transaction: Failure {
    error: "InsufficientGas",
}
```

> Gas 费不够，改成 500000000 再来一次

```bash
sui client publish --gas-budget 500000000
[warn] Client/Server api version mismatch, client api version : 1.17.0, server api version : 1.18.0
UPDATING GIT DEPENDENCY https://gitlab.com/blockchain-labx/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING tictactoe
...
Successfully verified dependencies on-chain against source.
Transaction Digest: AvwhF5oViqu2Uo7QsvntYoDF3LcpDiNPSmGdbG7C4igy
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                                                                  │
│ Gas Owner: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                                                               │
│ Gas Budget: 500000000 MIST                                                                                                                                  │
│ Gas Price: 1000 MIST                                                                                                                                        │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                                                                                   │
│  │ Version: 24                                                                                                                                              │
│  │ Digest: 6BLVGS7Qqb2CoNAsq6sbBUVS6z2yu6RzBeFdCB1jiKW9                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    gODRHb+xSW9n6g8z3LU9JmHxOaxXzIwg3tRYtkgEd8VhfyIMDI9Ta8wLVgoqN6idhxHF/AVY2f/CsWClKW6hCQ==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: AvwhF5oViqu2Uo7QsvntYoDF3LcpDiNPSmGdbG7C4igy                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 407                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x00378a0be0ce0ac56e42ed80917eba236328b236d86c2900fe087e48a62d5781                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 25                                                                                    │
│  │ Digest: FTdF1R7HV3SWsUcjcQPm1DNMezQf3a3kY4tAdsuNZ9Qg                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3d91e48a98f259981286bdfdfa478a761f28e413abe66036f8fccb4a583ada91                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 25                                                                                    │
│  │ Digest: CAcnUZCdphWWzhxCAeWiFUL8Rzpxr91zssRtKXqaqYZZ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x62476acc4a61d65d545480315ad974911a567417ecebd776bf3b936e54bebefa                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: FT4fRupX9NS9pJ3KdLdmQKpXRZgwHQzBKwvKWj3ffLoC                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb77d3c223a838a41c732d80404c8249080e575656ca9e9977b738b4f9bc5352b                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 25                                                                                    │
│  │ Digest: FaRQvhtocH35AfmFpuheCTaxCTbaQBn3oEt6j9XpfjyN                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf4b9c049205cd80b9ddafc470b0780802fed4f455d74793878fd7c32fc15e5e3                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 25                                                                                    │
│  │ Digest: DbA4PagpToUUCfwLWKa4Fwooi1eMVgkix9EWF485NNDp                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 25                                                                                    │
│  │ Digest: 6JsyVnwFFb2eN8cwDduhWVbqiZe3KFtn6NjMMiSHft8k                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 25                                                                                    │
│  │ Digest: 6JsyVnwFFb2eN8cwDduhWVbqiZe3KFtn6NjMMiSHft8k                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 197349200                                                                        │
│    Computation Cost: 30000000                                                                     │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5BccbkxfZtuAVXRwpZ4bqZXvAsfHBGG2xXqMEHSAnhqV                                                   │
│    Gg1mV8WyKLi7FEk8AfdshXjSfZAcJcDLeamWn179tWfP                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                          │
│  │ EventID: AvwhF5oViqu2Uo7QsvntYoDF3LcpDiNPSmGdbG7C4igy:0                                                                    │
│  │ PackageID: 0x62476acc4a61d65d545480315ad974911a567417ecebd776bf3b936e54bebefa                                              │
│  │ Transaction Module: game                                                                                                   │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                                 │
│  │ EventType: 0x2::display::DisplayCreated<0x62476acc4a61d65d545480315ad974911a567417ecebd776bf3b936e54bebefa::game::GameNFT> │
│  │ ParsedJSON:                                                                                                                │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                              │
│  │   │ id │ 0xf4b9c049205cd80b9ddafc470b0780802fed4f455d74793878fd7c32fc15e5e3 │                                              │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                              │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ EventID: AvwhF5oViqu2Uo7QsvntYoDF3LcpDiNPSmGdbG7C4igy:1                                                                    │
│  │ PackageID: 0x62476acc4a61d65d545480315ad974911a567417ecebd776bf3b936e54bebefa                                              │
│  │ Transaction Module: game                                                                                                   │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                                 │
│  │ EventType: 0x2::display::VersionUpdated<0x62476acc4a61d65d545480315ad974911a567417ecebd776bf3b936e54bebefa::game::GameNFT> │
│  │ ParsedJSON:                                                                                                                │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                         │
│  │   │ fields  │ contents │ key   │ token_id                                        │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ TicTacToe #{tokenId}                            │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ round                                           │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ Round {round}                                   │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ wins                                            │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ Wins {wins}                                     │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ image_url                                       │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ {image_url}                                     │                                         │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                         │
│  │   │ id      │ 0xf4b9c049205cd80b9ddafc470b0780802fed4f455d74793878fd7c32fc15e5e3 │                                         │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                         │
│  │   │ version │ 1                                                                  │                                         │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                         │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                                          │
│ Created Objects:                                                                                                         │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0x00378a0be0ce0ac56e42ed80917eba236328b236d86c2900fe087e48a62d5781                                          │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                            │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )                         │
│  │ ObjectType: 0x2::package::Publisher                                                                                   │
│  │ Version: 25                                                                                                           │
│  │ Digest: FTdF1R7HV3SWsUcjcQPm1DNMezQf3a3kY4tAdsuNZ9Qg                                                                  │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0x3d91e48a98f259981286bdfdfa478a761f28e413abe66036f8fccb4a583ada91                                          │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                            │
│  │ Owner: Shared                                                                                                         │
│  │ ObjectType: 0x62476acc4a61d65d545480315ad974911a567417ecebd776bf3b936e54bebefa::game::TicTacToeState                  │
│  │ Version: 25                                                                                                           │
│  │ Digest: CAcnUZCdphWWzhxCAeWiFUL8Rzpxr91zssRtKXqaqYZZ                                                                  │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0xb77d3c223a838a41c732d80404c8249080e575656ca9e9977b738b4f9bc5352b                                          │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                            │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )                         │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                  │
│  │ Version: 25                                                                                                           │
│  │ Digest: FaRQvhtocH35AfmFpuheCTaxCTbaQBn3oEt6j9XpfjyN                                                                  │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0xf4b9c049205cd80b9ddafc470b0780802fed4f455d74793878fd7c32fc15e5e3                                          │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                            │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )                         │
│  │ ObjectType: 0x2::display::Display<0x62476acc4a61d65d545480315ad974911a567417ecebd776bf3b936e54bebefa::game::GameNFT>  │
│  │ Version: 25                                                                                                           │
│  │ Digest: DbA4PagpToUUCfwLWKa4Fwooi1eMVgkix9EWF485NNDp                                                                  │
│  └──                                                                                                                     │
│                                                                                                                          │
│ Mutated Objects:                                                                                                         │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                                          │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                            │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )                         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                            │
│  │ Version: 25                                                                                                           │
│  │ Digest: 6JsyVnwFFb2eN8cwDduhWVbqiZe3KFtn6NjMMiSHft8k                                                                  │
│  └──                                                                                                                     │
│                                                                                                                          │
│ Published Objects:                                                                                                       │
│  ┌──                                                                                                                     │
│  │ PackageID: 0x62476acc4a61d65d545480315ad974911a567417ecebd776bf3b936e54bebefa                                         │
│  │ Version: 1                                                                                                            │
│  │ Digest: FT4fRupX9NS9pJ3KdLdmQKpXRZgwHQzBKwvKWj3ffLoC                                                                  │
│  │ Modules: game                                                                                                         │
│  └──                                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -226371080                                                                             │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```