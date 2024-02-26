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
  githubName: "lispking",
  image_url_prefixe: "https://avatars.githubusercontent.com/"
}
[ PASS    ] 0x0::nft::test_create_nft
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## 部署合约

```bash
sui client publish --gas-budget 20000000
[warn] Client/Server api version mismatch, client api version : 1.17.0, server api version : 1.18.0
UPDATING GIT DEPENDENCY https://gitlab.com/blockchain-labx/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mynft
Successfully verified dependencies on-chain against source.
Error executing transaction: Failure {
    error: "InsufficientGas",
}
```

> Gas 费不够，改成 100000000 再来一次

```bash
sui client publish --gas-budget 100000000
[warn] Client/Server api version mismatch, client api version : 1.17.0, server api version : 1.18.0
UPDATING GIT DEPENDENCY https://gitlab.com/blockchain-labx/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mynft
Successfully verified dependencies on-chain against source.
Transaction Digest: GvDyThZ2KAZcQATvPWmFqi37PjUuDfCPRauHU2m6nBkg
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                                                                  │
│ Gas Owner: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                                                               │
│ Gas Budget: 100000000 MIST                                                                                                                                  │
│ Gas Price: 1000 MIST                                                                                                                                        │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                                                                                   │
│  │ Version: 21                                                                                                                                              │
│  │ Digest: CPoGVgrDaELPBCEjbf12wa8qsPDjL5Pxusr7wD45jCDe                                                                                                     │
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
│    sx6ESPForPleuiAU3tpVBkj8lobNng7E9Qdxl4oU4m0e6/eMO6A4kFhDWXaZEwQzgycgYkcf0p5/RldgoVeXBg==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GvDyThZ2KAZcQATvPWmFqi37PjUuDfCPRauHU2m6nBkg                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 401                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1e228e0837a86b732915a26339e257b70e5f77be8257c21ffb34831f0e432c3e                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 22                                                                                    │
│  │ Digest: 9JRiq5d3iiCid6rVBoFgGZP7vCvhjHiFr3gBrSyWaKa7                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x213c3998096c1408eb048cd249d545e7fac33b0d107d6c4746bf1e815512310b                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 22                                                                                    │
│  │ Digest: 55YKLRYMt46jar5R1zMrKeRtALn5aUuoQ6CtzyztZ3S3                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x54ad139791dcc6a1aeb0cb4fadb2d6ebf8e6288f2c2337285e11ddda559e4923                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 22                                                                                    │
│  │ Digest: GeAqz53Hqy2M5hVnm9BY3NihN4q3gwLwdEG1MzWLGcnh                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xaa093364e4178614d6bdd9f08ff8d7248342ddcec034b69ce18585b618f98fcc                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: BY14GW66h5pbTzHs14GED5QoP8pCaDjHxmLNB8SDbEoC                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbbdf7a500989c02d840edbbd0eda8f7ac79c832bbc604ba3ed35f0d96b15ea1a                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 22                                                                                    │
│  │ Digest: 54r3sRXEiZxjzywsFXQozRYhcLyMATwDfJ5zGWZ5TKpX                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 22                                                                                    │
│  │ Digest: 7C4wz3imS2LiLf1Kd4SsxqdeHLrBYPsKrJM4Msk7p3i4                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 22                                                                                    │
│  │ Digest: 7C4wz3imS2LiLf1Kd4SsxqdeHLrBYPsKrJM4Msk7p3i4                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 20869600                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    8rD2sEHmmMwMqa23kfC52Q5JgFG46h6sNLSr3gNnEUhr                                                   │
│    Gg1mV8WyKLi7FEk8AfdshXjSfZAcJcDLeamWn179tWfP                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                       │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                           │
│  │ EventID: GvDyThZ2KAZcQATvPWmFqi37PjUuDfCPRauHU2m6nBkg:0                                                                     │
│  │ PackageID: 0xaa093364e4178614d6bdd9f08ff8d7248342ddcec034b69ce18585b618f98fcc                                               │
│  │ Transaction Module: nft                                                                                                     │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                                  │
│  │ EventType: 0x2::display::DisplayCreated<0xaa093364e4178614d6bdd9f08ff8d7248342ddcec034b69ce18585b618f98fcc::nft::GithubNFT> │
│  │ ParsedJSON:                                                                                                                 │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                               │
│  │   │ id │ 0x1e228e0837a86b732915a26339e257b70e5f77be8257c21ffb34831f0e432c3e │                                               │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                               │
│  └──                                                                                                                           │
│  ┌──                                                                                                                           │
│  │ EventID: GvDyThZ2KAZcQATvPWmFqi37PjUuDfCPRauHU2m6nBkg:1                                                                     │
│  │ PackageID: 0xaa093364e4178614d6bdd9f08ff8d7248342ddcec034b69ce18585b618f98fcc                                               │
│  │ Transaction Module: nft                                                                                                     │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                                  │
│  │ EventType: 0x2::display::VersionUpdated<0xaa093364e4178614d6bdd9f08ff8d7248342ddcec034b69ce18585b618f98fcc::nft::GithubNFT> │
│  │ ParsedJSON:                                                                                                                 │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                          │
│  │   │ fields  │ contents │ key   │ token_id                                        │                                          │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                          │
│  │   │         │          │ value │ GithubNFT #{tokenId}                            │                                          │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                          │
│  │   │         │          │ key   │ name                                            │                                          │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                          │
│  │   │         │          │ value │ Github #{githubName}                            │                                          │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                          │
│  │   │         │          │ key   │ collection                                      │                                          │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                          │
│  │   │         │          │ value │ Github Avatars Collection                       │                                          │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                          │
│  │   │         │          │ key   │ image_url                                       │                                          │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                          │
│  │   │         │          │ value │ {image_url_prefixe}/{githubName}                │                                          │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                          │
│  │   │         │          │ key   │ description                                     │                                          │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                          │
│  │   │         │          │ value │ This is Github User {githubName} Avatar NFT     │                                          │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                          │
│  │   │ id      │ 0x1e228e0837a86b732915a26339e257b70e5f77be8257c21ffb34831f0e432c3e │                                          │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                          │
│  │   │ version │ 1                                                                  │                                          │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                          │
│  └──                                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                            │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                                           │
│ Created Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x1e228e0837a86b732915a26339e257b70e5f77be8257c21ffb34831f0e432c3e                                           │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                             │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )                          │
│  │ ObjectType: 0x2::display::Display<0xaa093364e4178614d6bdd9f08ff8d7248342ddcec034b69ce18585b618f98fcc::nft::GithubNFT>  │
│  │ Version: 22                                                                                                            │
│  │ Digest: 9JRiq5d3iiCid6rVBoFgGZP7vCvhjHiFr3gBrSyWaKa7                                                                   │
│  └──                                                                                                                      │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x213c3998096c1408eb048cd249d545e7fac33b0d107d6c4746bf1e815512310b                                           │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                             │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )                          │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                   │
│  │ Version: 22                                                                                                            │
│  │ Digest: 55YKLRYMt46jar5R1zMrKeRtALn5aUuoQ6CtzyztZ3S3                                                                   │
│  └──                                                                                                                      │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x54ad139791dcc6a1aeb0cb4fadb2d6ebf8e6288f2c2337285e11ddda559e4923                                           │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                             │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )                          │
│  │ ObjectType: 0x2::package::Publisher                                                                                    │
│  │ Version: 22                                                                                                            │
│  │ Digest: GeAqz53Hqy2M5hVnm9BY3NihN4q3gwLwdEG1MzWLGcnh                                                                   │
│  └──                                                                                                                      │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0xbbdf7a500989c02d840edbbd0eda8f7ac79c832bbc604ba3ed35f0d96b15ea1a                                           │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                             │
│  │ Owner: Shared                                                                                                          │
│  │ ObjectType: 0xaa093364e4178614d6bdd9f08ff8d7248342ddcec034b69ce18585b618f98fcc::nft::State                             │
│  │ Version: 22                                                                                                            │
│  │ Digest: 54r3sRXEiZxjzywsFXQozRYhcLyMATwDfJ5zGWZ5TKpX                                                                   │
│  └──                                                                                                                      │
│                                                                                                                           │
│ Mutated Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                                           │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                                             │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )                          │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                             │
│  │ Version: 22                                                                                                            │
│  │ Digest: 7C4wz3imS2LiLf1Kd4SsxqdeHLrBYPsKrJM4Msk7p3i4                                                                   │
│  └──                                                                                                                      │
│                                                                                                                           │
│ Published Objects:                                                                                                        │
│  ┌──                                                                                                                      │
│  │ PackageID: 0xaa093364e4178614d6bdd9f08ff8d7248342ddcec034b69ce18585b618f98fcc                                          │
│  │ Version: 1                                                                                                             │
│  │ Digest: BY14GW66h5pbTzHs14GED5QoP8pCaDjHxmLNB8SDbEoC                                                                   │
│  │ Modules: nft                                                                                                           │
│  └──                                                                                                                      │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -20891480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

