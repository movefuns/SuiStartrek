# 学习日志
## Sui 环境的安装

1. 安装 Rust 和 Cargo和环境相关程序
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   brew install curl cmake git
   ```

2. update Rust
   ```bash
   rustup update stable
   ```

3. 安装 Sui
   ```bash
   cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
   ```

4. 启动sui client
   在上述的命令运行结束之后, 会安装好 sui / sui client 以及其他的一些 binary, 直接运行 `sui client`, 在 terminal 会输出如下的提示信息

   ```
   Config file ["/Users/xinyuyang/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?
   ```

   提示是否要加入 Sui 的网络, 输入 y, 同意加入
   ```
   Sui Full node server URL (Defaults to Sui Devnet if not specified) 
   ```

   直接回车, 会直接连接到 sui 的开发网 devnet
   ```
   Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2: for secp256r1)
   ```

   接下来会提示创建钱包相关的信息, 这里建议选择0, 因为如果使用secp256k1则无法被官方钱包Sui wallet支持, 选择 ed25519 之后在导入到 Sui wallet 的时候会有更好的兼容性, 否则无法顺利导入地址到钱包。
   ```
   Generated new keypair for address with scheme "ed25519" [0xbe21b2b5cdae552c1ef448a14bce20bab39613207bf48f528a05842c53fc75b0]
   ```

   创建好的钱包地址会在终端输出, 而私钥则被加密存储在 home/.sui/sui_config/sui.keystore 中, 可以通过 cat 命令来查看

5. 几个常用的 sui client 命令

   生成 address
   ```bash
   $ sui client new-address ed25519
   ╭────────────────────────────────────────────────────────────────────────────────────────────────╮
   │ Created new keypair and saved it to keystore.                                                  │
   ├────────────────┬───────────────────────────────────────────────────────────────────────────────┤
   │ address        │ 0x96692dee733b758fe084646caac90746c3040d1cf5a6b46444185e9fe1684dd8            │
   │ keyScheme      │ ed25519                                                                       │
   │ recoveryPhrase │ xxx xxx xxx xxx xxx xxx xxx x x x x x │
   ╰────────────────┴───────────────────────────────────────────────────────────────────────────────╯
   ```

   查看地址以及地址的私钥
   ```
   $ sui client addresses
   ╭───────────────┬──────────────────────────────────────────────────────────────────────────╮
   │ activeAddress │  0xbe21b2b5cdae552c1ef448a14bce20bab39613207bf48f528a05842c53fc75b0      │
   │ addresses     │ ╭──────────────────────────────────────────────────────────────────────╮ │
   │               │ │  0x96692dee733b758fe084646caac90746c3040d1cf5a6b46444185e9fe1684dd8  │ │
   │               │ │  0xbe21b2b5cdae552c1ef448a14bce20bab39613207bf48f528a05842c53fc75b0  │ │
   │               │ ╰──────────────────────────────────────────────────────────────────────╯ │
   ╰───────────────┴──────────────────────────────────────────────────────────────────────────╯
   $ sui keytool list // 用于获取到私钥的加密版本
   $ sui keytool convert 'private key base64 encoded' // 用于得到真正的私钥, 可以 import 到钱包里面
   ```

   查看和切换当前地址

   上述两个命令都可以看到当前 sui client 的地址，如果需要切换地址可以用下述命令

   ```
   $ sui client switch --address your_address // 切换到想要使用的 address
   ```

   配置和切换当前的网络

   ```
   $ sui client new-env --alias 'mainnet' --rpc 'https://sui-mainnet.nodeinfra.com:443'
   $ sui client new-env --alias 'testnet' --rpc 'https://fullnode.testnet.sui.io:443'
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

   Sui 的 RPC 结点可以在该链接找到 https://github.com/movefuns/awesome-sui#mainnet-rpc

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
   $ sui move new my_first_package
   ```

   创建后会在当前的目录创建Move.toml, source 两个文件夹, 后续的开发都可以写在 source 目录下面

   build module

   ```
   sui move build
   ```

   发布/部署 module

   ```
   $ sui client publish --gas-budget 100000000
   ```

## 问题记录
TODO:
1. 如何启动Sui localnet
2. ```sui client publish``` 的时候网络不通, 无法fetch到依赖包
4. sui生态系统中package / module的概念应该如何理解?