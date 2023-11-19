# Week1

## Sui wallet

*   安装 sui wallet chrome 插件
*   安装 Ethos Sui Wallet APP

## 安装 Sui cli

- https://docs.sui.io/guides/developer/getting-started/sui-install

## sui client 常用命令

- 添加新的 sui 环境：`sui client new-env --alias=mainnet --rpc https://fullnode.mainnet.sui.io:443`  
- 查看和钱包相关的 object：`sui client objects <钱包地址>`
- 查看gas：`sui client gas`
- 切换网络：`sui client switch --env <network name>`
- 默认地址（未指定时）：`sui client active address`
- 发布合约到 sui 网络上：`sui client publish --gas-budget 100000000`

## 安装 move 开发环境

*   [Sui Documentation](https://docs.sui.io/guides/developer/getting-started/sui-install#prerequisites)

*   在 vscode 中安装 move-analyzer 插件

*   给 move-analyzer 插件提供 path：

## 熟悉区块链浏览器

*   <https://suiexplorer.com/>  (支持的网络更多)

*   <https://suivision.xyz/>

## 学习 ERC20

*   [token 合约](https://sui-book.com/framework/02.coin.html)
*   [例子](https://examples.sui-book.com/samples/coin.html)

## helloworld 合约

*   初始化一个 Sui Move Package

    *   `sui move new hello_world`

*   完成 helloworld 合约代码

    * 在 sources 文件夹中新建 .move 后缀的文件 `hello_world.move`
    
      ```rust
      module sui_hello_world::hello_world {
          use std::string;
          use sui::object::{Self, UID};
          use sui::transfer;
          use sui::tx_context::{Self, TxContext};
      
          // An object that contains an arbitrary string
          struct HelloWorldObject has key, store {
              id: UID,
              /// A string contained in the object
              text: string::String
          }
      
          public entry fun mint(ctx: &mut TxContext) {
              let object = HelloWorldObject {
                  id: object::new(ctx),
                  text: string::utf8(b"Hello World!")
              };
              transfer::public_transfer(object, tx_context::sender(ctx));
          }
      }
      ```
    
      - 代码中的重点：
        - mint： 铸币
        - burning：销毁
        - struct 的名字与模块名字统一，因为最后的 type 是这样的：`Coin<package_object::mycoin::MYCOIN>`

*   编译 helloworld 合约

    *   `sui move build`

*   使用 Sui CLI 将 package 部署到 Sui 网络，选择 devnet 开发网

    *   `sui client publish --gas-budget 10000000`

    *   export PACKAGE\_ID=<在先前输出信息中的 package object ID>

*   在交易中调用 mint 函数

    *   `sui client call --function mint --module hello_world --package $PACKAGE_ID --gas-budget 10000000`

*   使用 Sui Explorer 查看交易

    *   <https://suiexplorer.com/>

    *   右上角选择 devnet/testnet 网络

    *   在搜索框中输入 object ID

## 发布 ERC20 合约

- 和上面一样，初始化一个 package：erc20

  - `sui move new sui_erc20`

- 完成合约代码

  - 在 sources 目录下新建一个 `erc20.move` 文件

  - ```rust
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

- 发布合约到 sui testnet 网络：`sui client publish --gas-budget 10000000`
  - 执行命令之后会有输出，第一个 Created Objects 下面的 ID 就是 erc20 代币的交易详情（Object）
- 复制上面这个 ID 可以在 Sui Explorer 中的 testnet 网络中搜索到
  - `0x4ea4db7e53dfa6cf86c46c577ff4c7a0115896d9c48b6ef323bcc7bdfa26b067`

