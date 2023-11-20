# 学习日志

## 1 安装环境 (Arch linux)

```bash
# 安装依赖
pacman -Sy gcc clang git ;

# 安装rust
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

echo 'export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"' >> ~/.zshrc ;

curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh -s -- -y ;

source "$HOME/.cargo/env" ;

echo 'source "$HOME/.cargo/env"' >> ~/.zshrc ;


# 安装sui

git clone https://github.com/MystenLabs/sui.git ;
cd sui;
git checkout devnet ;
cargo build -p sui ;

cp ./target/debug/sui-proxy /usr/local/bin ;

```

## 2 配置sui

```bash
sui client switch --env devnet;

#查询当前保存了密钥的地址: 
sui client addresses ；
#查询当前启用的地址:
sui client active-address ；
#列出所拥有的 gas objects: 
sui client gas ；
# 可选，导入钱包

 sui keytool import 0x56c7e45bba********************saea5a28c5b88 ed25519 ;
 sui client switch --address <0xc6e797c-导入的地址-70476de9a89a>

 #  领水
  curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{"FixedAmountRequest":{"recipient":"0xc6e7d97fc*****************b7de9a89a"}}' ;

```

## 3 sui-move 学习

### 1. 根据文档学习 创建 hello move  模块

```bash
sui move new sui_move_start ;
cd  sui_move_start ;
touch sources/hello.move ;
```

编辑 hello.move

> 详见 [github.com/rickiey/sui_move_start](https://github.com/rickiey/sui_move_start)

publish 

```bash
# sui client publish  --gas-budget 3000000000 ;
# 遇到问题，根据提示添加如下参数解决
sui client publish --skip-fetch-latest-git-deps --skip-dependency-verification  --gas-budget 3000000000

# 详见
# https://suiexplorer.com/txblock/GG7e8TjMyt5A4k9gw7zmVfNp4T77seSv2L19oyR4CxvG?network=devnet
                                      
```

```bash
export PACKAGE_ID=0x03d9bf1c531b1624be013a9b6e74571e23692bfbebb5c04ff133203a2e9a6447 
sui client call --function mint --module hello_world --package $PACKAGE_ID --gas-budget 300000000

# 详见 https://suiexplorer.com/txblock/GbxN3RCjzg43g8AnYDFKQnhMxNqAFnZ3QHjts18ayUum?network=devnet

```

### 2. 学习dapp

仓库: https://github.com/rickiey/sui-move-hw

```bash
 pnpm create @mysten/create-dapp

cd sui-dapp-hw;
pnpm i ;

# 工作环境切换至 xubuntu22.04 这一步没有遇到在 Arch 虚拟机里的问题
sui client publish --gas-budget 100000000 counter ;

# 见 https://suiexplorer.com/txblock/VHDEzBc2bvh7Bj5c4omVQZ8Vo9G5vmt7uhGzwVLrqDP?network=devnet

```

更改 src/constants.ts package id

> pnpm dev

浏览器导入钱包，与dapp交互

## 4 创建自己 ERC20 Token

+ 参考

> https://examples.sui-book.com/samples/coin.html
> https://intro-zh.sui-book.com/unit-three/lessons/4_the_coin_resource_and_create_currency.html

```bash
sui move new ft ;
cd ft;

# 创建并编辑 move 文件
...

# 编译 
sui move build ;
# 无报错后 publish
sui client publish --gas-budget 100000000

# 见 https://suiexplorer.com/txblock/BSnFUgytpk2L6yMGJ7HogxAmxZhoGBrFZyeE9B58b9va?network=devnet


```

package id: 0x6fc7461412bd79892455d909f1f4ab86a6d17b77d4b82405acfa1b305ce1c750
object id: 0xb3f33415ef6870de592d26d82070dfc7d69afdd989ef2be7603603099198f1d5

再次编辑文件，添加 mint burn方法

```rust
     /// Manager can mint new coins
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// Manager can burn coins
    public entry fun burn(treasury_cap: &mut TreasuryCap<MYCOIN>, coin: Coin<MYCOIN>) {
        coin::burn(treasury_cap, coin);
    }
```

 再次 publish

package id: 0x3d5fc3e0617e03460203644cb187906234768332505e4eff52da507758d8dbca
object id: 0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a

> sui client publish --gas-budget 100000000
见
> https://suiexplorer.com/txblock/B4kAw8GXuEEL14v5jvetBSN3L6GThLKbJgUcLuwqve2p?network=devnet

mint

> sui client call --gas-budget 300000000   --package 0x3d5fc3e0617e03460203644cb187906234768332505e4eff52da507758d8dbca --module mycoin   --function mint --args 0xe123b4ce839fd071a42292c0c481b0070181af835bf58bd6da3515395d7dd16c  666666666 0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a
见
> https://suiexplorer.com/txblock/VkqFqfmh5ik9tpZCewoCpqMwhZRfFaQSSje4wxLQ6mF?network=devnet

burn

> sui client call --gas-budget 300000000   --package 0x3d5fc3e0617e03460203644cb187906234768332505e4eff52da507758d8dbca --module mycoin   --function burn --args 0xe123b4ce839fd071a42292c0c481b0070181af835bf58bd6da3515395d7dd16c  0x180489aac0b2312a192e1cb61477d1b2f9200508b5213b24f6f2a58f53143229

见
> https://suiexplorer.com/txblock/JAf1gyQsKceZor5sCi3HCDS5qsB1cXW2K6xHe8MhBQ9o?network=devnet
