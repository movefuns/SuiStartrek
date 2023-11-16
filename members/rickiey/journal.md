# 学习日志

### 1 安装环境 (Arch linux)

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

### 2 配置sui

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

### 创建 hello 模块

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
sui client publish --skip-fetch-latest-git-deps --skip-dependency-verification  --gas-budget 3000000000

$ sui client publish --skip-fetch-latest-git-deps --skip-dependency-verification  --gas-budget 3000000000                                                                                                                                       
                                                                                                                                                                                                                                                
INCLUDING DEPENDENCY Sui                                                                                                                                                                                                                        
INCLUDING DEPENDENCY MoveStdlib                                                                                                                                                                                                                 
BUILDING sui_move_start                                                                                                                                                                                                                         
Total number of linter warnings suppressed: 1 (filtered categories: 1)                                                                                                                                                                          
Skipping dependency verification                                                                                                                                                                                                                
----- Transaction Digest ----                                                                                                                                                                                                                   
GG7e8TjMyt5A4k9gw7zmVfNp4T77seSv2L19oyR4CxvG                                                                                                                                                                                                    
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮                                                                                 
│ Transaction Data                                                                                                                                            │                                                                                 
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤                                                                                 
│ Sender: 0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a                                                                                  │                                                                                 
│ Gas Owner: 0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a                                                                               │                                                                                 
│ Gas Budget: 3000000000                                                                                                                                      │                                                                                 
│ Gas Price: 1000                                                                                                                                             │                                                                                 
│ Gas Payment:                                                                                                                                                │                                                                                 
│  ┌──                                                                                                                                                        │                                                                                 
│  │ ID: 0x0fdf54b59043ef81b721134b62cc24a93dca20a691deff7efd07722c38ad3c6d                                                                                   │                                                                                 
│  │ Version: 10                                                                                                                                              │                                                                                 
│  │ Digest: 9oVKgJbyzND4jejimb864fU6o1oNzb8v3dPoAbRW6zxy                                                                                                     │                                                                                 
│  └──                                                                                                                                                        │                                                                                 
│                                                                                                                                                             │                                       
│ Transaction Kind : Programmable                                                                                                                             │                                       
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a" })]                     │                                       
│ Commands: [                                                                                                                                                 │                                       
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │                                       
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │                                       
│ ]                                                                                                                                                           │                                       
│                                                                                                                                                             │                                       
│                                                                                                                                                             │                                       
│ Signatures:                                                                                                                                                 │                                       
│    /2WMCZ+c0PO00BfqXgMnBe7jq9XpxAapbroDSG/kYN21NpCNgd0AuFkHcoVk2lKXkGQ0aYzJ2rmvGn34IOxvBA==                                                                 │                                       
│                                                                                                                                                             │                                       
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯             
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮                                                                                                                                           
│ Transaction Effects                                                                               │                                                                                                                                           
├───────────────────────────────────────────────────────────────────────────────────────────────────┤                                                                                                                                           
│ Digest: GG7e8TjMyt5A4k9gw7zmVfNp4T77seSv2L19oyR4CxvG                                              │                                                                                                                                           
│ Status: Success                                                                                   │                                                                                                                                           
│ Executed Epoch: 0                                                                                 │                                                                                                                                           
│                                                                                                   │                                                                                                                                           
│ Created Objects:                                                                                  │                                                                                                                                           
│  ┌──                                                                                              │                                                                                                                                           
│  │ ID: 0x03d9bf1c531b1624be013a9b6e74571e23692bfbebb5c04ff133203a2e9a6447                         │                                                                                                                                           
│  │ Owner: Immutable                                                                               │                                                                                                                                           
│  │ Version: 1                                                                                     │                                                                                                                                           
│  │ Digest: HbVRjoMXd8P5M7GTheHGq98pTmwuF6ENXTuSZbDyjH7o                                           │                                                                                                                                           
│  └──                                                                                              │                                                                                                                                           
│  ┌──                                                                                              │                                                                                                                                           
│  │ ID: 0x45069b1f8998eea42559b20b27c00034f091b7eaa9925c6f6edf8719cb976e59                         │                                                                                                                                           
│  │ Owner: Account Address ( 0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a )  │                                                                                                                                           
│  │ Version: 11                                                                                    │                                                                                                                                           
│  │ Digest: HwHD27EuAwSnYaEtTtToM7AvyvTptAYopd1oeWRCu7Eu                                           │                                                                                                                                           
│  └──                                                                                              │                                                                                                                                           
│                                                                                                   │                                                                                                                                           
│ Mutated Objects:                                                                                  │                                                                                                                                           
│  ┌──                                                                                              │                                                                                                                                           
│  │ ID: 0x0fdf54b59043ef81b721134b62cc24a93dca20a691deff7efd07722c38ad3c6d                         │                                                                                                                                           
│  │ Owner: Account Address ( 0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a )  │                                                                                                                                           
│  │ Version: 11                                                                                    │                                                                                                                                           
│  │ Digest: CC4pKizcgtM6jHm8GVQnYJ24uYwuL5kSahnxGdY42jBx                                           │                                                                                                                                           
│  └──                                                                                              │                                                                                                                                           
│                                                                                                   │                                                                                                                                           
│ Gas Object:                                                                                       │                                                                                                                                           
│  ┌──                                                                                              │                                                                                                                                           
│  │ ID: 0x0fdf54b59043ef81b721134b62cc24a93dca20a691deff7efd07722c38ad3c6d                         │                                                                                                                                           
│  │ Owner: Account Address ( 0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a )  │                                                                                                                                           
│  │ Version: 11                                                                                    │                                                                                                                                           
│  │ Digest: CC4pKizcgtM6jHm8GVQnYJ24uYwuL5kSahnxGdY42jBx                                           │                                                                                                                                           
│  └──                                                                                              │                                                                                                                                           
│                                                                                                   │                                                                                                                                           
│ Gas Cost Summary:                                                                                 │                                                                                                                                           
│    Storage Cost: 7972400                                                                          │                                                                                                                                           
│    Computation Cost: 1000000                                                                      │                                                                                                                                           
│    Storage Rebate: 978120                                                                         │                                                                                                                                           
│    Non-refundable Storage Fee: 9880                                                               │                                                                                                                                           
│                                                                                                   │                                                                                                                                           
│ Transaction Dependencies:                                                                         │                                                                                                                                           
│    C9qLRxbSkpveKzJffpaTy5P7f6BJWymShMfEF12pGNYZ                                                   │      │    HUKvecodFjttC4143fQ7LKpCNEwswvq8QyLJHiN8bJBg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects: 
 ┌──
 │ ObjectID: 0x45069b1f8998eea42559b20b27c00034f091b7eaa9925c6f6edf8719cb976e59
 │ Sender: 0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a 
 │ Owner: Account Address ( 0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a )
 │ ObjectType: 0x2::package::UpgradeCap 
 │ Version: 11
 │ Digest: HwHD27EuAwSnYaEtTtToM7AvyvTptAYopd1oeWRCu7Eu
 └──

Mutated Objects: 
 ┌──
 │ ObjectID: 0x0fdf54b59043ef81b721134b62cc24a93dca20a691deff7efd07722c38ad3c6d
 │ Sender: 0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a 
 │ Owner: Account Address ( 0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> 
 │ Version: 11
 │ Digest: CC4pKizcgtM6jHm8GVQnYJ24uYwuL5kSahnxGdY42jBx
 └──

Published Objects: 
 ┌──
 │ PackageID: 0x03d9bf1c531b1624be013a9b6e74571e23692bfbebb5c04ff133203a2e9a6447 
 │ Version: 1 
 │ Digest: HbVRjoMXd8P5M7GTheHGq98pTmwuF6ENXTuSZbDyjH7o
 | Modules: hello_world
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xc6e7d97fc313de140b159e7ccf7b7479780ae704763fd4957c7fecbb7de9a89a ) 
 │ CoinType: 0x2::sui::SUI 
 │ Amount: -7994280
 └──                                                                             
```

```bash
export PACKAGE_ID=0x03d9bf1c531b1624be013a9b6e74571e23692bfbebb5c04ff133203a2e9a6447
sui client call --function mint --module hello_world --package $PACKAGE_ID --gas-budget 300000000

```