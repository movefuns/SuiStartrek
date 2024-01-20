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

## Roadmap 2

### 发布 NFT

主要实现 Display

```rust
let publisher = package::claim(otw, ctx);
let displ = display::new_with_fields<RK_NFT>(&publisher, keys, values, ctx);

display::update_version(&mut displ);
transfer::public_transfer(publisher, sender);
transfer::public_transfer(displ, sender);
transfer::share_object(TID{
    id:object::new(ctx),
    NextTID: 0,
})
```

以及几个更改的方法

```rust
public entry fun mint( tid: &mut TID, name: vector<u8>,description: vector<u8>,url: vector<u8>,ctx :&mut  TxContext);
public entry fun transfer(nft: RK_NFT, recipient: address, ctx: &mut TxContext);
public entry fun update_description(nft: &mut RK_NFT,new_description: vector<u8>,ctx: &mut TxContext ;
public entry fun update_image_url(nft: &mut RK_NFT,new_url: vector<u8>,ctx: &mut TxContext)
public entry fun burn(nft: RK_NFT, ctx: &TxContext) 
```

NFT 代码： [https://github.com/rickiey/sui-nft](https://github.com/rickiey/sui-nft)

* package id: [0xe7aaa9ebea93ea4be8acd7a2ad26016dad96abf3a453b5d239f13e37ef6f6f89](https://suiexplorer.com/object/0xe7aaa9ebea93ea4be8acd7a2ad26016dad96abf3a453b5d239f13e37ef6f6f89?module=rk&network=testnet)

* [发布的NFT https://suiexplorer.com/object/0xeeddf133c7ba0dd43bfff17c5e3b23e9a4d23bfa07c7def3b3aa8320bc83e610?network=testnet](https://suiexplorer.com/object/0xeeddf133c7ba0dd43bfff17c5e3b23e9a4d23bfa07c7def3b3aa8320bc83e610?network=testnet)

### move 游戏

猜骰子游戏

输入一个数字(u64,会mod 6),和合约产生的随机数 1-6对比，有日志查看过程,猜中带走资金池一半资金(SUI), 猜中不亏资金池1/4的SUI,亏损的资金添加到资金池.

实现代码: [https://github.com/rickiey/sui-move-game](https://github.com/rickiey/sui-move-game)

警告：不要部署到主网，会亏SUI，第一次再测试网部署没有提取资金池方法，导致测试币提不出来，随后添加提币方法，一次提取一半;

[package-id: https://suiexplorer.com/object/0xaa4f028d857942194f4d9d206e81a55925b9ca619657e6e8de8dae94222a5fcf?network=testnet](https://suiexplorer.com/object/0xaa4f028d857942194f4d9d206e81a55925b9ca619657e6e8de8dae94222a5fcf?network=testnet)

