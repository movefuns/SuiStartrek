## Move 合约的创建和发布

### 1. 创建 Move 项目

```
sui move new my_first_package
```

### 2. 修改 move.toml

将 dependencies 中的 `rev` 版本号改为 `framework/devnet`

```
Sui = { git = "https://github.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/devnet" }
```

### 3. 编写合约与编译

### 3.1 basket.move
```
module my_first_package::managed {
     use std::option;
     use sui::coin::{Self, Coin, TreasuryCap};
     use sui::transfer;
     use sui::tx_context::{Self, TxContext};

     /// Name of the coin. By convention, this type has the same name as its parent module
     /// and has no fields. The full type of the coin defined by this module will be `COIN<MANAGED>`.
     struct MANAGED has drop {}

     #[allow(unused_function)]
     /// Register the managed currency to acquire its `TreasuryCap`. Because
     /// this is a module initializer, it ensures the currency only gets
     /// registered once.
     fun init(witness: MANAGED, ctx: &mut TxContext) {
         // Get a treasury cap for the coin and give it to the transaction sender
         let (treasury_cap, metadata) = coin::create_currency<MANAGED>(witness, 2, b"MANAGED", b"", b"", option::none(), ctx);
         transfer::public_freeze_object(metadata);
         transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
     }

     /// Manager can mint new coins
     public entry fun mint(
         treasury_cap: &mut TreasuryCap<MANAGED>, amount: u64, recipient: address, ctx: &mut TxContext
     ) {
         coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
     }

     /// Manager can burn coins
     public entry fun burn(treasury_cap: &mut TreasuryCap<MANAGED>, coin: Coin<MANAGED>) {
         coin::burn(treasury_cap, coin);
     }

     #[test_only]
     /// Wrapper of module initializer for testing
     public fun test_init(ctx: &mut TxContext) {
         init(MANAGED {}, ctx)
     }
}
```

### 3.2 my_module.move

```
module my_first_package::mycoin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    struct MYCOIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"MYCOIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }
}
```

### 3.3 编译合约

```
sui move build
```

### 3.4 发布合约

```
sui client publish --gas-budget 100000000
```

### 3.5 从 sui-explorer 查看合约

- [mycoin](https://suiexplorer.com/object/0x064d0f563f07216a4692f39dbf575d0d27e0a16be1181369b2c336f9626f041e?network=devnet)
- [managed](https://suiexplorer.com/object/0x43a1e6e6b36b699dc90e4a6ce944423ace78bf97a1e50bdce5f995147609fbff?network=devnet)

### 4. 项目源码
[my-first-package](https://github.com/luckychacha/my_first_package)