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
UPDATING GIT DEPENDENCY https://gitlab.com/blockchain-labx/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mycoinSuccessfully verified dependencies on-chain against source.
Transaction Digest: CKhEW4ixs7h4PVe4hoVz8qDvegHtUjX9qXp2Sb6FWrn4
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                                                                  │
│ Gas Owner: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                                                               │
│ Gas Budget: 20000000 MIST                                                                                                                                   │
│ Gas Price: 1000 MIST                                                                                                                                        │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                                                                                   │
│  │ Version: 28                                                                                                                                              │
│  │ Digest: 24Pffo5KpQVHvDiYwECsPBiCpffph77H2vk8ppjHV2wa                                                                                                     │
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
│    mqunOaeGD3x60HYTz7WhmBvyxugL/VgYADi5CyWHual+BlLYKc+RY+6n94tM0iJ+1Asbxv/W86qb/swzEnbzWQ==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CKhEW4ixs7h4PVe4hoVz8qDvegHtUjX9qXp2Sb6FWrn4                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 810                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x07ac32d982c3d4d6ecbb95f1e8d74fa97e0fc7ba94bb5eb20bdaf496df603cfd                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 29                                                                                    │
│  │ Digest: 4uKMFEim6VHiPyAqjSD3YQPSSTZaqPKAWK2pwRSx4oYx                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x515cfb1c188059c6afa9f85842f76fb5cf21ce5807e8b5f728696fc2c7e28d4c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: EsRqaDCFNqNUsxWLfWggr9ZXxPaQxRNhmnqe6A324xtP                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x96c79d7480bcb22df8345b05a16dbd69d428016a7b038691a415a5fda4645c14                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 29                                                                                    │
│  │ Digest: DEoojPA5heE84NnPhn7P1yUVFwBh148SCjBS2UpK2aSm                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xedeabb208e7320a514048d7d113c172d472c6dba7bc0d0398ec3e312b0a48f1c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 29                                                                                    │
│  │ Digest: 5Y3JbpJ2h2oB3vCg6HkZ45UEyurikuXZ7WbZxTYsfLrK                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 29                                                                                    │
│  │ Digest: 9qFwagiiK4pjnEWcBeByC96s6Bzc8NZFiK6dWufu9tLB                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 29                                                                                    │
│  │ Digest: 9qFwagiiK4pjnEWcBeByC96s6Bzc8NZFiK6dWufu9tLB                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 12418400                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    EBGC49CKLxuiE5kxVRqjGGaJerkjTPBfdAWTDAnKcbov                                                   │
│    Gg1mV8WyKLi7FEk8AfdshXjSfZAcJcDLeamWn179tWfP                                                   │
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
│  │ ObjectID: 0x07ac32d982c3d4d6ecbb95f1e8d74fa97e0fc7ba94bb5eb20bdaf496df603cfd                                             │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                               │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )                            │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x515cfb1c188059c6afa9f85842f76fb5cf21ce5807e8b5f728696fc2c7e28d4c::mycoin::MYCOIN>   │
│  │ Version: 29                                                                                                              │
│  │ Digest: 4uKMFEim6VHiPyAqjSD3YQPSSTZaqPKAWK2pwRSx4oYx                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x96c79d7480bcb22df8345b05a16dbd69d428016a7b038691a415a5fda4645c14                                             │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                               │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                     │
│  │ Version: 29                                                                                                              │
│  │ Digest: DEoojPA5heE84NnPhn7P1yUVFwBh148SCjBS2UpK2aSm                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xedeabb208e7320a514048d7d113c172d472c6dba7bc0d0398ec3e312b0a48f1c                                             │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                               │
│  │ Owner: Immutable                                                                                                         │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x515cfb1c188059c6afa9f85842f76fb5cf21ce5807e8b5f728696fc2c7e28d4c::mycoin::MYCOIN>  │
│  │ Version: 29                                                                                                              │
│  │ Digest: 5Y3JbpJ2h2oB3vCg6HkZ45UEyurikuXZ7WbZxTYsfLrK                                                                     │
│  └──                                                                                                                        │
│                                                                                                                             │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                                             │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                               │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 29                                                                                                              │
│  │ Digest: 9qFwagiiK4pjnEWcBeByC96s6Bzc8NZFiK6dWufu9tLB                                                                     │
│  └──                                                                                                                        │
│                                                                                                                             │
│ Published Objects:                                                                                                          │
│  ┌──                                                                                                                        │
│  │ PackageID: 0x515cfb1c188059c6afa9f85842f76fb5cf21ce5807e8b5f728696fc2c7e28d4c                                            │
│  │ Version: 1                                                                                                               │
│  │ Digest: EsRqaDCFNqNUsxWLfWggr9ZXxPaQxRNhmnqe6A324xtP                                                                     │
│  │ Modules: mycoin                                                                                                          │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -12440280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```