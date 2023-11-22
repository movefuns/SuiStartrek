# 学习日志

# Roadmap 1

- [开发环境搭建](https://lybenson.com/sui/dev-env)
- [move 语言基础(初版)](https://lybenson.com/sui/move)

合约源码

```move
module robo::coin {
    use std::option;
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::TxContext;

    struct COIN has drop {}

    fun init(witness: COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<COIN>(witness, 6, b"ETH", b"Ethereum", b"https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}
```
