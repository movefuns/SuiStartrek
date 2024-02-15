module nft::nft {
  use sui::tx_context::{sender, TxContext};
  use std::string::{utf8, String};
  use sui::transfer::{Self, public_transfer};
  use sui::object::{Self, UID};
  use sui::package;
  use sui::display;

  struct MyNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
  }

  struct NFT has drop {}

  fun init(otw: NFT, ctx: &mut TxContext) {
    let keys = vector[
      utf8(b"name"),
      utf8(b"image_url"),
    ];

    let values = vector[
      utf8(b"{name}"),
      utf8(b"{image_url}"),
    ];

    let publisher = package::claim(otw, ctx);

    let display = display::new_with_fields<MyNFT>(
      &publisher, keys, values, ctx
    );

    display::update_version(&mut display);

    transfer::public_transfer(publisher, sender(ctx));
    transfer::public_transfer(display, sender(ctx));
  }

  public entry fun mint(ctx: &mut TxContext) {
    let name = utf8(b"greyhao");
    let image_url = utf8(b"https://ipfs.crossbell.io/ipfs/bafkreigbu2i3ngomrfiij3rdlam246ampey6jhngbn3orusm7oqtfgcivm");
    let nft = MyNFT {
      id: object::new(ctx),
      name,
      image_url,
    };
    public_transfer(nft, sender(ctx));
  }

}


