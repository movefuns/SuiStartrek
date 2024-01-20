# 学习日志

## Sui 环境的安装

macOS Sonoma 14.1.1

1. 安装 Rust 和 Cargo 和环境相关程序

   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   brew install curl cmake git
   ```

2. update Rust

   ```bash
   rustup update stable
   info: syncing channel updates for 'stable-aarch64-apple-darwin'
    stable-aarch64-apple-darwin unchanged - rustc 1.74.0 (79e9716c9 2023-11-13)

    info: checking for self-update
    ````

3. 安装 Sui
```bash
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
````

4. 启动 sui client
   在上述的命令运行结束之后, 会安装好 sui / sui client 以及其他的一些 binary, 直接运行 `sui client`, 在 terminal 会输出如下的提示信息

   ```
   Config file ["/Users/metaverse/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?
   ```

   提示是否要加入 Sui 的网络, 输入 y, 同意加入

   ```
   Sui Full node server URL (Defaults to Sui Devnet if not specified)
   ```

   直接回车, 会直接连接到 sui 的开发网 devnet

   ```
   Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2: for secp256r1)
   ```

   ```
   Generated new keypair for address with scheme "ed25519" [0x7163b1da1f21ee1af548e01d8d561666206db3d597de6b200e2a2a583b3eebc8]
   ```

5. 几个常用的 sui client 命令

   生成 address

   ```bash
   $ sui client new-address ed25519
   ╭────────────────────────────────────────────────────────────────────────────────────────────╮
│ Created new keypair and saved it to keystore.                                              │
├────────────────┬───────────────────────────────────────────────────────────────────────────┤
│ address        │ 0x54fac11c72b0683a6f3dc13d2231f8855f08f6664237a1be931400d3c5e7f1be        │
│ keyScheme      │ ed25519                                                                   │
│ recoveryPhrase │ *** │
╰────────────────┴───────────────────────────────────────────────────────────────────────────╯
   ```

   查看地址以及地址的私钥

   ```
   $ sui client addresses
╭───────────────┬──────────────────────────────────────────────────────────────────────────╮
│ activeAddress │  0x7163b1da1f21ee1af548e01d8d561666206db3d597de6b200e2a2a583b3eebc8      │
│ addresses     │ ╭──────────────────────────────────────────────────────────────────────╮ │
│               │ │  0x54fac11c72b0683a6f3dc13d2231f8855f08f6664237a1be931400d3c5e7f1be  │ │
│               │ │  0x7163b1da1f21ee1af548e01d8d561666206db3d597de6b200e2a2a583b3eebc8  │ │
│               │ ╰──────────────────────────────────────────────────────────────────────╯ │
╰───────────────┴──────────────────────────────────────────────────────────────────────────╯
   $ sui keytool list // 用于获取到私钥的加密版本
   $ sui keytool convert 'private key base64 encoded' // 用于得到真正的私钥, 可以 
   ```
   配置和切换当前的网络

   ```
   $ sui client new-env --alias 'mainnet' --rpc 'https://sui-mainnet.nodeinfra.com:443'
   $ sui client new-env --alias 'testnet' --rpc 'https://fullnode.testnet.sui.io:443'
   $ sui client new-env --alias 'localnet' --rpc 'http://127.0.0.1:9000'
   $ sui client switch --envs testnet // 切换到测试网络
   $ sui client envs // 查看所有可以切换的网络
   ╭─────────┬───────────────────────────────────────┬────────╮
   │ alias   │ url                                   │ active │
   ├─────────┼───────────────────────────────────────┼────────┤
   │ devnet  │ https://fullnode.devnet.sui.io:443    │        │
   │ testnet │ https://fullnode.testnet.sui.io:443   │ *      │
   │ mainnet │ https://sui-mainnet.nodeinfra.com:443 │        │
   ╰─────────┴───────────────────────────────────────┴────────╯
   ```

   领取 gas

   ```
   $ curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
   --header 'Content-Type: application/json' \
   --data-raw '{
       "FixedAmountRequest": {
           "recipient": "<YOUR SUI ADDRESS>"
       }
   }'
   ```

   创建新的 module

   ```
   sui move new hello_world
   ```

   创建后会在当前的目录创建 Move.toml, source 两个文件夹, 后续的开发都可以写在 source 目录下面

   build module

   ```
   sui move build
   ```
    This warning can be suppressed with '#[lint_allow(self_transfer)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

   发布/部署 module

   ```
   sui client publish --gas-budget 100000000
   ```

## 问题记录

TODO:

1. sui 代币与 nft 有什么本质区别?
