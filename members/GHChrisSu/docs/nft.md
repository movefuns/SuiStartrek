## 测试合约

```bash
sui move test
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mynft
Running Move unit tests
[debug] 0x0::nft::GithubNFT {
  id: 0x2::object::UID {
    id: 0x2::object::ID {
      bytes: @0xeefed4f2b7f6ad5f65d6ea2eef50b4f1d1e98c39ca8eecbc9736da801b8387e6
    }
  },
  tokenId: 0,
  githubName: "GHChrissu",
  image_url_prefixe: "https://avatars.githubusercontent.com/"
}
[ PASS    ] 0x0::nft::test_create_nft
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## 部署合约
```bash
sui client publish --gas-budget 100000000
UPDATING GIT DEPENDENCY https://gitlab.com/blockchain-labx/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mynft
Successfully verified dependencies on-chain against source.
Transaction Digest: 9XQZin84tKwzJaSjk3EMCf6bB2hEfyh1NfQb7qhX4JEy
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                                                                  │
│ Gas Owner: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                                                               │
│ Gas Budget: 100000000 MIST                                                                                                                                  │
│ Gas Price: 1000 MIST                                                                                                                                        │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                                                                                   │
│  │ Version: 30                                                                                                                                              │
│  │ Digest: 6nWFGufS1aWpMZy2Aqe8WsPwyKZg8ED4HRdiLWNzoQ3H                                                                                                     │
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
│    QZ/paL8ao/StDbq1+i4w5niqNgweq1MlMpXCuxg1gm4LG717pbT8jz+q4biM1wSzi9BVIf7VOkaO4rk9lhf4bg==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9XQZin84tKwzJaSjk3EMCf6bB2hEfyh1NfQb7qhX4JEy                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1306                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0b9e5abe10b3950db43614a4b964c3fbf56875c7dfb871573bd533406eb28369                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: GoXxGw4uqwcvA98nm53FSpwHc5SqxR6zfPwiEhJzUjdc                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x1bd01d5fbc77715663214e7ad103e20f9f50aead67d21f9f5333e35da1e6eb25                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 31                                                                                    │
│  │ Digest: 469sWJCjk8T7P1T1vvnbFkfeeKXP9GsYahjs4hPZi24s                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x33fabc54402bc84dfa2bc724a01a3c90265d658625a769ed668e8710eb4b4cc7                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 31                                                                                    │
│  │ Digest: BPuznAMDrS67yYu6M2MhBSnLtrusqTG9qefL5hGEko7j                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x66103a60dd3873da7ac55b4fc4b1cec36838ebe6f9ac6e0bfa2d2184ac4ad2c4                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 31                                                                                    │
│  │ Digest: 9PbeENxZJZ8j8UEcNtceEmPkQ2Mf1iaL9uVmy3qRniTE                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd831d178f418731899b5723539bf7c6cdfaccc261eede786ab2549a2b3dd12a8                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 31                                                                                    │
│  │ Digest: FMd3a4fevpTYgA9TbJd4iJPdYgAe1nQwACdx73mVjW1o                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 31                                                                                    │
│  │ Digest: 2k4DrDvJMNQGR8vSQEg8b8CSkrhwqR6FmqpRzmaXPqJM                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 31                                                                                    │
│  │ Digest: 2k4DrDvJMNQGR8vSQEg8b8CSkrhwqR6FmqpRzmaXPqJM                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 20869600                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2TBu1fsArRrAF1sa6q24Spr1tDuhCgo79DLKc2KrwuMy                                                   │
│    Gg1mV8WyKLi7FEk8AfdshXjSfZAcJcDLeamWn179tWfP                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                          │
│  │ EventID: 9XQZin84tKwzJaSjk3EMCf6bB2hEfyh1NfQb7qhX4JEy:0                                                                    │
│  │ PackageID: 0x0b9e5abe10b3950db43614a4b964c3fbf56875c7dfb871573bd533406eb28369                                              │
│  │ Transaction Module: nft                                                                                                    │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                                 │
│  │ EventType: 0x2::display::DisplayCreated<0xb9e5abe10b3950db43614a4b964c3fbf56875c7dfb871573bd533406eb28369::nft::GithubNFT> │
│  │ ParsedJSON:                                                                                                                │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                              │
│  │   │ id │ 0x66103a60dd3873da7ac55b4fc4b1cec36838ebe6f9ac6e0bfa2d2184ac4ad2c4 │                                              │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                              │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ EventID: 9XQZin84tKwzJaSjk3EMCf6bB2hEfyh1NfQb7qhX4JEy:1                                                                    │
│  │ PackageID: 0x0b9e5abe10b3950db43614a4b964c3fbf56875c7dfb871573bd533406eb28369                                              │
│  │ Transaction Module: nft                                                                                                    │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                                 │
│  │ EventType: 0x2::display::VersionUpdated<0xb9e5abe10b3950db43614a4b964c3fbf56875c7dfb871573bd533406eb28369::nft::GithubNFT> │
│  │ ParsedJSON:                                                                                                                │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                         │
│  │   │ fields  │ contents │ key   │ token_id                                        │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ GithubNFT #{tokenId}                            │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ name                                            │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ Github #{githubName}                            │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ collection                                      │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ Github Avatars Collection                       │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ image_url                                       │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ {image_url_prefixe}/{githubName}                │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ key   │ description                                     │                                         │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                         │
│  │   │         │          │ value │ This is Github User {githubName} Avatar NFT     │                                         │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                         │
│  │   │ id      │ 0x66103a60dd3873da7ac55b4fc4b1cec36838ebe6f9ac6e0bfa2d2184ac4ad2c4 │                                         │
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
│  │ ObjectID: 0x1bd01d5fbc77715663214e7ad103e20f9f50aead67d21f9f5333e35da1e6eb25                                          │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                            │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )                         │
│  │ ObjectType: 0x2::package::Publisher                                                                                   │
│  │ Version: 31                                                                                                           │
│  │ Digest: 469sWJCjk8T7P1T1vvnbFkfeeKXP9GsYahjs4hPZi24s                                                                  │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0x33fabc54402bc84dfa2bc724a01a3c90265d658625a769ed668e8710eb4b4cc7                                          │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                            │
│  │ Owner: Shared                                                                                                         │
│  │ ObjectType: 0xb9e5abe10b3950db43614a4b964c3fbf56875c7dfb871573bd533406eb28369::nft::State                             │
│  │ Version: 31                                                                                                           │
│  │ Digest: BPuznAMDrS67yYu6M2MhBSnLtrusqTG9qefL5hGEko7j                                                                  │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0x66103a60dd3873da7ac55b4fc4b1cec36838ebe6f9ac6e0bfa2d2184ac4ad2c4                                          │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                            │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )                         │
│  │ ObjectType: 0x2::display::Display<0xb9e5abe10b3950db43614a4b964c3fbf56875c7dfb871573bd533406eb28369::nft::GithubNFT>  │
│  │ Version: 31                                                                                                           │
│  │ Digest: 9PbeENxZJZ8j8UEcNtceEmPkQ2Mf1iaL9uVmy3qRniTE                                                                  │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0xd831d178f418731899b5723539bf7c6cdfaccc261eede786ab2549a2b3dd12a8                                          │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                            │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )                         │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                  │
│  │ Version: 31                                                                                                           │
│  │ Digest: FMd3a4fevpTYgA9TbJd4iJPdYgAe1nQwACdx73mVjW1o                                                                  │
│  └──                                                                                                                     │
│                                                                                                                          │
│ Mutated Objects:                                                                                                         │
│  ┌──                                                                                                                     │
│  │ ObjectID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                                          │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                                            │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )                         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                            │
│  │ Version: 31                                                                                                           │
│  │ Digest: 2k4DrDvJMNQGR8vSQEg8b8CSkrhwqR6FmqpRzmaXPqJM                                                                  │
│  └──                                                                                                                     │
│                                                                                                                          │
│ Published Objects:                                                                                                       │
│  ┌──                                                                                                                     │
│  │ PackageID: 0x0b9e5abe10b3950db43614a4b964c3fbf56875c7dfb871573bd533406eb28369                                         │
│  │ Version: 1                                                                                                            │
│  │ Digest: GoXxGw4uqwcvA98nm53FSpwHc5SqxR6zfPwiEhJzUjdc                                                                  │
│  │ Modules: nft                                                                                                          │
│  └──                                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -20891480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

