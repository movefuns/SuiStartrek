## 1. 安装Sui及配置

安装rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update stable
```

安装依赖

```bash
sudo apt-get update
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

安装sui

```bash
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```

安装move插件

```bash
cargo install --git https://github.com/move-language/move move-analyzer --branch sui-move --features "address32"
```



添加主网和测试网

```bash
sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
sui client new-env --alias mainnet --rpc https://sui-mainnet.nodeinfra.com:443

// 切换网络
sui client switch --env testnet
```

获取测试token

```bash
curl --location --request POST 'https://faucet.devnet.sui.io/gas' --header 'Content-Type: application/json' --data-raw '{
    "FixedAmountRequest": {
        "recipient": "xxxxxxxx"
    }
}'
```

钱包相关命令

```bash
// 当前保存的密钥
sui client addresses
// 当前启用的密钥
sui client active-address
// 查询余额
sui client gas
```

## 2. 合约开发

```bash
// 创建项目
sui move new hello_world
// 编译
sui move build
// 部署
sui client publish --gas-budget 50000000
// 合约调用
sui client call --function xx --module xx 00package xxx --gas-budget xxx
```

计数器合约

```bash
module hello_move_world::counter {
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    struct Counter has key {
        id: UID,
        value: u64,
    }

    entry public fun getCounter(ctx: &mut TxContext) {
        // sender address
        let sender = tx_context::sender(ctx);
        let counter_obj = Counter {
            id: object::new(ctx),
            value: 0
        };
        transfer::transfer(counter_obj, sender);
    }

    public entry fun incr(counter: &mut Counter) {
        counter.value = counter.value + 1;
    } 
}
```

