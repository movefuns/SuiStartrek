# 学习日志

## 1.1  安装Move 开发环境
1. 安装Rust  
    * `sudo apt-get install curl`  安装Curl,使用'curl --version' 测试curl是否安装
    * ` curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh `  
    * ` source "$HOME/.cargo/env" `    配置环境变量
    * ` rustup update stable `    更新Rust
    * [Rustup配置国内清华镜像源](https://mirrors.tuna.tsinghua.edu.cn/help/rustup/)
2. 安装依赖项  
    * `sudo apt-get update`    更新Ubuntu系统的软件包列表
    * `sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential`    安装依赖项
3. 安装Sui环境  
    * `cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui `    在~/.cargo/bin目录下安装Sui Testnet
    * `which sui`    测试Sui是否安装
    * 更新Sui Testnet 与 安装Sui Testnet命令相同
4. 配置Vscode插件（Move Analyzer） 
    * [Move Analyzer](https://marketplace.visualstudio.com/items?itemName=move.move-analyzer)    
      - `move-analyzer --version` 查询是否安装成功
      - Vscode move-analyzer的Extension Settings 配置安装路径 /usr/bin/move-analyze
    * ` cargo install --git https://github.com/move-language/move move-analyzer --branch sui-move --features "address32" `  
5. Homebrew安装Sui
    * `brew tap mystenlabs/tap`
    * `brew install mystenlabs/tap/sui `
6. 源文件安装Sui
    * `git clone https://github.com/MystenLabs/sui.git `

7. 配置Sui 网络
    * [Testnet Full Node RPC](https://fullnode.testnet.sui.io:443)
    * [Sui Testnet Explorer](https://suiexplorer.com/?network=testnet)
    * `sui client`    首次启动会生成一个Sui 客户端配置文件（client.yaml），需要配置Sui Full node server URL、Environment alias、key    
      - 首次启动会生成一个Sui 客户端配置文件（client.yaml），需要设置Sui Full node server URL、Environment alias、key
    * `sui client envs` 检查当前可用的环境名
    * `sui client new-env --alias <ALIAS> --rpc <RPC-SERVER-URL>` 添加自定义RPC
    * `sui client switch --env <ALIAS> `  切换环境
    * Sui 本地网络  
      - `RUST_LOG="off,sui_node=info" cargo run --bin sui-test-validator`  RUST_LOG="off,sui_node=info"的作用是只显示sui_node=info的日志  
      - `sui client new-env --alias local --rpc http://127.0.0.1:9000`  添加本地网络  
    * Sui 主网
      - `sui client new-env --alias mainnet --rpc https://sui-mainnet.nodeinfra.com:443`
      - `sui client switch --env mainnet` 切换到主网

## 1.2  安装web3钱包
1. [Sui Wallet](https://chromewebstore.google.com/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil)
    * 安装pnpm
        ```
        # bash
        wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -
        # sh
        wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.shrc" SHELL="$(which sh)" sh -
        # dash
        wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.dashrc" SHELL="$(which dash)" dash -
        ```
      > `pnpm --version `  
      > `pnpm install ` 安装依赖  
      > `pnpm turbo build ` 安装Sui Wallet和Sui Explorer  
    * 私钥地址保存在“~/.sui/sui_config/sui.keystore”
    * 获取Sui代币
      > cURL申请
        ```
          curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
          --header 'Content-Type: application/json' \
          --data-raw '{
          "FixedAmountRequest": {
            "recipient": "<YOUR SUI ADDRESS>"
            }
          }'
        ```
      > TypeScript-SDK
        ```
          import { requestSuiFromFaucetV0, getFaucetHost } from '@mysten/sui.js/faucet';
          // get tokens from the Testnet faucet server
          await requestSuiFromFaucetV0({
          host: getFaucetHost('testnet'),
          recipient: '<YOUR SUI ADDRESS>',
          });
        ```


## 1.3  熟悉区块链浏览器
1. https://suiexplorer.com/
2. https://suivision.xyz/  


## 1.4  前端方向的 Hello world
1. 初始化dapp
   * `pnpm create @mysten/dapp`
   * `pnpm install ` 安装依赖  
2. 构建项目
   * `pnpm build `


## 1.5  学习ERC20
1. 发行NFT  
   * `sui move new <PACKAGE NAME>`  新建一个sui项目，生成sources目录和move.toml配置文件  
   ```
   module examples::devnet_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// 一个允许任何人铸造NFT的示例
    /// An example NFT that can be minted by anybody
    struct DevNetNFT has key, store {
        id: UID,
        /// Name for the token 代币（NFT）名
        name: string::String,
        /// Description of the token 代币（NFT）描述
        description: string::String,
        /// URL for the token 代币（NFT）链接
        url: Url,
        // TODO: allow custom attributes 
    }

    // ===== Events ===== 事件

    struct NFTMinted has copy, drop {
        // The Object ID of the NFT 新铸造的NFT的ID
        object_id: ID,
        // The creator of the NFT 新铸造的NFT的创造者
        creator: address,
        // The name of the NFT 新铸造的NFT的名
        name: string::String,
    }

    // ===== Public view functions ===== 公共视图函数

    /// 获取NFT的名称
    /// Get the NFT's `name` 
    public fun name(nft: &DevNetNFT): &string::String {
        &nft.name
    }

    /// 获取NFT的介绍
    /// Get the NFT's `description`
    public fun description(nft: &DevNetNFT): &string::String {
        &nft.description
    }

    /// 获取NFT的链接
    /// Get the NFT's `url`
    public fun url(nft: &DevNetNFT): &Url {
        &nft.url
    }

    // ===== Entrypoints ===== 入口函数

    /// 创建新的NFT
    /// Create a new devnet_nft
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = DevNetNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// 转移NFT给新的所有者
    /// Transfer `nft` to `recipient`
    public entry fun transfer(
        nft: DevNetNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// 更新NFT的介绍
    /// Update the `description` of `nft` to `new_description`
    public entry fun update_description(
        nft: &mut DevNetNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// 永久删除NFT
    /// Permanently delete `nft`
    public entry fun burn(nft: DevNetNFT, _: &mut TxContext) {
        let DevNetNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }
   }  
   ```
   * `sui client call --function mint_to_sender --module devnet_nft --package <PACKAGE-ID> --args <name> <description> <url> --gas-budget <GAS-AMOUNT>`    NFT图片建议是700*700
2. 发行ERC20
   ```
   module examples::mycoin {
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
         let (treasury, metadata) = coin::create_currency(witness, 6, b"MYCOIN", b"",b"", option::none(), ctx);
         transfer::public_freeze_object(metadata);
         transfer::public_transfer(treasury, tx_context::sender(ctx))
     }
   }
   ```
   * `sui move build` 编译合约
   * `sui client call --function mint --module mycoin --package <PACKAGE-ID> --args <TREASURY-CAP-ID> <COIN-AMOUNT> <RECIPIENT-ADDRESS> --gas-budget <GAS-AMOUNT>`


## 1.6  完成ERC20的发布
1. 部署合约
   * `sui client publish --path <absolute local path to the Sui Move package> --gas-budget 3000000000` 
     - `sui client publish --gas-budget 3000`
     - `sui client publish --gas-budget 20000000  --skip-fetch-latest-git-deps`  再次部署需要添加“--skip-fetch-latest-git-deps”
2. 调用合约函数
   * `sui client call --function mint --module hello_world --package $PACKAGE_ID --gas-budget 300000000 `    调用合约中mint函数 
     - `sui client call --function mint --module hello --package 0x88762f82e36724b189a95a4ab2b4134be373a78a7d5fd095c6d0b801e6fa1111 --gas-budget 20000000 ` 

