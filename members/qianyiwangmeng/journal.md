# 学习日志

### 部署第一个move程序到devnet
1. 查看领取的gas

```
sui client gas
╭────────────────────────────────────────────────────────────────────┬─────────────╮
│ gasCoinId                                                          │ gasBalance  │
├────────────────────────────────────────────────────────────────────┼─────────────┤
│ 0xa1e30e7f519c33b501622fe5fab49556df1e89dd840ced8f5c51fde0cdbe713d │ 10000000000 │
╰────────────────────────────────────────────────────────────────────┴─────────────╯
```

2. 在discord里面 devnet-faucet里面领取devnet网免费的gas

```
!faucet 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4
```

3. 编译报错解决方法:

```
error[Sui E01001]: invalid object construction
   ┌─ C:\Users\qianyi/.move\https___github_com_MystenLabs_sui_git_framework__devnet\crates/sui-framework/packages/sui-framework\sources\random.move:53:20
   │  
53 │           let self = Random {
   │ ╭────────────────────^
54 │ │             id: object::randomness_state(),
   │ │             --  -------------------------- Non fresh UID from this position
   │ │             │    
   │ │             The UID must come directly from sui::object::new. Or for tests, it can come from sui::test_scenario::new_object
55 │ │             inner: versioned::create(version, inner, ctx),
56 │ │         };
   │ ╰─────────^ Invalid object creation without a newly created UID.

Failed to build Move modules: Compilation error.
```

去官网下载 升级为最新的 sui 二进制。此bug新版本的已经被修复

4. 部署后

```
sui client publish --gas-budget 50000000
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move_world
Successfully verified dependencies on-chain against source.
Transaction Digest: 6Wj1aCdPyerKwNgQ9siE3LwHRkuSm1EUC6C5xhQzHvuV
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4                                                                                  │
│ Gas Owner: 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4                                                                               │
│ Gas Budget: 50000000 MIST                                                                                                                                   │
│ Gas Price: 1000 MIST                                                                                                                                        │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0xa1e30e7f519c33b501622fe5fab49556df1e89dd840ced8f5c51fde0cdbe713d                                                                                   │
│  │ Version: 11                                                                                                                                              │
│  │ Digest: FoCTGJyXhTdBieBLe5dVwmgdQhkPqYNpKMRXjrFFimi9                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    qTRZHKmGGQpNJGg7Z9BRaGqmyXlx8cbHx/HDI1FU6nMkbdjtFabGmbU4Ccu9lgopr3wzKiGPflB3eJRKdgnNAg==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6Wj1aCdPyerKwNgQ9siE3LwHRkuSm1EUC6C5xhQzHvuV                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 4                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3c9874561948f2cb194a4774ac5ffff5ad7d9e4d85a32b874778dc1463e526f6                         │
│  │ Owner: Account Address ( 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4 )  │
│  │ Version: 12                                                                                    │
│  │ Digest: 2aLnaRTJ3VabycZ79nQePiJVrxNxhZgv6Kq6rbprpgwL                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x567d31b5f9344f507b8a94ffd46d7497a5321dcf4b57da506576db1b650b9f91                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Eggd2E167kVMqLj6vMUjFsvqMEGGQwVctQvx4tbZd5YQ                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa1e30e7f519c33b501622fe5fab49556df1e89dd840ced8f5c51fde0cdbe713d                         │
│  │ Owner: Account Address ( 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4 )  │
│  │ Version: 12                                                                                    │
│  │ Digest: 357iWiKy3XhRPmeCLcpzQQk2yHzEAkXAddPZDXRiSz12                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xa1e30e7f519c33b501622fe5fab49556df1e89dd840ced8f5c51fde0cdbe713d                         │
│  │ Owner: Account Address ( 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4 )  │
│  │ Version: 12                                                                                    │
│  │ Digest: 357iWiKy3XhRPmeCLcpzQQk2yHzEAkXAddPZDXRiSz12                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7402400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    B6ZNK69zQmFmUYXTuR67B2kQUKCAp1oJYZKYPSxsp9A8                                                   │
│    Dt2zkasrBnfNbBsXioegJPS9W3xvG8zCRfAXYgmsjzVC                                                   │
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
│  │ ObjectID: 0x3c9874561948f2cb194a4774ac5ffff5ad7d9e4d85a32b874778dc1463e526f6                  │
│  │ Sender: 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4                    │
│  │ Owner: Account Address ( 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 12                                                                                   │
│  │ Digest: 2aLnaRTJ3VabycZ79nQePiJVrxNxhZgv6Kq6rbprpgwL                                          │
│  └──                                                                                             │
│                                                                                                  │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xa1e30e7f519c33b501622fe5fab49556df1e89dd840ced8f5c51fde0cdbe713d                  │
│  │ Sender: 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4                    │
│  │ Owner: Account Address ( 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 12                                                                                   │
│  │ Digest: 357iWiKy3XhRPmeCLcpzQQk2yHzEAkXAddPZDXRiSz12                                          │
│  └──                                                                                             │
│                                                                                                  │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x567d31b5f9344f507b8a94ffd46d7497a5321dcf4b57da506576db1b650b9f91                 │
│  │ Version: 1                                                                                    │
│  │ Digest: Eggd2E167kVMqLj6vMUjFsvqMEGGQwVctQvx4tbZd5YQ                                          │
│  | Modules: counter                                                                              │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7424280                                                                               │
│  └──                                                                                              │
│                                                                                                                                                                                     │ 
```

