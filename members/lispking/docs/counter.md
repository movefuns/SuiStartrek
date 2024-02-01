
# 第一个 Sui 智能合约: Counter

## Sui 版本

> 由于使用 ubuntu，直接下载官方包解压，直接使用

```bash
sui --version
sui 1.17.0-c9aa7db
```

## DevNet 环境准备

```bash
sui client envs
╭────────┬────────────────────────────────────┬────────╮
│ alias  │ url                                │ active │
├────────┼────────────────────────────────────┼────────┤
│ devnet │ https://fullnode.devnet.sui.io:443 │ *      │
╰────────┴────────────────────────────────────┴────────╯
```

## 确认钱包是否有钱

```bash
sui client gas
[warn] Client/Server api version mismatch, client api version : 1.17.0, server api version : 1.18.0
╭────────────────────────────────────────────────────────────────────┬─────────────╮
│ gasCoinId                                                          │ gasBalance  │
├────────────────────────────────────────────────────────────────────┼─────────────┤
│ 0xc13e4bc7d3fb5d162fe5cc46868a4f88ffc771bc08b78c4ca8d9c1c3a2b5d038 │ 10000000000 │
╰────────────────────────────────────────────────────────────────────┴─────────────╯
```

## 编写合约

* 执行`sui move new counter` 创建合约 package
* 在 `sources` 目录下创建 `counter.move` 合约，内容源于官方sample

```rust
// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

/// This example demonstrates a basic use of a shared object.
/// Rules:
/// - anyone can create and share a counter
/// - everyone can increment a counter by 1
/// - the owner of the counter can reset it to any value
module counter::counter {
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    /// A shared counter.
    struct Counter has key {
        id: UID,
        owner: address,
        value: u64
    }

    public fun owner(counter: &Counter): address {
        counter.owner
    }

    public fun value(counter: &Counter): u64 {
        counter.value
    }

    /// Create and share a Counter object.
    public entry fun create(ctx: &mut TxContext) {
        transfer::share_object(Counter {
            id: object::new(ctx),
            owner: tx_context::sender(ctx),
            value: 0
        })
    }

    /// Increment a counter by 1.
    public entry fun increment(counter: &mut Counter) {
        counter.value = counter.value + 1;
    }

    /// Set value (only runnable by the Counter owner)
    public entry fun set_value(counter: &mut Counter, value: u64, ctx: &TxContext) {
        assert!(counter.owner == tx_context::sender(ctx), 0);
        counter.value = value;
    }

    /// Assert a value for the counter.
    public entry fun assert_value(counter: &Counter, value: u64) {
        assert!(counter.value == value, 0)
    }

    /// Delete counter (only runnable by the Counter owner)
    public entry fun delete(counter: Counter, ctx: &TxContext) {
        assert!(counter.owner == tx_context::sender(ctx), 0);
        let Counter {id, owner:_, value:_} = counter;
        object::delete(id);
    }
}

#[test_only]
module counter::counter_test {
    use sui::test_scenario;
    use counter::counter;

    #[test]
    fun test_counter() {
        let owner = @0xC0FFEE;
        let user1 = @0xA1;

        let scenario_val = test_scenario::begin(user1);
        let scenario = &mut scenario_val;

        test_scenario::next_tx(scenario, owner);
        {
            counter::create(test_scenario::ctx(scenario));
        };

        test_scenario::next_tx(scenario, user1);
        {
            let counter_val = test_scenario::take_shared<counter::Counter>(scenario);
            let counter = &mut counter_val;

            assert!(counter::owner(counter) == owner, 0);
            assert!(counter::value(counter) == 0, 1);

            counter::increment(counter);
            counter::increment(counter);
            counter::increment(counter);
            test_scenario::return_shared(counter_val);
        };

        test_scenario::next_tx(scenario, owner);
        {
            let counter_val = test_scenario::take_shared<counter::Counter>(scenario);
            let counter = &mut counter_val;

            assert!(counter::owner(counter) == owner, 0);
            assert!(counter::value(counter) == 3, 1);

            counter::set_value(counter, 100, test_scenario::ctx(scenario));

            test_scenario::return_shared(counter_val);
        };

        test_scenario::next_tx(scenario, user1);
        {
            let counter_val = test_scenario::take_shared<counter::Counter>(scenario);
            let counter = &mut counter_val;

            assert!(counter::owner(counter) == owner, 0);
            assert!(counter::value(counter) == 100, 1);

            counter::increment(counter);

            assert!(counter::value(counter) == 101, 2);

            test_scenario::return_shared(counter_val);
        };
        test_scenario::end(scenario_val);
    }
}
```

