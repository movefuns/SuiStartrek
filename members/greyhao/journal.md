# 学习日志

## 安装环境
这一步选择看官方文档进行操作。
使用的开发环境 Mac，很多依赖环境已经都有，比如 `brew`、`Rust`等。
选择了直接使用 `brew` 安装，安装命令：`brew install sui` 。

安装的过程很快，等安装完成，在命令行输入 `sui` 可以看到版本及命令介绍。

### 安装钱包
Chrome 安装 Sui Wallet

### Devnet 环境

相关配置文件所在目录：`~/.sui/sui_config/`

`# sui client envs` // 首次执行按提示输入：y 回车 0，可以看到给的测试钱包和助记词，再次输入同样命令可以看到如下输出
```
╭────────┬────────────────────────────────────┬────────╮
│ alias  │ url                                │ active │
├────────┼────────────────────────────────────┼────────┤
│ devnet │ https://fullnode.devnet.sui.io:443 │ *      │
╰────────┴────────────────────────────────────┴────────╯
```

### 获取 gas 并查询
获取 gas 方式：
* 加入 dc，在 #devnet-faucet 中发送：!faucet <上面拿到的地址>
* 使用命令领取：
  ```
  curl --location --request POST 'https://faucet.devnet.sui.io/gas' \                  
  --header 'Content-Type: application/json' \
  --data-raw '{"FixedAmountRequest":{"recipient":"0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157"}}'
  # 替换为实际地址
  ```

查询 gas：`# sui client gas`
```
[warn] Client/Server api version mismatch, client api version : 1.18.1, server api version : 1.19.0
╭────────────────────────────────────────────────────────────────────┬─────────────╮
│ gasCoinId                                                          │ gasBalance  │
├────────────────────────────────────────────────────────────────────┼─────────────┤
│ 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c │ 10000000000 │
╰────────────────────────────────────────────────────────────────────┴─────────────╯
```

## Move 智能合约

### 创建 move package

`# sui move new hello_world` 
执行成功会在当前目录下创建 hello_world，该目录中包含：
* `Move.toml`：定义合约信息及依赖
* `sources/`：源码文件所在目录

创建文件：`sources/hello_world.move`。


### 编译

首先进入项目目录，然后执行：
`# sui move build`

编译成功输出：
```
FETCHING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
```

当编译时出现这样的报错，终端开下代理就好了。
```
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
Failed to build Move modules: Failed to resolve dependencies for package 'hello_world'

Caused by:
    0: Fetching 'Sui'
    1: Failed to fetch to latest Git state for package 'Sui', to skip set --skip-fetch-latest-git-deps | Exit status: exit status: 128.
```

如果编写了测试用例，可以通过命令跑下用例：`# sui move test`。


### 部署合约

`# sui client publish --gas-budget 10000000`

成功部署输出内容：
```
[warn] Client/Server api version mismatch, client api version : 1.18.1, server api version : 1.19.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Successfully verified dependencies on-chain against source.
Transaction Digest: GU4NwnBbgerarcmbrHJK7nwkuDirhYndNsebKQLkFbJF
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                                   │
│ Gas Owner: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c                                    │
│  │ Version: 7                                                                                                │
│  │ Digest: ErHUtWVmy4FKXdDVQjekKzHJUi3Eh5NKwYeE2HBpkyGB                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    DgA84WW4UZURe/G76zH74liWvXuQf+c4bGrAbhVyiWadDuNAXZ2b4M1IIHXoq4e/MxUdYdXAZ1lG4QVE2LwyDg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GU4NwnBbgerarcmbrHJK7nwkuDirhYndNsebKQLkFbJF                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 622                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x409794dbf13cdbb128cdb7e4f2bd95490eca51df0ce1c4fc0d7aa46537bd2074                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ Version: 8                                                                                     │
│  │ Digest: EFM4WoXFiXb1cBJNVYknDAi4c1HjQP6J9MwsoKaKvndP                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc6fe3c902db2192bcf17fe56d0eea255129c6f7bc3999f85496e9811c32b1ebb                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5ywK8jA956ZTjxbNQv8bNzmtkLWK9FDwSBGrNYVqxruS                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ Version: 8                                                                                     │
│  │ Digest: 25pZgobST1ayK5Vo5p8XggoL8Nie3EeH3sMzC8gf4myt                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c                         │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ Version: 8                                                                                     │
│  │ Digest: 25pZgobST1ayK5Vo5p8XggoL8Nie3EeH3sMzC8gf4myt                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7957200                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    8MG4zm3CmbXmqKidxhTzBzEPYU2kZ2bvMMxvSvqoe2ZA                                                   │
│    G99qEEBjZRvnGTESxk6yPGEbZLFbygCYgpQHS5BcfqYB                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x409794dbf13cdbb128cdb7e4f2bd95490eca51df0ce1c4fc0d7aa46537bd2074                  │
│  │ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                    │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 8                                                                                    │
│  │ Digest: EFM4WoXFiXb1cBJNVYknDAi4c1HjQP6J9MwsoKaKvndP                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x33f1ac92e9ac367668f5818cb02cbc46cb36768638859d2cc8786b76173bef0c                  │
│  │ Sender: 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157                    │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 8                                                                                    │
│  │ Digest: 25pZgobST1ayK5Vo5p8XggoL8Nie3EeH3sMzC8gf4myt                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xc6fe3c902db2192bcf17fe56d0eea255129c6f7bc3999f85496e9811c32b1ebb                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 5ywK8jA956ZTjxbNQv8bNzmtkLWK9FDwSBGrNYVqxruS                                          │
│  │ Modules: hello_world                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xa7510465e7d6e8d1076497b2c9268f9069c8b6d75147dd95bd67e882a306b157 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7979080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

输出信息中可以看到 PackageID

### 调用已发布合约中的 mint 方法

`# sui client call --function mint --module hello_world --package 0xc6fe3c902db2192bcf17fe56d0eea255129c6f7bc3999f85496e9811c32b1ebb --gas-budget 10000000
` // --package 后面参数为：部署后拿到的 PackageID


