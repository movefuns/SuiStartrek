## 测试合约

```bash
sui move test
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mycoin
Running Move unit tests
Test result: OK. Total tests: 0; passed: 0; failed: 0
```

## 部署合约

```bash
sui client publish --gas-budget 20000000
[warn] Client/Server api version mismatch, client api version : 1.17.0, server api version : 1.18.0
UPDATING GIT DEPENDENCY https://gitlab.com/blockchain-labx/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mycoin
Successfully verified dependencies on-chain against source.
Transaction Digest: EuREFbFADvKagAHjo1zx22mTaMARqkR66N6jTU8rs5pZ
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                                                                  │
│ Gas Owner: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                                                               │
│ Gas Budget: 20000000 MIST                                                                                                                                   │
│ Gas Price: 1000 MIST                                                                                                                                        │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                                                                                   │
│  │ Version: 22                                                                                                                                              │
│  │ Digest: 7C4wz3imS2LiLf1Kd4SsxqdeHLrBYPsKrJM4Msk7p3i4                                                                                                     │
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
│    BCy+pXqb2UX3SYjT7oaeGu8jeACn2Q00dXy2YjL5UpyhssN73FSxJ0AHQa9260TFxQYmDMGjpCnmUAJNgFoVCA==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EuREFbFADvKagAHjo1zx22mTaMARqkR66N6jTU8rs5pZ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 402                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1c6530791b21b1770be2dae659cc22ab241ee42b6d096d27b6c8d6c964797466                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 23                                                                                    │
│  │ Digest: 2XpqnxsSoZtFx85zhR8dW4uT1PWGhp96wGGGabbFR2TH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x572c5a21fb293a447f4d0420fc70cff3eacfdb14f29d635f86b73213d89be944                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 23                                                                                    │
│  │ Digest: FDac6dXSrVFLiAGi1bwnL9bvZiSzwvuqqtxbJxepNZzz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7aaa93af4e90506ac3f1c991c3dd6d8820386564d3c018a7301b95e3bae575e9                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 23                                                                                    │
│  │ Digest: 9p2vWj5ZZRrzqFEDkkVcJF2ung8nj6R3Yfx8vub9hFFF                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdf92e7dbe71574d884c725d2fbbd44e9487eb673f2daab0e7697b0926d21d3fa                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: F7Y1s22zquuDSmtEKpak2yAjwFVjePfLx2hYNNE1oDnV                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 23                                                                                    │
│  │ Digest: Ep33DN5U37GA6x5atuD6Ji5TzUPGUBPKfTqfrAyY2sUz                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 23                                                                                    │
│  │ Digest: Ep33DN5U37GA6x5atuD6Ji5TzUPGUBPKfTqfrAyY2sUz                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 12418400                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    Gg1mV8WyKLi7FEk8AfdshXjSfZAcJcDLeamWn179tWfP                                                   │
│    GvDyThZ2KAZcQATvPWmFqi37PjUuDfCPRauHU2m6nBkg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                                             │
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x1c6530791b21b1770be2dae659cc22ab241ee42b6d096d27b6c8d6c964797466                                             │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                               │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )                            │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xdf92e7dbe71574d884c725d2fbbd44e9487eb673f2daab0e7697b0926d21d3fa::mycoin::MYCOIN>   │
│  │ Version: 23                                                                                                              │
│  │ Digest: 2XpqnxsSoZtFx85zhR8dW4uT1PWGhp96wGGGabbFR2TH                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x572c5a21fb293a447f4d0420fc70cff3eacfdb14f29d635f86b73213d89be944                                             │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                               │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                     │
│  │ Version: 23                                                                                                              │
│  │ Digest: FDac6dXSrVFLiAGi1bwnL9bvZiSzwvuqqtxbJxepNZzz                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x7aaa93af4e90506ac3f1c991c3dd6d8820386564d3c018a7301b95e3bae575e9                                             │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                               │
│  │ Owner: Immutable                                                                                                         │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xdf92e7dbe71574d884c725d2fbbd44e9487eb673f2daab0e7697b0926d21d3fa::mycoin::MYCOIN>  │
│  │ Version: 23                                                                                                              │
│  │ Digest: 9p2vWj5ZZRrzqFEDkkVcJF2ung8nj6R3Yfx8vub9hFFF                                                                     │
│  └──                                                                                                                        │
│                                                                                                                             │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                                             │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                               │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 23                                                                                                              │
│  │ Digest: Ep33DN5U37GA6x5atuD6Ji5TzUPGUBPKfTqfrAyY2sUz                                                                     │
│  └──                                                                                                                        │
│                                                                                                                             │
│ Published Objects:                                                                                                          │
│  ┌──                                                                                                                        │
│  │ PackageID: 0xdf92e7dbe71574d884c725d2fbbd44e9487eb673f2daab0e7697b0926d21d3fa                                            │
│  │ Version: 1                                                                                                               │
│  │ Digest: F7Y1s22zquuDSmtEKpak2yAjwFVjePfLx2hYNNE1oDnV                                                                     │
│  │ Modules: mycoin                                                                                                          │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -12440280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```