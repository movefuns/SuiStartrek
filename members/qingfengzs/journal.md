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