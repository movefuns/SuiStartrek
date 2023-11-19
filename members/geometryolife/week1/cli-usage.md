# Sui CLI 用法

在 Powershell 命令行使用 `sui` 或 `sui -h` 会打印 `sui.exe` 程序的概述和基本的帮助信息：

```powershell
PS C:\Users\Joe> sui

A Byzantine fault tolerant chain with low-latency finality and high throughput

Usage: sui.exe <COMMAND>

Commands:
  start             Start sui network
  network
  genesis           Bootstrap and initialize a new sui network
  genesis-ceremony
  keytool           Sui keystore tool
  console           Start Sui interactive console
  client            Client for interacting with the Sui network
  validator         A tool for validators and validator candidates
  move              Tool to build and test Move applications
  fire-drill        Tool for Fire Drill
  help              Print this message or the help of the given subcommand(s)

Options:
  -h, --help     Print help
  -V, --version  Print version
```

## Sui 客户端

这一节主要是介绍 `sui client` 命令，它是用户跟 Sui 网络交互的 CLI 客户端。

第一次执行 `sui client` 时，如果没有 Sui 的配置文件，会提示你生成配置文件：

```powershell
PS C:\Users\Joe> sui client

Config file ["C:\\Users\\Joe\\.sui\\sui_config\\client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?y
Sui Full node server URL (Defaults to Sui Devnet if not specified) :
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2: for secp256r1):
0
Generated new keypair for address with scheme "ed25519" [0x5009801722ade1e1c2edf1e37e748732442d9b50578d4efa2bee009ce6ebf44c]
Secret Recovery Phrase : [property cereal stem rich suggest flat artist armor romance chaos knife menu]
```

第一个问题提示你填写 Sui 全节点的 URL，默认是 `Sui Devnet`（开发网），也可以填写其他网络节点，比如`主网`或`测试网`，回车选择默认的即可。第二个问题让你选择生成`密钥对`的方案，我选择 `0`。

之后会生成一个 Sui 账户，会列出地址和私钥的助记词。

> 注意保管好你的私钥助记词，我这里生成的账户只是为了测试！

### sui client addresses

列出 Sui 客户端管理的地址，`activeAddress` 是当前激活的地址（在很多命令中不指定地址，会自动将它作为默认地址），`addresses` 是当前客户端管理的所以地址的列表：

```powershell
PS C:\Users\Joe> sui client addresses

╭───────────────┬──────────────────────────────────────────────────────────────────────────╮
│ activeAddress │  0x5009801722ade1e1c2edf1e37e748732442d9b50578d4efa2bee009ce6ebf44c      │
│ addresses     │ ╭──────────────────────────────────────────────────────────────────────╮ │
│               │ │  0x5009801722ade1e1c2edf1e37e748732442d9b50578d4efa2bee009ce6ebf44c  │ │
│               │ ╰──────────────────────────────────────────────────────────────────────╯ │
╰───────────────┴──────────────────────────────────────────────────────────────────────────╯
```

### sui client envs

列出所有的 Sui 环境。

列表包含`网络别名`、`网络 URL`、`激活的网络`（用 `*` 标识）。

### sui client new-env

添加网络，有两个必须指定的选项，`--alias` 指定要添加的网络别名（随意取），`--rpc` 指定网络的 RPC 节点 URL，接下来演示添加 `testnet` 和 `mainnet`。

```powershell
# Sui 测试网
PS C:\Users\Joe> sui client new-env --alias testnet --rpc https://fullnode.
testnet.sui.io:443

Added new Sui env [testnet] to config.

# Sui 主网
PS C:\Users\Joe> sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443

Added new Sui env [mainnet] to config.
```

更多的 Sui RPC 节点 URL 请参阅 [https://github.com/movefuns/awesome-sui#rpc](https://github.com/movefuns/awesome-sui#rpc)

查看已添加的网络：

```powershell
PS C:\Users\Joe> sui client envs

╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443  │ *      │
│ testnet │ https://fullnode.testnet.sui.io:443 │        │
│ mainnet │ https://fullnode.mainnet.sui.io:443 │        │
╰─────────┴─────────────────────────────────────┴────────╯
```

### sui client switch

这个命令可以用来切换地址和默认的网络环境，尝试从 `devnet` 切换到 `testnet`。

```powershell
PS C:\Users\Joe> sui client switch --env testnet

Active environment switched to [testnet]

PS C:\Users\Joe> sui client envs
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443  │        │
│ testnet │ https://fullnode.testnet.sui.io:443 │ *      │
│ mainnet │ https://fullnode.mainnet.sui.io:443 │        │
╰─────────┴─────────────────────────────────────┴────────╯
```

### sui client gas

获取当前地址的 gas 对象，Sui 的 gas 代码符号是 `SUI`。

```powershell
PS C:\Users\Joe> sui client gas

[warn] Client/Server api version mismatch, client api version : 1.15.0, server api version : 1.14.1
No gas coins are owned by this address
```

当前我的账户地址还没有 gas，我们可以使用 `curl.exe` 程序来向 Sui 的测试网节点发送获取测试代币的请求，也可以在 Sui 的 Discord 的 faucet 频道获取 gas。

可以使用 `sui-faucet` 来简化获取测试币 RPC 请求，详细代码请参阅 [https://github.com/uvd/sui-faucet](https://github.com/uvd/sui-faucet)。

使用 `curl.exe http://getsui.com/<ADDRESS>` 即可获取一枚测试网上的 SUI 代币：

```powershell
PS C:\Users\Joe> curl.exe http://getsui.com/0x5009801722ade1e1c2edf1e37e748732442d9b50578d4efa2bee009ce6ebf44c

send  0x5009801722ade1e1c2edf1e37e748732442d9b50578d4efa2bee009ce6ebf44c  1 SUI
```

再次查看 gas，目前已经有 1 SUI 了：

```powershell
PS C:\Users\Joe> sui client gas

[warn] Client/Server api version mismatch, client api version : 1.15.0, server api version : 1.14.1
╭────────────────────────────────────────────────────────────────────┬────────────╮
│ gasCoinId                                                          │ gasBalance │
├────────────────────────────────────────────────────────────────────┼────────────┤
│ 0xb3392173fbaed782eade79b8aef5c93fc3746cc25f16e6f4deb7f7403dae29f4 │ 1000000000 │
╰────────────────────────────────────────────────────────────────────┴────────────╯
```