/* 
build
# sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING nft

// publish
# sui client publish --gas-budget 10000000 
 使用部署第一个合约时候gas 值会报错：
[warn] Client/Server api version mismatch, client api version : 1.18.1, server api version : 1.19.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING nft
Successfully verified dependencies on-chain against source.
Error executing transaction: Failure {
    error: "InsufficientGas",
}

调大 gas，部署成功
# sui client publish --gas-budget 100000000
[warn] Client/Server api version mismatch, client api version : 1.18.1, server api version : 1.19.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING nft
Successfully verified dependencies on-chain against source.
Transaction Digest: Fzub6jxAiCiBhbg9so4GqToHYb9RsaREsCyAYJQ5pMCk
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                                   │
│ Gas Owner: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c                                    │
│  │ Version: 19                                                                                               │
│  │ Digest: EiHmSxmEzGhKwWH9nSW4Mw5jsGUWSbPF3Wawj5jL8w8X                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157" │ │
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
│    G6dQ7mo5HYnFTgHZL+9pjz7StgLmvdmXybwllrCeoY3Ly8JWmkVV2s1z0UiOjbBLOzyTTXRarU5fLrpGuP1dCg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Fzub6jxAiCiBhbg9so4GqToHYb9RsaREsCyAYJQ5pMCk                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 689                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x00dc7ccc4194b23eb260ec3a7c67f59ba944ee6c68b85a7074c9b0500f1dbb30                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ Version: 20                                                                                    │
│  │ Digest: 2WDAvTeo8ZFBdbBKAFKhy7Cmrn1sFgqtYSfNNesx8Hgi                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x28f4262e41b534f1a6635d0d8fded2abf681b62cc71690d9eb73080ff2dd31a3                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ Version: 20                                                                                    │
│  │ Digest: 6wmeQtwGwESqAhZBWGTyS2Wb8jXWq46N8ERqrhHdg8Mq                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x2da4adc48b38ab31c96e4918869ff5fca75cfcc06318af7d297d700d708c2814                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ Version: 20                                                                                    │
│  │ Digest: EjbMAM8B2VvpYNDsArhxennKkLTr5c4KyVRjkunhMKJk                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8c308b373242a3ebffbb4b24a7385b87e4837ab14db705b3b570ef80ce7eb8a1                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 7rweFTAhumYXwATQnyQt9eihnEbHvPbS11grKFjom5jM                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ Version: 20                                                                                    │
│  │ Digest: 3TJguLZEQQ28wxNTbxTtKocKa9jSH22CqRADTcdTbhGV                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ Version: 20                                                                                    │
│  │ Digest: 3TJguLZEQQ28wxNTbxTtKocKa9jSH22CqRADTcdTbhGV                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 15207600                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7R5JzyW5EDV4LpEkdt3uGnHaLkAAQhbdNsQMdjkPR54W                                                   │
│    G99qEEBjZRvnGTESxk6yPGEbZLFbygCYgpQHS5BcfqYB                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                   │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                       │
│  │ EventID: Fzub6jxAiCiBhbg9so4GqToHYb9RsaREsCyAYJQ5pMCk:0                                                                 │
│  │ PackageID: 0x8c308b373242a3ebffbb4b24a7385b87e4837ab14db705b3b570ef80ce7eb8a1                                           │
│  │ Transaction Module: nft                                                                                                 │
│  │ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                                              │
│  │ EventType: 0x2::display::DisplayCreated<0x8c308b373242a3ebffbb4b24a7385b87e4837ab14db705b3b570ef80ce7eb8a1::nft::MyNFT> │
│  │ ParsedJSON:                                                                                                             │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                           │
│  │   │ id │ 0x2da4adc48b38ab31c96e4918869ff5fca75cfcc06318af7d297d700d708c2814 │                                           │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                           │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ EventID: Fzub6jxAiCiBhbg9so4GqToHYb9RsaREsCyAYJQ5pMCk:1                                                                 │
│  │ PackageID: 0x8c308b373242a3ebffbb4b24a7385b87e4837ab14db705b3b570ef80ce7eb8a1                                           │
│  │ Transaction Module: nft                                                                                                 │
│  │ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                                              │
│  │ EventType: 0x2::display::VersionUpdated<0x8c308b373242a3ebffbb4b24a7385b87e4837ab14db705b3b570ef80ce7eb8a1::nft::MyNFT> │
│  │ ParsedJSON:                                                                                                             │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                      │
│  │   │ fields  │ contents │ key   │ name                                            │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ {name}                                          │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ key   │ image_url                                       │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ {image_url}                                     │                                      │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                      │
│  │   │ id      │ 0x2da4adc48b38ab31c96e4918869ff5fca75cfcc06318af7d297d700d708c2814 │                                      │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                      │
│  │   │ version │ 1                                                                  │                                      │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                      │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x00dc7ccc4194b23eb260ec3a7c67f59ba944ee6c68b85a7074c9b0500f1dbb30                                       │
│  │ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                               │
│  │ Version: 20                                                                                                        │
│  │ Digest: 2WDAvTeo8ZFBdbBKAFKhy7Cmrn1sFgqtYSfNNesx8Hgi                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x28f4262e41b534f1a6635d0d8fded2abf681b62cc71690d9eb73080ff2dd31a3                                       │
│  │ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )                      │
│  │ ObjectType: 0x2::package::Publisher                                                                                │
│  │ Version: 20                                                                                                        │
│  │ Digest: 6wmeQtwGwESqAhZBWGTyS2Wb8jXWq46N8ERqrhHdg8Mq                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x2da4adc48b38ab31c96e4918869ff5fca75cfcc06318af7d297d700d708c2814                                       │
│  │ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )                      │
│  │ ObjectType: 0x2::display::Display<0x8c308b373242a3ebffbb4b24a7385b87e4837ab14db705b3b570ef80ce7eb8a1::nft::MyNFT>  │
│  │ Version: 20                                                                                                        │
│  │ Digest: EjbMAM8B2VvpYNDsArhxennKkLTr5c4KyVRjkunhMKJk                                                               │
│  └──                                                                                                                  │
│ Mutated Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c                                       │
│  │ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                         │
│  │ Version: 20                                                                                                        │
│  │ Digest: 3TJguLZEQQ28wxNTbxTtKocKa9jSH22CqRADTcdTbhGV                                                               │
│  └──                                                                                                                  │
│ Published Objects:                                                                                                    │
│  ┌──                                                                                                                  │
│  │ PackageID: 0x8c308b373242a3ebffbb4b24a7385b87e4837ab14db705b3b570ef80ce7eb8a1                                      │
│  │ Version: 1                                                                                                         │
│  │ Digest: 7rweFTAhumYXwATQnyQt9eihnEbHvPbS11grKFjom5jM                                                               │
│  │ Modules: nft                                                                                                       │
│  └──                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -15229480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

mint 
# sui client call --package 0x8c308b373242a3ebffbb4b24a7385b87e4837ab14db705b3b570ef80ce7eb8a1 --module my_nft --gas-budget 10000000 --function mint

[warn] Client/Server api version mismatch, client api version : 1.18.1, server api version : 1.19.0
Transaction Digest: 9RDghviGuZxMuhq9HaXCmFucrp6LQM7nnH8Hs6hSA6VP
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                  │
│ Gas Owner: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157               │
│ Gas Budget: 10000000 MIST                                                                   │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c                   │
│  │ Version: 20                                                                              │
│  │ Digest: 3TJguLZEQQ28wxNTbxTtKocKa9jSH22CqRADTcdTbhGV                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│   No input objects for this transaction                                                     │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  mint                                                               │        │
│ │  │ Module:    nft                                                                │        │
│ │  │ Package:   0x8c308b373242a3ebffbb4b24a7385b87e4837ab14db705b3b570ef80ce7eb8a1 │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    xlFg5vz+OyFoKDrd6UKQMS3+BPLam39PNR3wdvL0ptxd+bDaz3BLKWQtM1BziOO4WowpZ4A/r/xUsHqUbiECCw== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9RDghviGuZxMuhq9HaXCmFucrp6LQM7nnH8Hs6hSA6VP                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 690                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa96923d63dd3c2da9796ff6885f794148d0e8483a51473ae71a646613f2e1481                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ Version: 21                                                                                    │
│  │ Digest: 3oGmRYNcouKsPQRJCMK3AFsaVWWFD1rXyGZtzw5TY3xL                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ Version: 21                                                                                    │
│  │ Digest: 8KjhrKtNKjZe81L2zHc47q3ZYcGVhhbNiGicKJAm3YPE                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ Version: 21                                                                                    │
│  │ Digest: 8KjhrKtNKjZe81L2zHc47q3ZYcGVhhbNiGicKJAm3YPE                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2994400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    Fzub6jxAiCiBhbg9so4GqToHYb9RsaREsCyAYJQ5pMCk                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xa96923d63dd3c2da9796ff6885f794148d0e8483a51473ae71a646613f2e1481                  │
│  │ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                    │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 ) │
│  │ ObjectType: 0x8c308b373242a3ebffbb4b24a7385b87e4837ab14db705b3b570ef80ce7eb8a1::nft::MyNFT    │
│  │ Version: 21                                                                                   │
│  │ Digest: 3oGmRYNcouKsPQRJCMK3AFsaVWWFD1rXyGZtzw5TY3xL                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c                  │
│  │ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                    │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 21                                                                                   │
│  │ Digest: 8KjhrKtNKjZe81L2zHc47q3ZYcGVhhbNiGicKJAm3YPE                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3016280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

 */
