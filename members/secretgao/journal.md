# 学习日志
##  mac 系统 Sui 环境的安装  

1. 安装 Rust 和 Cargo和环境相关程序
```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   brew install curl cmake git
   rustup update stable
```

2. 安装 Sui && 升级更新Sui 也可以用同样命令
```bash
   cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
```

3. 启动sui client
   在上述的命令运行结束之后, 会安装好 sui / sui client 以及其他的一些 binary, 直接运行 `sui client`, 在 terminal 会输出如下的提示信息

   ```
   Config file ["/Users/xxx/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?
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
   Generated new keypair for address with scheme "ed25519" [0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a]
   ```

   创建好的钱包地址会在终端输出, 而私钥则被加密存储在 ~.sui/sui_config/sui.keystore 中, 可以通过 cat 命令来查看

4. 几个常用的 sui client 命令
   * 生成 address
   ```bash
   $ sui client new-address ed25519
   ╭────────────────────────────────────────────────────────────────────────────────────────────────╮
   │ Created new keypair and saved it to keystore.                                                  │
   ├────────────────┬───────────────────────────────────────────────────────────────────────────────┤
   │ address        │ 0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a            │
   │ keyScheme      │ ed25519                                                                       │
   │ recoveryPhrase │ xxx xxx xxx xxx xxx xxx xxx x x x x x │
   ╰────────────────┴───────────────────────────────────────────────────────────────────────────────╯
   ```
   * 查看地址
   ```
   $ sui client addresses
   ╭─────────────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
   │ alias               │ address                                                            │ active address │
   ├─────────────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
   │ wonderful-hiddenite │ 0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a │ *              │
   ╰─────────────────────┴────────────────────────────────────────────────────────────────────┴────────────────╯
   ```


* 查看地址和对应的私钥  

```
sui keytool list
```

* 用于获取到私钥的加密版本

```
 sui keytool convert 'private key base64 encoded' // 用于得到真正的私钥, 可以 import 到钱包里面
```

* 查看和切换当前地址

```
 sui client switch --address your_address // 切换到想要使用的 address
```

* 配置和切换当前的网络 （ Sui 的 RPC 结点可以在该链接找到 https://github.com/movefuns/awesome-sui#mainnet-rpc）
  
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

* 如果上述命令失败 可直接修改配置文件 (文件所在.sui/sui_config/client.yaml)

```
cat .sui/sui_config/client.yaml
---
keystore:
  File: /Users/xxx/.sui/sui_config/sui.keystore
envs:
  - alias: devnet
    rpc: "https://fullnode.devnet.sui.io:443"
    ws: ~
  - alias: testnet
    rpc: "https://funllnode.testnet.sui.io:433"
    ws: ~
active_env: devnet
active_address: "0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a"
```    

  
### sui 领水     
* cli 版本在1.18 以下
```
//postman 可用
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \ --header 'Content-Type: application/json' \ --data-raw '{"FixedAmountRequest":{"recipient":"0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a"}}'

//cli 可用 开发领水
curl --location --request POST 'https://faucet.devnet.sui.io/gas'  --header 'Content-Type: application/json'  --data-raw '{"FixedAmountRequest":{"recipient":"0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a"}}'
//测试领水 
curl --location --request POST 'https://faucet.testnet.sui.io/v1/gas'  --header 'Content-Type: application/json'  --data-raw '{"FixedAmountRequest":{"recipient":"0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a"}}'
```
* cli 版本在1.18 以上 
```
sui client faucet     //除了主网 其他网络都可以用
```


