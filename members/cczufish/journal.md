[warn] Client/Server api version mismatch, client api version : 1.14.2, server api version : 1.14.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
DX4tb9EeHwnmwBawiBcjy61ZWwsdvgeNtVad6ceXB9uN
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70                                                                                  │
│ Gas Owner: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70                                                                               │
│ Gas Budget: 10000000                                                                                                                                        │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x037137de0a204c0eb3e8d3321455a02bbe144714815b5dab270dfc8b2ac79aed                                                                                   │
│  │ Version: 34                                                                                                                                              │
│  │ Digest: BqUpZrXxSja9U1BUgiVj19dYk4CbPiNRAg9WoFPGH4wo                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    5SQoziL+WG/bTO88TBJWfoNusbOXoZgjGkD/coc/k6un7HCvynwysKQ9P80prad1jlawlPsm50y762LKrT0pDw==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DX4tb9EeHwnmwBawiBcjy61ZWwsdvgeNtVad6ceXB9uN                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 3                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3a9a4a04373e9e12c7fdd10ba763722216871f9325d490ddf34696582f21d4d7                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5aMRqVpNr34rE6V5vDs7nXaNPM29c33kDyK2Ldfs2H8d                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x40068b999c166d55ab8bff996db84d7b3b2c340a4ee595bb6e55716786985545                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 35                                                                                    │
│  │ Digest: GUZKrNVDYc5DRNWf3sxXDTZbDwUkzNqPf9vUeyRgTk1G                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x60c7c7144b3f791889d561f5bea8b139f6afee95381867f44d9cefa52154b3eb                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 35                                                                                    │
│  │ Digest: 7r3kLzAtr9UKzvbtqXCUuaJRYGCZCM46mjuUzCZMZzpg                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x037137de0a204c0eb3e8d3321455a02bbe144714815b5dab270dfc8b2ac79aed                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 35                                                                                    │
│  │ Digest: 14QF2fpnR3rFpNPTVi3A3wAuyTnhJg1N1hPNJpbDvG3G                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x037137de0a204c0eb3e8d3321455a02bbe144714815b5dab270dfc8b2ac79aed                         │
│  │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )  │
│  │ Version: 35                                                                                    │
│  │ Digest: 14QF2fpnR3rFpNPTVi3A3wAuyTnhJg1N1hPNJpbDvG3G                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9568400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    8C3oRLcR4ykfnuE3bxj15qxeuxw7VE3jnh6QM2UVwccY                                                   │
│    HUKvecodFjttC4143fQ7LKpCNEwswvq8QyLJHiN8bJBg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x40068b999c166d55ab8bff996db84d7b3b2c340a4ee595bb6e55716786985545
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0x3a9a4a04373e9e12c7fdd10ba763722216871f9325d490ddf34696582f21d4d7::my_module::Forge 
 │ Version: 35
 │ Digest: GUZKrNVDYc5DRNWf3sxXDTZbDwUkzNqPf9vUeyRgTk1G
 └──
 ┌──
 │ ObjectID: 0x60c7c7144b3f791889d561f5bea8b139f6afee95381867f44d9cefa52154b3eb
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 35
 │ Digest: 7r3kLzAtr9UKzvbtqXCUuaJRYGCZCM46mjuUzCZMZzpg
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x037137de0a204c0eb3e8d3321455a02bbe144714815b5dab270dfc8b2ac79aed
 │ Sender: 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 
 │ Owner: Account Address ( 0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 35
 │ Digest: 14QF2fpnR3rFpNPTVi3A3wAuyTnhJg1N1hPNJpbDvG3G
 └──

Published Objects: 
 ┌──
 │ PackageID: 0x3a9a4a04373e9e12c7fdd10ba763722216871f9325d490ddf34696582f21d4d7 
 │ Version: 1 
 │ Digest: 5aMRqVpNr34rE6V5vDs7nXaNPM29c33kDyK2Ldfs2H8d
 | Modules: my_module
 └──
