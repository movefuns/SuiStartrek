# 学习日志

## Learn-001: Sui Start

> At 2024.02.02

### 投石问路 Glance of Sui

Move出来有一阵了，23年听说过Aptos和Sui；正好当下工作接触到Aptos，就顺带学习下Sui+Move。

[Sui](sui.io) 开发环境一览，对于rust和node使用者相对友好？

**[Sui Doc](https://docs.sui.io)**
- Sui API
  - [JSON-RPC](https://docs.sui.io/references/sui-api)
  - [Graphql](https://docs.sui.io/references/sui-graphql)
- [Sui Cli](https://github.com/MystenLabs/sui)
- Sui SDK
  - [typescript](https://sdk.mystenlabs.com/typescript)
  - [rust](https://github.com/MystenLabs/sui/tree/main/crates/sui-sdk)
- [Sui Framework](https://github.com/MystenLabs/sui/tree/main/crates/sui-framework/docs)


### 初入山门 What's Sui

- What's Startrek
- What's Sui
- What's Move

| 模块 | 主题 | 讲师 | 组织 | 链接 |
| ---- | ---- | ---- | ---- | ---- |
| Workshop | 开营仪式 | Xuan | MoveFuns DAO | [点击观看](https://www.youtube.com/embed/UxBAIr6d2-8?si=5XqVmzwKynWstX_0) |
| Workshop | 什么是Move | UVD | MoveFuns DAO | [点击观看](https://www.youtube.com/embed/VJweQrWJCxM?si=IaWbfetsZ7ZxkWPP) |
| Workshop | Move object & 所有权 | UVD | MoveFuns DAO | [点击观看](https://www.youtube.com/embed/jUiPV5UbiTA?si=hXU52a2RkbYymp1T) |

### 一扫门前雪 Install Sui

> windows11 / WSL2 / Ubuntu 22.04.2 LTS

**Sui 开发环境配置**
- [Sui(Github)](https://github.com/MystenLabs/sui) 
- [sui install doc(en)](https://docs.sui.io/guides/developer/getting-started/sui-install)
- [sui install doc(zh-cn)](https://intro-zh.sui-book.com/unit-one/lessons/1_%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83.html)
- [sui install video($bili^2$)](https://www.bilibili.com/video/BV1RY411v7YU/)

```bash
# 已安装Rust
➜  rustc -V
rustc 1.73.0 (cc66ad468 2023-10-03)
# 下载依赖
➜  sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
# Install Sui binaries from source
# 安装mainnet版本 branch
➜  cargo install --locked --git https://github.com/MystenLabs/sui.git --branch mainnet sui
# 安装testnet版本 testnet branch
➜  cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
# 构建会比较慢，耐心等待
Compiling ...
Building[===>]
# 检验 binaries 是否安装成功
➜  sui --version
sui 1.17.3-ebcb58ff2

➜  ~ sui -h
A Byzantine fault tolerant chain with low-latency finality and high throughput

Usage: sui <COMMAND>

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

**Issues-1**

```bash
# 报`SSL error`大概率为网络波动或者需要更新代理配置
➜  ~ cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
    Updating git repository `https://github.com/MystenLabs/sui.git`
error: failed to fetch into: /home/user/.cargo/git/db/sui-6ac459c53b1b685a

Caused by:
  network failure seems to have happened
  if a proxy or similar is necessary `net.git-fetch-with-cli` may help here
  https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-with-cli

Caused by:
  SSL error: unknown error; class=Ssl (16)
```

## Learn-002: Aptos Start

> At 2024.02.04

### Glance of Aptos

[aptosfoundation.org](https://aptosfoundation.org/) 开发环境一览，对于游戏友好？

**[aptos.dev](https://aptos.dev/)**
- API
  - [Rest](https://aptos.dev/apis/fullnode-rest-api)
  - [Graphql](https://aptos.dev/indexer/indexer-landing)
- SDK
  - [aptos-core/sdk](https://github.com/aptos-labs/aptos-core/tree/main/sdk)
  - [aptos-core/ecosystem/python](https://github.com/aptos-labs/aptos-core/tree/main/ecosystem/python/sdk)
  - [aptos-ts-sdk](https://github.com/aptos-labs/aptos-ts-sdk)
  - [Aptos-Unity-SDK](https://github.com/aptos-labs/Aptos-Unity-SDK)
- [Move Framework](https://aptos.dev/reference/move)

### Install Aptos

> windows11 / WSL2 / Ubuntu 22.04.2 LTS

**Aptos 开发环境配置**
- [aptos-core/cli](https://github.com/aptos-labs/aptos-core/releases?q=cli&expanded=true)
- [aptos cli doc(en)](https://aptos.dev/tools/aptos-cli/)

```bash
# Install CLI by script
➜  python3 --version
Python 3.10.12

➜  curl -fsSL "https://aptos.dev/scripts/install_cli.py" | python3
Latest CLI release: 2.4.0
Currently installed CLI: None
Determined target to be: Ubuntu-22.04-x86_64

Welcome to the Aptos CLI installer!

This will download and install the latest version of the Aptos CLI at this location:

/home/user/.local/bin

Installing Aptos CLI (2.4.0): Downloading...
Installing Aptos CLI (2.4.0): Done!

The Aptos CLI (2.4.0) is installed now. Great!

You can test that everything is set up by executing this command:

aptos info

➜  aptos info
{
  "Result": {
    "build_branch": "main",
    "build_cargo_version": "cargo 1.74.1 (ecb9851af 2023-10-18)",
    "build_clean_checkout": "true",
    "build_commit_hash": "8f4663da411befd7314f9d14312fc40f113309d4",
    "build_is_release_build": "true",
    "build_os": "linux-x86_64",
    "build_pkg_version": "2.4.0",
    "build_profile_name": "cli",
    "build_rust_channel": "1.74.1-x86_64-unknown-linux-gnu",
    "build_rust_version": "rustc 1.74.1 (a28077b28 2023-12-04)",
    "build_tag": "",
    "build_time": "2024-01-05 12:43:33 +00:00",
    "build_using_tokio_unstable": "true"
  }
}

➜  aptos -h
Command Line Interface (CLI) for developing and interacting with the Aptos blockchain

Usage: aptos <COMMAND>

Commands:
  account     Tool for interacting with accounts
  config      Tool for interacting with configuration of the Aptos CLI tool
  genesis     Tool for setting up an Aptos chain Genesis transaction
  governance  Tool for on-chain governance
  info        Show build information about the CLI
  init        Tool to initialize current directory for the aptos tool
  key         Tool for generating, inspecting, and interacting with keys
  move        Tool for Move related operations
  multisig    Tool for interacting with multisig accounts
  node        Tool for operations related to nodes
  stake       Tool for manipulating stake and stake pools
  update      Update the CLI itself
  help        Print this message or the help of the given subcommand(s)

Options:
  -h, --help     Print help
  -V, --version  Print version
```

## Learn-003: [Aptos.Tutorial:build-e2e-dapp](https://aptos.dev/tutorials/build-e2e-dapp/e2e-dapp-index)

> At 2024.02.05

### 1.Create a smart contract

See the completed code in the [my_first_dapp](https://github.com/aptos-labs/aptos-core/tree/main/aptos-move/move-examples/my_first_dapp).

#### 1.1.Init contract(move) workspace

```bash
➜  mkdir -p  aptos-todo/move
➜  cd aptos-todo/move
➜  aptos move init --name my_todo_list
{
  "Result": "Success"
}

➜ ll -a
total 24K
drwxr-xr-x 5 mulander mulander 4.0K Feb  4 15:56 .
drwxr-xr-x 3 mulander mulander 4.0K Feb  4 15:56 ..
-rw-r--r-- 1 mulander mulander  261 Feb  4 15:56 Move.toml
drwxr-xr-x 2 mulander mulander 4.0K Feb  4 15:56 scripts
drwxr-xr-x 2 mulander mulander 4.0K Feb  4 15:56 sources
drwxr-xr-x 2 mulander mulander 4.0K Feb  4 15:56 tests
```

#### 1.2.Init account profile

> A Move module is stored under an address (so when it published anyone can access it using that address); the syntax for a Move module is
>```rust
>module <account-address>::<module-name> {}
>```
>In our module, the account-address is todolist_addr (a variable we just declared on the Move.toml file in the previous step that holds an address), and the module-name is todolist (a random name we selected).

```bash
➜  aptos init --network devnet
Configuring for profile default
Configuring for network Devnet
Enter your private key as a hex literal (0x...) [Current: None | No input: Generate new key (or keep one if present)]
******************************************************************
Account 0x381c6bfb874cef7e995ec059ce7e008989dccd6b6973252b1bb8d3b61da5b326 has been already found onchain

---
Aptos CLI is now set up for account 0x381c6bfb874cef7e995ec059ce7e008989dccd6b6973252b1bb8d3b61da5b326 as profile default!  Run `aptos --help` for more information about commands
{
  "Result": "Success"
}
```

```yaml
# Move.toml
[addresses]
todolist_addr='<default-profile-account-address>'
```

```rust
// sources/todolist.move
module todolist_addr::todolist {}
```

#### 1.3.Compile & test & publish

Coding contract logic...

```bash
➜  move aptos move compile
Compiling, may take a little while to download git dependencies...
UPDATING GIT DEPENDENCY https://github.com/aptos-labs/aptos-core.git
INCLUDING DEPENDENCY AptosFramework
INCLUDING DEPENDENCY AptosStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING my_todo_list
{
  "Result": [
    "381c6bfb874cef7e995ec059ce7e008989dccd6b6973252b1bb8d3b61da5b326::todolist"
  ]
}

➜  move aptos move test   
INCLUDING DEPENDENCY AptosFramework
INCLUDING DEPENDENCY AptosStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING my_todo_list
Running Move unit tests
[ PASS    ] 0x381c6bfb874cef7e995ec059ce7e008989dccd6b6973252b1bb8d3b61da5b326::todolist::account_can_not_update_task
[ PASS    ] 0x381c6bfb874cef7e995ec059ce7e008989dccd6b6973252b1bb8d3b61da5b326::todolist::test_flow
Test result: OK. Total tests: 2; passed: 2; failed: 0
{
  "Result": "Success"
}

➜  move aptos move publish
Compiling, may take a little while to download git dependencies...
UPDATING GIT DEPENDENCY https://github.com/aptos-labs/aptos-core.git
INCLUDING DEPENDENCY AptosFramework
INCLUDING DEPENDENCY AptosStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING my_todo_list
package size 2685 bytes
Do you want to submit a transaction for a range of [185600 - 278400] Octas at a gas unit price of 100 Octas? [yes/no] >
yes
{
  "Result": {
    "transaction_hash": "0x22269529933f631c4e436fb1ab522f69747a13bdf69b05b3fc60556085147798",
    "gas_used": 1856,
    "gas_unit_price": 100,
    "sender": "381c6bfb874cef7e995ec059ce7e008989dccd6b6973252b1bb8d3b61da5b326",
    "sequence_number": 0,
    "success": true,
    "timestamp_us": 1707116527792370,
    "version": 536099204,
    "vm_status": "Executed successfully"
  }
}
```

Done! We can explore this todo module on [explorer.aptoslabs](https://explorer.aptoslabs.com/account/0x381c6bfb874cef7e995ec059ce7e008989dccd6b6973252b1bb8d3b61da5b326/modules/code/todolist?network=devnet).

**Issues-2**

```bash
# 运行构建失败，如遇github网络问题
➜  aptos move compile
Compiling, may take a little while to download git dependencies...
UPDATING GIT DEPENDENCY https://github.com/aptos-labs/aptos-core.git
While processing dependency 'AptosFramework': Unable to find package manifest for 'AptosFramework'
# 修改`git config`下`http`配置可解决
# 全局设置 set
➜  git config --global http.sslVerify false
➜  git config --global http.version HTTP/1.1
➜  git config --global http.postBuffer 1048576000
# 查看全局设置
➜  git config --global -l
http.sslverify=false
http.version=HTTP/1.1
http.postbuffer=1048576000
...
# 不需要时可以 unset
➜  git config --global --unset http.sslVerify
➜  git config --global --unset http.version
➜  git config --global --unset http.postbuffer
```

### 2~6.Set up React App

```bash
#  create react templaet
➜  npx create-react-app client --template typescript
Need to install the following packages:
  create-react-app@5.0.1
Ok to proceed? (y) y

# Install deps
➜  npm i antd@5.1.4  
➜  npm i @aptos-labs/wallet-adapter-react @aptos-labs/wallet-adapter-ant-design 
➜  npm i petra-plugin-wallet-adapter
➜  npm i @aptos-labs/ts-sdk
```

**Issues-3**

```bash
# certificate has expired
➜  npx create-react-app client --template typescript
npm ERR! code CERT_HAS_EXPIRED
npm ERR! errno CERT_HAS_EXPIRED
npm ERR! request to https://registry.npm.taobao.org/create-react-app failed, reason: certificate has expired

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/user/.npm/_logs/2024-02-04T09_05_46_452Z-debug-0.log
# 解决方案
➜  npm config set strict-ssl false
```

Some wallet logic

```js
// ≈hooks:useWeb3/useWagmi
import { useWallet } from "@aptos-labs/wallet-adapter-react";
// ≈Web3js/ethersjs/viem
import { Aptos } from "@aptos-labs/ts-sdk";
// ≈ConnectWalletModal
import { WalletSelector } from "@aptos-labs/wallet-adapter-ant-design";

// window?.aptos≈window.ethereum
export const aptos = new Aptos();

export function App() {
  ...
  const { account, signAndSubmitTransaction } = useWallet();
  ...
  /*
    The moduleAddress is the address we publish the module under, i.e the account address you have in your Move.toml file (myaddr).
    The provider.getAccountResource()expects an account address that holds the resource we are looking for and a string representation of an on-chain Move struct type.
  */
  await aptos.getAccountResource({
    accountAddress: account?.address,
      resourceType: `${moduleAddress}::todolist::TodoList`,
  });
  ...
  // sign and submit transaction to chain
  const response = await signAndSubmitTransaction({
    data: {
      // function- is built from the module address, module name and the function name.
      function: `${moduleAddress}::todolist::create_list`,
      // functionArguments - the arguments the function expects, in our case it doesn’t expect any arguments.
      functionArguments: [],
    },
  });
  // wait for transaction
  // ≈await ethers.tx.wait()
  await aptos.waitForTransaction({ transactionHash: response.hash });
```

View my code of [aptos-todo](./codes/aptos-todo/)

![aptos_todolist_ui](./assets/aptos_todolist_ui.png)

### Short Summary

相比`EVM`，`Aptos`整体跑一圈下来除了网络问题卡了会壳，其他都还算流畅，交易确认也快很多。

cli控制台提示信息友好，个人觉得`{"Result": "Success"}`有点丑。

Contract
- ✅Support: Test, Compile, Publish, Faucet...
- 🖍️Advice: Make `.gitignore` with `aptos move init`.

Frondend
- ✅Support: SDK, Wallet Modla UI, Wallet Hooks
- 🖍️Advice: Only React? Search for vue implementation.

## Learn-004: Sui.Tutorial:dapp-kit Hello world