# 学习日志

## 20231113 sui-move helloworld

### install tool

windows wsl install success

![Imgur](https://i.imgur.com/HpfYW4W.png)

### init project

```
sui move new hello_world
```

![Imgur](https://i.imgur.com/1hmVa20.png)

### publish

```
sui client publish . --gas-budget 30000000
```

![Imgur](https://i.imgur.com/hexvzVz.png)

----- Transaction Digest（后补Hash） ----

2nSgTTgmvRLJxHWEiq8fYKJikh9yvDqfEhr4so6YK87o

### call function

```
sui client call --function mint --module hello --package 0x49ca688124e75ee42133b37d12dc213bd0996f9c10685c3c7b416
c4fcbba72ef --gas-budget 30000000

```

----- Transaction Digest(后补Hash) ----

EG9B5dUqCWhvct8E261kFSoRTBfQEhFrNXLrveaweQEP

![Imgur](https://i.imgur.com/imsrtgB.png)

## 20231117 sui-move fungible-token

### init project

```
sui move new fungible-token

```

![Imgur](https://i.imgur.com/If9Oa8C.png)

### code

```

**token code**

module fungible_tokens::managed{
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};


  struct MANAGED has drop{}

  fun init(witness:MANAGED,ctx:&mut TxContext){
    let (treasury_cap,coin_metadata) =
     coin::create_currency<MANAGED>(witness,2,b"MANAGED",b"MNG",b"",option::none(),ctx);
    transfer::public_freeze_object(coin_metadata);
    transfer::public_transfer(treasury_cap,tx_context::sender(ctx));
  }

  public entry fun mint(teasury_cap:&mut TreasuryCap<MANAGED>,amount:u64,recipient: address,ctx:&mut TxContext){
    let mint_coin = coin::mint(teasury_cap,amount,ctx);
    transfer::public_transfer(mint_coin,recipient);
    // 下面的方法会报错
    // sui::coin::mint_and_transfer(teasury_cap,amount,recipient,ctx);
  }

  public entry fun burn(treasury_cap:&mut TreasuryCap<MANAGED>,coin: Coin<MANAGED>){
    sui::coin::burn(treasury_cap,coin);
  }

  
  #[test_only]
  public fun test_init(ctx:&mut TxContext){
      init(MANAGED{},ctx)
  }
}

```

** test code **

```
// Copyright (c) Sui Foundation, Inc.
// SPDX-License-Identifier: Apache-2.0

#[test_only]
module fungible_tokens::managed_tests {

    use fungible_tokens::managed::{Self, MANAGED};
    use sui::coin::{Coin, TreasuryCap};
    use sui::test_scenario::{Self, next_tx, ctx};

    #[test]
    fun mint_burn() {
        // Initialize a mock sender address
        let addr1 = @0xA;

        // Begins a multi transaction scenario with addr1 as the sender
        let scenario = test_scenario::begin(addr1);
      
        // Run the managed coin module init function
        {
            managed::test_init(ctx(&mut scenario))
        };

        // Mint a `Coin<MANAGED>` object
        next_tx(&mut scenario, addr1);
        {
            let treasurycap = test_scenario::take_from_sender<TreasuryCap<MANAGED>>(&scenario);
            managed::mint(&mut treasurycap, 100, addr1, test_scenario::ctx(&mut scenario));
            test_scenario::return_to_address<TreasuryCap<MANAGED>>(addr1, treasurycap);
        };

        // Burn a `Coin<MANAGED>` object
        next_tx(&mut scenario, addr1);
        {
            let coin = test_scenario::take_from_sender<Coin<MANAGED>>(&scenario);
            let treasurycap = test_scenario::take_from_sender<TreasuryCap<MANAGED>>(&scenario);
            managed::burn(&mut treasurycap, coin);
            test_scenario::return_to_address<TreasuryCap<MANAGED>>(addr1, treasurycap);
        };

        // Cleans up the scenario object
        test_scenario::end(scenario);
    }

}

```

### test

```
sui move test

```

![Imgur](https://i.imgur.com/HtO3UYt.png)

### publish

```
sui move publish . --gas-budget 30000000
```

----- Transaction Digest ----

GFb7BS9V5giYh91D3G7mT6D5HWA3MkwrcfSndhy3fdss

![Imgur](https://i.imgur.com/zHLueBP.png)

### mint

```shell
sui client call --function mint --module managed --package 0x152c5dcb44f6b858a5f972e7fddd9607847c53a2d88bfbccbecaa0cf40fbd8cc --args 0xed6c1d38f64e72b4a0501a48ac7384c88f906a9347c24bded4a59f1bc34a815a 1000000 0xfc150432ae6a609aa4d6c3bbbbc44aecea43ac28418652e34d17933026696ee9  --gas-budget 30000000
```

----- Transaction Digest ----

8b44gfR3qZhM4jysHBiC4rBTDjBWFGuVENXRaKTj1bQg

![Imgur](https://i.imgur.com/RmRShhu.png)

## 20231118 roadmap-1 publish erc20

### hellocoin

```
----- Transaction Digest ----
B5CSwWhPwSkn5WXqX7hq9MtqEotVT3uD6DAA1uddxvja
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c                                                                                  │
│ Gas Owner: 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c                                                                               │
│ Gas Budget: 30000000                                                                                                                                        │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x4e25854216a0b13f756391079e0765ae57d803b45d77f628d2c4c975873e6c77                                                                                   │
│  │ Version: 17                                                                                                                                              │
│  │ Digest: S2Kkw41ezWbtgbJPA5VJe3N2oppCKwPahZxi2mvA8t7                                                                                                      │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    rdxyGch0zhlPRk+QWaP6RE5KtruVMdAYqiEVp1p9Zjm8wZd4VxkRNueMxz/MqCuVOU735V/wjXBPg2VYq2X3BQ==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: B5CSwWhPwSkn5WXqX7hq9MtqEotVT3uD6DAA1uddxvja                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 4                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x44d2c22497299ed801b135c69b7e2f2f754de00de7873990f47e310a813cce5c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 18                                                                                    │
│  │ Digest: AijsBfasydhEZeYmkzBdMFKkJ31nYxPNCdb1YUC4bFPs                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x4ca55b7cf2427a0aaf8f9dbcb9441b55dd3cbcb20e8cf14b435518f59e7ab9f5                         │
│  │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )  │
│  │ Version: 18                                                                                    │
│  │ Digest: 8P96CLnosijX1ysFzJqVMMBLyVCxWpwQgJ2JT3NFzuGB                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x759b37a7e61e388776afc24f154203ff9881c608fba8e097efc87b82983778a8                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 8qTUzKjE6yF9ZBPDyjfmTyzPcT71Zdrd4L518qngx5fT                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x89d432c9bfd5e5a33d26155a30be57e50bc6ae24514ed94524091ce21d874959                         │
│  │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )  │
│  │ Version: 18                                                                                    │
│  │ Digest: HzNReS1yzqBXvTG83tkStN4ri7uwJJhCcK35yz5zSmDQ                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4e25854216a0b13f756391079e0765ae57d803b45d77f628d2c4c975873e6c77                         │
│  │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )  │
│  │ Version: 18                                                                                    │
│  │ Digest: GBrytar8qEHYkCfqGB4oiZyPZZKMPD5sUHhnE8edP2ou                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x4e25854216a0b13f756391079e0765ae57d803b45d77f628d2c4c975873e6c77                         │
│  │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )  │
│  │ Version: 18                                                                                    │
│  │ Digest: GBrytar8qEHYkCfqGB4oiZyPZZKMPD5sUHhnE8edP2ou                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 13832000                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    52R3Wokebm9SSvuSFDMf6vHVZJ6gPzdFmxn8iGtXffN1                                                   │
│    HUKvecodFjttC4143fQ7LKpCNEwswvq8QyLJHiN8bJBg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x44d2c22497299ed801b135c69b7e2f2f754de00de7873990f47e310a813cce5c
 │ Sender: 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c 
 │ Owner: Immutable
 │ ObjectType: 0x2::coin::CoinMetadata<0x759b37a7e61e388776afc24f154203ff9881c608fba8e097efc87b82983778a8::hellocoin::HELLOCOIN> 
 │ Version: 18
 │ Digest: AijsBfasydhEZeYmkzBdMFKkJ31nYxPNCdb1YUC4bFPs
 └──
 ┌──
 │ ObjectID: 0x4ca55b7cf2427a0aaf8f9dbcb9441b55dd3cbcb20e8cf14b435518f59e7ab9f5
 │ Sender: 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c 
 │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )
 │ ObjectType: 0x2::coin::TreasuryCap<0x759b37a7e61e388776afc24f154203ff9881c608fba8e097efc87b82983778a8::hellocoin::HELLOCOIN> 
 │ Version: 18
 │ Digest: 8P96CLnosijX1ysFzJqVMMBLyVCxWpwQgJ2JT3NFzuGB
 └──
 ┌──
 │ ObjectID: 0x89d432c9bfd5e5a33d26155a30be57e50bc6ae24514ed94524091ce21d874959
 │ Sender: 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c 
 │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 18
 │ Digest: HzNReS1yzqBXvTG83tkStN4ri7uwJJhCcK35yz5zSmDQ
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x4e25854216a0b13f756391079e0765ae57d803b45d77f628d2c4c975873e6c77
 │ Sender: 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c 
 │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 18
 │ Digest: GBrytar8qEHYkCfqGB4oiZyPZZKMPD5sUHhnE8edP2ou
 └──

Published Objects: 
 ┌──
 │ PackageID: 0x759b37a7e61e388776afc24f154203ff9881c608fba8e097efc87b82983778a8 
 │ Version: 1 
 │ Digest: 8qTUzKjE6yF9ZBPDyjfmTyzPcT71Zdrd4L518qngx5fT
 | Modules: hellocoin
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -13853880
 └──

```

### worldcoin

```
----- Transaction Digest ----
CuSWh5Yib6NgnD9ZzcmEsEbVWCkVYCricxg9qebvAifo
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c                                                                                  │
│ Gas Owner: 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c                                                                               │
│ Gas Budget: 30000000                                                                                                                                        │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x4e25854216a0b13f756391079e0765ae57d803b45d77f628d2c4c975873e6c77                                                                                   │
│  │ Version: 18                                                                                                                                              │
│  │ Digest: GBrytar8qEHYkCfqGB4oiZyPZZKMPD5sUHhnE8edP2ou                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    YS3HsmqUMjWw26nKtQ8K73Jzi6+cnXSjEsErfwT/FgGL3DQV840R+kyrg8l/sDOaCBJ4voQtHkXAL1A9PnlxBA==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CuSWh5Yib6NgnD9ZzcmEsEbVWCkVYCricxg9qebvAifo                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 4                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x317955b1a5fe4ccb6b326e6af7fc5249bc613a64c8fa42ef2fdd4d79c7a3dfbd                         │
│  │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )  │
│  │ Version: 19                                                                                    │
│  │ Digest: CmVaHtmdVPtusDqsjx3vZQ3fEhjouJLHHLkTTPUSFc71                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6c22acf6d185bc9e5a4c3a7d693b9739147f945cc4da27dccd3cff2afb309feb                         │
│  │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )  │
│  │ Version: 19                                                                                    │
│  │ Digest: 5bdKKLSd8SjVViAELQw3kBKuiPSuAVZcViA2nxrSQTTH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd6c50eb123684462efba9284d42e92de48f81c258b5a96e6bca1119f75a60f9a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 19                                                                                    │
│  │ Digest: F1i6MhYUHmux8nMutA2dVKDzqTF31jDJ5pzfaqcQpANp                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf173be67416d20dbba8860821c49711c24515f802de3508ca80f0c37fc840146                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 2VBxnTd7c1GRaK57n5Jckm7uwnTBTG75Qti4Fq86ENKJ                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4e25854216a0b13f756391079e0765ae57d803b45d77f628d2c4c975873e6c77                         │
│  │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )  │
│  │ Version: 19                                                                                    │
│  │ Digest: AgHMXA3bwLEmxQGy9z5xYCUsJ5Km4PmaMR8hCnWkrmRC                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x4e25854216a0b13f756391079e0765ae57d803b45d77f628d2c4c975873e6c77                         │
│  │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )  │
│  │ Version: 19                                                                                    │
│  │ Digest: AgHMXA3bwLEmxQGy9z5xYCUsJ5Km4PmaMR8hCnWkrmRC                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 13832000                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    B5CSwWhPwSkn5WXqX7hq9MtqEotVT3uD6DAA1uddxvja                                                   │
│    HUKvecodFjttC4143fQ7LKpCNEwswvq8QyLJHiN8bJBg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x317955b1a5fe4ccb6b326e6af7fc5249bc613a64c8fa42ef2fdd4d79c7a3dfbd
 │ Sender: 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c 
 │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 19
 │ Digest: CmVaHtmdVPtusDqsjx3vZQ3fEhjouJLHHLkTTPUSFc71
 └──
 ┌──
 │ ObjectID: 0x6c22acf6d185bc9e5a4c3a7d693b9739147f945cc4da27dccd3cff2afb309feb
 │ Sender: 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c 
 │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )
 │ ObjectType: 0x2::coin::TreasuryCap<0xf173be67416d20dbba8860821c49711c24515f802de3508ca80f0c37fc840146::worldcoin::WORLDCOIN> 
 │ Version: 19
 │ Digest: 5bdKKLSd8SjVViAELQw3kBKuiPSuAVZcViA2nxrSQTTH
 └──
 ┌──
 │ ObjectID: 0xd6c50eb123684462efba9284d42e92de48f81c258b5a96e6bca1119f75a60f9a
 │ Sender: 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c 
 │ Owner: Immutable
 │ ObjectType: 0x2::coin::CoinMetadata<0xf173be67416d20dbba8860821c49711c24515f802de3508ca80f0c37fc840146::worldcoin::WORLDCOIN> 
 │ Version: 19
 │ Digest: F1i6MhYUHmux8nMutA2dVKDzqTF31jDJ5pzfaqcQpANp
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x4e25854216a0b13f756391079e0765ae57d803b45d77f628d2c4c975873e6c77
 │ Sender: 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c 
 │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 19
 │ Digest: AgHMXA3bwLEmxQGy9z5xYCUsJ5Km4PmaMR8hCnWkrmRC
 └──

Published Objects: 
 ┌──
 │ PackageID: 0xf173be67416d20dbba8860821c49711c24515f802de3508ca80f0c37fc840146 
 │ Version: 1 
 │ Digest: 2VBxnTd7c1GRaK57n5Jckm7uwnTBTG75Qti4Fq86ENKJ
 | Modules: worldcoin
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0x6b63645ec4b3e2c62fce6ff618118b72bd7ec9c27dcac08eede75a644b66b04c ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -13853880
 └──

```