objectID：0x567d31b5f9344f507b8a94ffd46d7497a5321dcf4b57da506576db1b650b9f91  找到 Immutable

5. 调用合约

- 查询计数器值

```
sui client call --function getCounter --module counter --package 0x567d31b5f9344f507b8a94ffd46d7497a5321dcf4b57da506576db1b650b9f91 --gas-budget 10000000                                   
Transaction Digest: 2vTGCsrr4QwrZQ6ANBwsLcbEH7deF9C2B9eWDXTap4WN
╭────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                       │
├────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4                             │
│ Gas Owner: 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4                          │
│ Gas Budget: 10000000 MIST                                                                              │
│ Gas Price: 1000 MIST                                                                                   │
│ Gas Payment:                                                                                           │
│  ┌──                                                                                                   │
│  │ ID: 0xa1e30e7f519c33b501622fe5fab49556df1e89dd840ced8f5c51fde0cdbe713d                              │
│  │ Version: 12                                                                                         │
│  │ Digest: 357iWiKy3XhRPmeCLcpzQQk2yHzEAkXAddPZDXRiSz12                                                │
│  └──                                                                                                   │
│                                                                                                        │
│ Transaction Kind : Programmable                                                                        │
│ Inputs: []                                                                                             │
│ Commands: [                                                                                            │
│   MoveCall(0x567d31b5f9344f507b8a94ffd46d7497a5321dcf4b57da506576db1b650b9f91::counter::getCounter()), │
│ ]                                                                                                      │
│                                                                                                        │
│                                                                                                        │
│ Signatures:                                                                                            │
│    Pj685ioORppusVHJolrI9AO3Gh7DT2Y1IsEsIQ08ckT2NIXA2RXh7n+6prx8kthDjxE7ZLlO4BHAMlqwBW0jCw==            │
│                                                                                                        │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2vTGCsrr4QwrZQ6ANBwsLcbEH7deF9C2B9eWDXTap4WN                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 4                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x58bc19f50455771255a1e5b7179bea45bb1027bf632e2abfc7c0565609befaee                         │
│  │ Owner: Account Address ( 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4 )  │
│  │ Version: 13                                                                                    │
│  │ Digest: 7aSekfy8VxxDnSXQPBVfzK7Bq8xjbSjtTTPVE3GAfzxo                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa1e30e7f519c33b501622fe5fab49556df1e89dd840ced8f5c51fde0cdbe713d                         │
│  │ Owner: Account Address ( 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4 )  │
│  │ Version: 13                                                                                    │
│  │ Digest: FfVW624EmKhWtxYeDC4gRp8fJEVo35JX5yVs8BPHwKmr                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xa1e30e7f519c33b501622fe5fab49556df1e89dd840ced8f5c51fde0cdbe713d                         │
│  │ Owner: Account Address ( 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4 )  │
│  │ Version: 13                                                                                    │
│  │ Digest: FfVW624EmKhWtxYeDC4gRp8fJEVo35JX5yVs8BPHwKmr                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2348400                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6Wj1aCdPyerKwNgQ9siE3LwHRkuSm1EUC6C5xhQzHvuV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                      │
│ Created Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0x58bc19f50455771255a1e5b7179bea45bb1027bf632e2abfc7c0565609befaee                      │
│  │ Sender: 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4                        │
│  │ Owner: Account Address ( 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4 )     │
│  │ ObjectType: 0x567d31b5f9344f507b8a94ffd46d7497a5321dcf4b57da506576db1b650b9f91::counter::Counter  │
│  │ Version: 13                                                                                       │
│  │ Digest: 7aSekfy8VxxDnSXQPBVfzK7Bq8xjbSjtTTPVE3GAfzxo                                              │
│  └──                                                                                                 │
│                                                                                                      │
│ Mutated Objects:                                                                                     │
│  ┌──                                                                                                 │
│  │ ObjectID: 0xa1e30e7f519c33b501622fe5fab49556df1e89dd840ced8f5c51fde0cdbe713d                      │
│  │ Sender: 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4                        │
│  │ Owner: Account Address ( 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4 )     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                        │
│  │ Version: 13                                                                                       │
│  │ Digest: FfVW624EmKhWtxYeDC4gRp8fJEVo35JX5yVs8BPHwKmr                                              │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x51ddc644ac869714c115650874a7b0cd9cda5f211f2354b41930460f8e04c3a4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2370280                                                                               │
│  └──                                                                                              │
│                                                                                                   │
```

创建的对象id: 0x58bc19f50455771255a1e5b7179bea45bb1027bf632e2abfc7c0565609befaee

- 增加计数值

```
 sui client call --function incr --module counter --package 0x567d31b5f9344f507b8a94ffd46d7497a5321dcf4b57da506576db1b650b9f91   --args 0x58bc19f50455771255a1e5b7179bea45bb1027bf632e2abfc7c0565609befaee --gas-budget 10000000
```

可以在object看到 增加1

```
id
{
  "id": "0x58bc19f50455771255a1e5b7179bea45bb1027bf632e2abfc7c0565609befaee"
}

value
1
```

