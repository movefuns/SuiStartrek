
# 第一个 Sui 智能合约: Counter

## Sui 版本

> 由于使用 ubuntu，直接下载官方包解压，直接使用

```bash
sui --version
sui 1.18.0-b1fe1f07f
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
╭────────────────────────────────────────────────────────────────────┬─────────────╮
│ gasCoinId                                                          │ gasBalance  │
├────────────────────────────────────────────────────────────────────┼─────────────┤
│ 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461 │ 10000000000 │
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
get-faucet.sh 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461
{"transferredGasObjects":[{"amount":10000000000,"id":"0x54d9e604e542d1cd2b353b1534cf8edc9e51c94d6c1a1993ec40591eb32b87b0","transferTxDigest":"BmMdvf9WEUCdQosgZuP9iR67GSW2dUFAy5FhZ7YWkyCo"}],"error":null}
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
UPDATING GIT DEPENDENCY https://gitlab.com/blockchain-labx/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING counter
Successfully verified dependencies on-chain against source.
Transaction Digest: EBGC49CKLxuiE5kxVRqjGGaJerkjTPBfdAWTDAnKcbov
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
│  │ Version: 27                                                                                                                                              │
│  │ Digest: 8tQESbpDzA77pHGVj8tAegjisQoSPJmFBDcqo6VfAph4                                                                                                     │
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
│    QZZVAHdiWY3n93DOmQJFmF7aT1zN3ddWMBTHCU/Ka9Ms6zJV0+SraVioLudTu3GeUA3hFmt9aSsQ6Mt6OLTo0g==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EBGC49CKLxuiE5kxVRqjGGaJerkjTPBfdAWTDAnKcbov                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 576                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x18f344f3740ac9c089fae3be1c1fc009988b21368a45d7158f4507caf02034ba                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: UcoDVujV2qFfiR6sL6fAUBRg8QtcxnPJ7pfSEaArRp5                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8071f6510229749947240dd7087a2358913a18f0f3ca1a5690f765ef4b833bf0                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 28                                                                                    │
│  │ Digest: CirJSuSeKjwzv7QFQDrocRuUYHgEzmN2GCsxX2HHf7k6                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 28                                                                                    │
│  │ Digest: 24Pffo5KpQVHvDiYwECsPBiCpffph77H2vk8ppjHV2wa                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                         │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ Version: 28                                                                                    │
│  │ Digest: 24Pffo5KpQVHvDiYwECsPBiCpffph77H2vk8ppjHV2wa                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9218800                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    EBsbH36erhHoXUAMVyNbUB1fRBQhYDbcYCdRShf7Nr5W                                                   │
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
│  │ ObjectID: 0x8071f6510229749947240dd7087a2358913a18f0f3ca1a5690f765ef4b833bf0                  │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                    │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 28                                                                                   │
│  │ Digest: CirJSuSeKjwzv7QFQDrocRuUYHgEzmN2GCsxX2HHf7k6                                          │
│  └──                                                                                             │
│                                                                                                  │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x32f976c280b729c86d45fd19db0f43561e7ca4e0c5fd835f12a1519714ac4461                  │
│  │ Sender: 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c                    │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 28                                                                                   │
│  │ Digest: 24Pffo5KpQVHvDiYwECsPBiCpffph77H2vk8ppjHV2wa                                          │
│  └──                                                                                             │
│                                                                                                  │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x18f344f3740ac9c089fae3be1c1fc009988b21368a45d7158f4507caf02034ba                 │
│  │ Version: 1                                                                                    │
│  │ Digest: UcoDVujV2qFfiR6sL6fAUBRg8QtcxnPJ7pfSEaArRp5                                           │
│  │ Modules: counter                                                                              │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x13ab944fada6f2cf2462feede61044500f72733c7949cd3854fd080c1083b41c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -9240680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```