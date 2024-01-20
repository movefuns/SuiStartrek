yoyo@meme-MacBook-Pro cat_coin % sui client publish --gas-budget 10000000000 ../cat_coin --skip-dependency-verification
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING cat_coin
Skipping dependency verification
----- Transaction Digest ----
6MeAqiVTRbpr95vYNGqmTDqkvgx8AUnsV9MpMG4Ud2tY
----- Transaction Data ----
Transaction Signature: [Signature(Ed25519SuiSignature(Ed25519SuiSignature([0, 248, 54, 0, 23, 119, 144, 133, 118, 208, 226, 180, 60, 251, 68, 43, 137, 22, 126, 188, 245, 44, 159, 79, 116, 57, 85, 88, 132, 181, 183, 32, 5, 84, 107, 134, 90, 100, 254, 17, 61, 171, 217, 78, 31, 34, 8, 196, 0, 121, 93, 110, 3, 162, 117, 80, 150, 149, 139, 181, 245, 208, 20, 165, 12, 213, 86, 7, 36, 121, 240, 211, 233, 138, 117, 183, 132, 216, 91, 153, 55, 32, 150, 154, 29, 30, 148, 75, 38, 159, 65, 204, 59, 200, 50, 237, 248])))]
Transaction Kind : Programmable
Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f" })]
Commands: [
  Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002),
  TransferObjects([Result(0)],Input(0)),
]

Sender: 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f
Gas Payment: Object ID: 0x3ecd776d54675f64e6e8f80a7b3e913a640a81098909efc5c9e732fa873a1fed, version: 0x11, digest: 7tf9EfBbi3Vd8g1E8Lz1PxyzKpzCoCjkWjthpkZq2TJB 
Gas Owner: 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f
Gas Price: 1000
Gas Budget: 10000000000

----- Transaction Effects ----
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6MeAqiVTRbpr95vYNGqmTDqkvgx8AUnsV9MpMG4Ud2tY                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1c05be95ead1ed6ac79332bd3a7e946c9cba50e1ec678924395c8c2c4d758b1c                         │
│  │ Owner: Account Address ( 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f )  │
│  │ Version: 18                                                                                    │
│  │ Digest: 6REM6gLk9VGkTHJjbdyLR1pFgdJ36nFx65kGQsobDuQW                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa9032563eddcadc56151df6270f2a478315c54cb8f632bad7161b0de9e2a4eba                         │
│  │ Owner: Account Address ( 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f )  │
│  │ Version: 18                                                                                    │
│  │ Digest: 2rTBBy9YTJaekxTv8kQosQbmV8ExNYXgrXMTag3skFMy                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa93dc8781198ba21fff04f8193d384aec330cddd0bfb8599d78c8b15668539a0                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 18                                                                                    │
│  │ Digest: 22Qbdw7fcj33vhTsWj5KdxgynTui3Mrv7crAF2RWrCvn                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb402aa9b14ee67ae76db0d32e4573b626286934db3037378b83bf133f36c4500                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 3LF2PXsA9GCCmyrbL8B2Ftcaj7ZGGXXAE6ZzaE2HjKEw                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3ecd776d54675f64e6e8f80a7b3e913a640a81098909efc5c9e732fa873a1fed                         │
│  │ Owner: Account Address ( 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f )  │
│  │ Version: 18                                                                                    │
│  │ Digest: 9TiCC4noBfJ9Zc2Rakp4puaKskzGkjdvK6L3UqP4bRYz                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3ecd776d54675f64e6e8f80a7b3e913a640a81098909efc5c9e732fa873a1fed                         │
│  │ Owner: Account Address ( 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f )  │
│  │ Version: 18                                                                                    │
│  │ Digest: 9TiCC4noBfJ9Zc2Rakp4puaKskzGkjdvK6L3UqP4bRYz                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 12532400                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    83DQnKrM9XgkKyNpk5BwSNcbAy9Vi4wjDv2ZLmwnLYno                                                   │
│    HUKvecodFjttC4143fQ7LKpCNEwswvq8QyLJHiN8bJBg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x1c05be95ead1ed6ac79332bd3a7e946c9cba50e1ec678924395c8c2c4d758b1c
 │ Sender: 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f 
 │ Owner: Account Address ( 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 0x12
 │ Digest: 6REM6gLk9VGkTHJjbdyLR1pFgdJ36nFx65kGQsobDuQW
 └──

 ┌──
 │ ObjectID: 0xa9032563eddcadc56151df6270f2a478315c54cb8f632bad7161b0de9e2a4eba
 │ Sender: 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f 
 │ Owner: Account Address ( 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f )
 │ ObjectType: 0x2::coin::TreasuryCap<0xb402aa9b14ee67ae76db0d32e4573b626286934db3037378b83bf133f36c4500::cat_coin::CAT_COIN> 
 │ Version: 0x12
 │ Digest: 2rTBBy9YTJaekxTv8kQosQbmV8ExNYXgrXMTag3skFMy
 └──

 ┌──
 │ ObjectID: 0xa93dc8781198ba21fff04f8193d384aec330cddd0bfb8599d78c8b15668539a0
 │ Sender: 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f 
 │ Owner: Immutable
 │ ObjectType: 0x2::coin::CoinMetadata<0xb402aa9b14ee67ae76db0d32e4573b626286934db3037378b83bf133f36c4500::cat_coin::CAT_COIN> 
 │ Version: 0x12
 │ Digest: 22Qbdw7fcj33vhTsWj5KdxgynTui3Mrv7crAF2RWrCvn
 └──


Mutated Objects: 
 ┌──
 │ ObjectID: 0x3ecd776d54675f64e6e8f80a7b3e913a640a81098909efc5c9e732fa873a1fed
 │ Sender: 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f 
 │ Owner: Account Address ( 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 0x12
 │ Digest: 9TiCC4noBfJ9Zc2Rakp4puaKskzGkjdvK6L3UqP4bRYz
 └──


Published Objects: 
 ┌──
 │ PackageID: 0xb402aa9b14ee67ae76db0d32e4573b626286934db3037378b83bf133f36c4500 
 │ Version: 0x1 
 │ Digest: 3LF2PXsA9GCCmyrbL8B2Ftcaj7ZGGXXAE6ZzaE2HjKEw
 | Modules: cat_coin
 └──

----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xcb1ca7c6089414d0a95db588a67cffcaf2bf5eeaa362d0cbe8292f0b3991105f ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -12554280
