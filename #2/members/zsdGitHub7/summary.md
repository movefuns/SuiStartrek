# 学习成果

# 学习成果

## 一周目

+ 安装了环境(系统是Sonoma14.1)
+ 发布了hello world以及ERC20

可能是系统原因,过程很艰难,我遇到的所有问题都会添加到我的journal.md,欢迎交流



## 环境安装以及获得测试币(gas)

大体上可以参考https://github.com/movefuns/co-learn-sui/blob/main/courses/unit-1/1-get-start/README.md即可.

## 钱包注册

- [Sui Wallet](https://chrome.google.com/webstore/detail/opcgpfmipidbgpenhmajoajpbobppdil) | [教程-如何开始使用Sui钱包](https://mp.weixin.qq.com/s/-_hCFUO-62hv9amPzmJdeg)
- [Suiet Wallet](https://chrome.google.com/webstore/detail/suiet-sui-wallet/khpkpbbcccdmmclmpigdgddabeilkdpd) | [教程-如何获取Suiet钱包](https://suiet.app/blog/what-is-suiet-sui-wallet-how-to-use-sui-wallet)

## hello world 

https://sui-typescript-docs.vercel.app/dapp-kit

## ERC 20

成功的(testnet)

```
0x2395349cf163ce1fa56b117c02e50ca6407ef9ba473c8e78fc19e2c34af7b5ee
```

可以参考`hello world`的发布但把sources文件内`.move`文件内容改为

```
module sui_erc20::erc20coin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct ERC20COIN has drop {}

    fun init(witness: ERC20COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"ERC20COIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }
}
```