《SUI MOVE中文系列课程》SUI官方认证 Move智能合约语言入门指南

https://docs.sui.io/references/cli/client


获取测试token

curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
> --header 'Content-Type: application/json' \
> --data-raw '{
>     "FixedAmountRequest": {
>         "recipient": "0xcffa4292b24be558807bb106fda33700575841b09f736218e848a65cf52f8ad4"
>     }
> }'


{"transferredGasObjects":[{"amount":10000000000,"id":"0x8eef6a32cc25d226eabc5348f2512c7c4646e59f47b57a9e1fd82acf01434855","transferTxDigest":"EuFmQxeDMmCs4eauiYfEsctWggeo9BZTBk5qUF2SmvqQ"}],"error":null}


导入自己的钱包

sui move new hello_world

sui move build

sui move test


发布包

sui client publish --gas-budget 10000000 .

[PID45212] [I] 2024/03/11 15:58:14 <> localhost:10808
[PID45212] [I] 2024/03/11 15:58:14 Ws2_32.dll connect(776 224.240.1.66:443 16) -> fullnode.devnet.sui.io:443 PROXY
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
[PID42720] [I] 2024/03/11 15:58:16 Ws2_32.dll connect(424 127.0.0.1:56981 16) DIRECT
[PID42720] [I] 2024/03/11 15:58:16 <> localhost:10808
[PID42720] [I] 2024/03/11 15:58:16 Ws2_32.dll connect(424 224.134.132.83:443 16) -> github.com:443 PROXY
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Total number of linter warnings suppressed: 1 (filtered categories: 1)
[PID45212] [I] 2024/03/11 15:58:19 <> localhost:10808
[PID45212] [I] 2024/03/11 15:58:19 Ws2_32.dll connect(1020 224.240.1.66:443 16) -> fullnode.devnet.sui.io:443 PROXY
Successfully verified dependencies on-chain against source.
Transaction Digest: BxELrkqqRBwYR4DgNsP6ZXQTe3feK1whc2MPMUEhL7Q8
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xcffa4292b24be558807bb106fda33700575841b09f736218e848a65cf52f8ad4                                   │
│ Gas Owner: 0xcffa4292b24be558807bb106fda33700575841b09f736218e848a65cf52f8ad4                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x8eef6a32cc25d226eabc5348f2512c7c4646e59f47b57a9e1fd82acf01434855                                    │
│  │ Version: 79                                                                                               │
│  │ Digest: 4QURyHzwrmnV2RbMbzAtrHP2QeG7CtKcp6HCpVBM8HJs                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xcffa4292b24be558807bb106fda33700575841b09f736218e848a65cf52f8ad4" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    ptSlXoxs9hg9hXCBizkItnFr8OuBStVztwoMksFBCZZOLSTGx6p8Wh9ZNqDDX3frjybxHwD4twMzZvb2+rbjYA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BxELrkqqRBwYR4DgNsP6ZXQTe3feK1whc2MPMUEhL7Q8                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1534                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x9f3c52ac5d83991588bb7b8df52716ed100a61eda195dd9ad527e63d6222c291                         │
│  │ Owner: Account Address ( 0xcffa4292b24be558807bb106fda33700575841b09f736218e848a65cf52f8ad4 )  │
│  │ Version: 80                                                                                    │
│  │ Digest: DayDjuoFvJtA7nTTzkXHfHFuHG1cuWUYphsHhLUd3V3w                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc94fc0a11ac05cd4c0598e12ab1160ebfb9b982175e12d5915cc3289d1e41a35                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 25j8iN4vsFHNd9Yv64YhM6cqtNnG7FmnbeFBLqFrQQZq                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8eef6a32cc25d226eabc5348f2512c7c4646e59f47b57a9e1fd82acf01434855                         │
│  │ Owner: Account Address ( 0xcffa4292b24be558807bb106fda33700575841b09f736218e848a65cf52f8ad4 )  │
│  │ Version: 80                                                                                    │
│  │ Digest: J7hZyBqVLXspejWNqTWfVrNbD7Dgu5ieUWzaRvtk1Xvn                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x8eef6a32cc25d226eabc5348f2512c7c4646e59f47b57a9e1fd82acf01434855                         │
│  │ Owner: Account Address ( 0xcffa4292b24be558807bb106fda33700575841b09f736218e848a65cf52f8ad4 )  │
│  │ Version: 80                                                                                    │
│  │ Digest: J7hZyBqVLXspejWNqTWfVrNbD7Dgu5ieUWzaRvtk1Xvn                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7957200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    A39eLqHoDpw3oDMMrH5R7FsY85FMKbsBGjMNUk17X8BJ                                                   │
│    EuFmQxeDMmCs4eauiYfEsctWggeo9BZTBk5qUF2SmvqQ                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x9f3c52ac5d83991588bb7b8df52716ed100a61eda195dd9ad527e63d6222c291                  │
│  │ Sender: 0xcffa4292b24be558807bb106fda33700575841b09f736218e848a65cf52f8ad4                    │
│  │ Owner: Account Address ( 0xcffa4292b24be558807bb106fda33700575841b09f736218e848a65cf52f8ad4 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 80                                                                                   │
│  │ Digest: DayDjuoFvJtA7nTTzkXHfHFuHG1cuWUYphsHhLUd3V3w                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x8eef6a32cc25d226eabc5348f2512c7c4646e59f47b57a9e1fd82acf01434855                  │
│  │ Sender: 0xcffa4292b24be558807bb106fda33700575841b09f736218e848a65cf52f8ad4                    │
│  │ Owner: Account Address ( 0xcffa4292b24be558807bb106fda33700575841b09f736218e848a65cf52f8ad4 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 80                                                                                   │
│  │ Digest: J7hZyBqVLXspejWNqTWfVrNbD7Dgu5ieUWzaRvtk1Xvn                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xc94fc0a11ac05cd4c0598e12ab1160ebfb9b982175e12d5915cc3289d1e41a35                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 25j8iN4vsFHNd9Yv64YhM6cqtNnG7FmnbeFBLqFrQQZq                                          │
│  │ Modules: hello_world                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xcffa4292b24be558807bb106fda33700575841b09f736218e848a65cf52f8ad4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7979080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
[I] 2024/03/11 15:58:21 All Windows descendant process exited.
[I] 2024/03/11 15:58:21 Master exiting