##  修改 Move.toml

* 由于 `github` 在国内访问不友好，手动同步官方源到 `gitlab`
* 将 `rev` 换成 `devent`，方便随时取水

```toml
[package]
name = "counter"
version = "0.0.1"

[dependencies]
# 换成加速源
Sui = { git = "https://gitlab.com/blockchain-labx/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "devnet" }

[addresses]
counter = "0x0"
```

## 取水

* 封装脚本 `get-faucet.sh`，内容如下：

```bash
#!/bin/bash

recipient=$1
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw "{
    \"FixedAmountRequest\": {
        \"recipient\": \"${recipient}\"
    }
}"
```

* 执行脚本取水

```bash
get-faucet.sh 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e
{"transferredGasObjects":[{"amount":10000000000,"id":"0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181","transferTxDigest":"ADWxtJEzBrBz9uuDDzxRFZqSaHCjtYcSy72pfk6Bn3w5"}],"error":null}
```

## 编译合约

```bash
sui move build
UPDATING GIT DEPENDENCY https://gitlab.com/blockchain-labx/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING counter
```

## 部署合约

```bash
sui client publish --gas-budget 20000000
[warn] Client/Server api version mismatch, client api version : 1.17.0, server api version : 1.18.0
UPDATING GIT DEPENDENCY https://gitlab.com/blockchain-labx/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING counter
Successfully verified dependencies on-chain against source.
Transaction Digest: 25rGi7qE6p18ZQq6161VjMjCKi2hhyMMaJZWmUVyEuLE
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
│  │ Version: 19                                                                                                                                              │
│  │ Digest: 14cMQzZzfyyc1Fpw6dRTBCFQbCLdHyjCPQ8D1kHtPcgB                                                                                                     │
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
│    amEWetPUt0ixjuh70h5CHzQfjHSsmlYlUYxgGPZaVz2Lt5rSCti9NIjjNABUCk9GTYYh19bbkNCh5U73kzaMCg==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 25rGi7qE6p18ZQq6161VjMjCKi2hhyMMaJZWmUVyEuLE                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 388                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0b991962cabb33845ee805975c55842ccfb04df3890176abe9b14a7c211f0d05                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Hzb25o886rN13EVZNm3XdaMX3KfD89EWKShDXsGiR8z2                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x80ed5b7c040d46367443c14429168cc880584bf3c0f636a9435248cece9620d2                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 20                                                                                    │
│  │ Digest: 5qMBDnbJAgjVmbZ3UPzNmUvp45RAnKR3n8C9fixTUsao                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 20                                                                                    │
│  │ Digest: 53hZtJti37TF3fgLYZV7AVC9XKGmvZcKbzVFDcbGwmgv                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                         │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ Version: 20                                                                                    │
│  │ Digest: 53hZtJti37TF3fgLYZV7AVC9XKGmvZcKbzVFDcbGwmgv                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9218800                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    ADWxtJEzBrBz9uuDDzxRFZqSaHCjtYcSy72pfk6Bn3w5                                                   │
│    Gg1mV8WyKLi7FEk8AfdshXjSfZAcJcDLeamWn179tWfP                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                  │
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x80ed5b7c040d46367443c14429168cc880584bf3c0f636a9435248cece9620d2                  │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                    │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 20                                                                                   │
│  │ Digest: 5qMBDnbJAgjVmbZ3UPzNmUvp45RAnKR3n8C9fixTUsao                                          │
│  └──                                                                                             │
│                                                                                                  │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb95d40715ad4b356b11e81b0a3fc19d5d3215bc3c364adfd64de78c25f20f181                  │
│  │ Sender: 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e                    │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 20                                                                                   │
│  │ Digest: 53hZtJti37TF3fgLYZV7AVC9XKGmvZcKbzVFDcbGwmgv                                          │
│  └──                                                                                             │
│                                                                                                  │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x0b991962cabb33845ee805975c55842ccfb04df3890176abe9b14a7c211f0d05                 │
│  │ Version: 1                                                                                    │
│  │ Digest: Hzb25o886rN13EVZNm3XdaMX3KfD89EWKShDXsGiR8z2                                          │
│  │ Modules: counter                                                                              │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x45d223140af473e9c0c5aafc4daca981b11e9893c022ea46a8b79fbf78bd862e )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -9240680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```