## 部署合约

```bash
sui client publish --gas-budget 500000000
UPDATING GIT DEPENDENCY https://gitlab.com/blockchain-labx/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING tictactoe
...
Successfully verified dependencies on-chain against source.
Transaction Digest: DCCoug8eEVSH3Asr24YiTGNRJ8oD8SQD4hjzYBomPdPJ
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                                                                  │
│ Gas Owner: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                                                               │
│ Gas Budget: 500000000 MIST                                                                                                                                  │
│ Gas Price: 1000 MIST                                                                                                                                        │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                                                                                   │
│  │ Version: 31                                                                                                                                              │
│  │ Digest: 2k4DrDvJMNQGR8vSQEg8b8CSkrhwqR6FmqpRzmaXPqJM                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    6VKZt4/QOzFzt4x3uEVXYNnPCiDI0pA+NfIew8hNODsunDvs9znxc4cv5hZfL5dbrGs4sTXkgAHDfi+DWJ4TKw==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DCCoug8eEVSH3Asr24YiTGNRJ8oD8SQD4hjzYBomPdPJ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1320                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x084658ae00c7eeef3f7108abb16d579fcc6220a626db4fe260cf82e123844844                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 32                                                                                    │
│  │ Digest: 2ZFzUBBAqtrDsoKTPstaZPKZepwAyghgYFtbMmEZC8kG                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x69647e8062e2e5d8439394efecf76f06d9608025773f93768c136d45d1d622e1                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 32                                                                                    │
│  │ Digest: AF6cZM9Mf2yQXo563pM6PvptCsr9tifpQ3npLawQVKc                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8d7b00a004b1df151007a7af1659cd894d123ca2ce4c03957020dcf436911750                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 32                                                                                    │
│  │ Digest: tKiv8SnoPf33u1wTxG4vKmYNzCuef6YoH14R58PRfrT                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe836e0d5f3278d513bf84945eb4eaffe49937280b84a074aa1153039ce7e9efe                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 32                                                                                    │
│  │ Digest: CpacBheRNirLxN6QD7Ub9hbDjYj8zefkUCJ6q7bwXsrN                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf660550fc6254f24e4eda6639f4cb63fbb973818df6e4fd72de8942a6390972c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 9U7YPvCHjzxxKCNu9p2opNawXgmAeiZrwGQZtQzvGsnv                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 32                                                                                    │
│  │ Digest: ErNoySNxKuHdS2xMKKdTgipxfCqzDe2NkexQXmy75xoe                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 32                                                                                    │
│  │ Digest: ErNoySNxKuHdS2xMKKdTgipxfCqzDe2NkexQXmy75xoe                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 197356800                                                                        │
│    Computation Cost: 30000000                                                                     │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    9XQZin84tKwzJaSjk3EMCf6bB2hEfyh1NfQb7qhX4JEy                                                   │
│    Gg1mV8WyKLi7FEk8AfdshXjSfZAcJcDLeamWn179tWfP                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                          │
│  │ EventID: DCCoug8eEVSH3Asr24YiTGNRJ8oD8SQD4hjzYBomPdPJ:0                                                                    │
│  │ PackageID: 0xf660550fc6254f24e4eda6639f4cb63fbb973818df6e4fd72de8942a6390972c                                              │
│  │ Transaction Module: game                                                                                                   │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                                 │
│  │ EventType: 0x2::display::DisplayCreated<0xf660550fc6254f24e4eda6639f4cb63fbb973818df6e4fd72de8942a6390972c::game::GameNFT> │
│  │ ParsedJSON:                                                                                                                │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                              │
│  │   │ id │ 0x8d7b00a004b1df151007a7af1659cd894d123ca2ce4c03957020dcf436911750 │                                              │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                              │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ EventID: DCCoug8eEVSH3Asr24YiTGNRJ8oD8SQD4hjzYBomPdPJ:1                                                                    │
│  │ PackageID: 0xf660550fc6254f24e4eda6639f4cb63fbb973818df6e4fd72de8942a6390972c                                              │
│  │ Transaction Module: game                                                                                                   │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                                 │
│  │ EventType: 0x2::display::VersionUpdated<0xf660550fc6254f24e4eda6639f4cb63fbb973818df6e4fd72de8942a6390972c::game::GameNFT> │
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
│  │   │ id      │ 0x8d7b00a004b1df151007a7af1659cd894d123ca2ce4c03957020dcf436911750 │                                         │
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
│  │ ObjectID: 0x084658ae00c7eeef3f7108abb16d579fcc6220a626db4fe260cf82e123844844                                          │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                            │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )                         │
│  │ ObjectType: 0x2::package::Publisher                                                                                   │
│  │ Version: 32                                                                                                           │
│  │ Digest: 2ZFzUBBAqtrDsoKTPstaZPKZepwAyghgYFtbMmEZC8kG                                                                  │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0x69647e8062e2e5d8439394efecf76f06d9608025773f93768c136d45d1d622e1                                          │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                            │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )                         │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                  │
│  │ Version: 32                                                                                                           │
│  │ Digest: AF6cZM9Mf2yQXo563pM6PvptCsr9tifpQ3npLawQVKc                                                                   │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0x8d7b00a004b1df151007a7af1659cd894d123ca2ce4c03957020dcf436911750                                          │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                            │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )                         │
│  │ ObjectType: 0x2::display::Display<0xf660550fc6254f24e4eda6639f4cb63fbb973818df6e4fd72de8942a6390972c::game::GameNFT>  │
│  │ Version: 32                                                                                                           │
│  │ Digest: tKiv8SnoPf33u1wTxG4vKmYNzCuef6YoH14R58PRfrT                                                                   │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0xe836e0d5f3278d513bf84945eb4eaffe49937280b84a074aa1153039ce7e9efe                                          │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                            │
│  │ Owner: Shared                                                                                                         │
│  │ ObjectType: 0xf660550fc6254f24e4eda6639f4cb63fbb973818df6e4fd72de8942a6390972c::game::TicTacToeState                  │
│  │ Version: 32                                                                                                           │
│  │ Digest: CpacBheRNirLxN6QD7Ub9hbDjYj8zefkUCJ6q7bwXsrN                                                                  │
│  └──                                                                                                                     │
│                                                                                                                          │
│ Mutated Objects:                                                                                                         │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                                          │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                            │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )                         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                            │
│  │ Version: 32                                                                                                           │
│  │ Digest: ErNoySNxKuHdS2xMKKdTgipxfCqzDe2NkexQXmy75xoe                                                                  │
│  └──                                                                                                                     │
│                                                                                                                          │
│ Published Objects:                                                                                                       │
│  ┌──                                                                                                                     │
│  │ PackageID: 0xf660550fc6254f24e4eda6639f4cb63fbb973818df6e4fd72de8942a6390972c                                         │
│  │ Version: 1                                                                                                            │
│  │ Digest: 9U7YPvCHjzxxKCNu9p2opNawXgmAeiZrwGQZtQzvGsnv                                                                  │
│  │ Modules: game                                                                                                         │
│  └──                                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -226378680                                                                             │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```