# 学习日志

## Getting Started

## 环境配置打开安装文档

1. 打开[安装文档](https://docs.sui.io/guides/developer/getting-started/sui-install)

  1. 选择的是Linux，因为 windows 的环境配置比较繁琐且错误较多

  2. 在 Windows 下安装 WSL（我选择的是 Ubuntu）

  3. 在 WSL 内安装 git、nvm、pnpm 等

2. 按照安装文档的 shell 命令安装一些前置软件

  1. 这里通过 git 安装 sui 二进制文件

    1. 如果出现错误，可以检查一下是不是有什么前置的编译软件没有安装

      1. 安装和build时间会比较久需要耐心等待一会，不能让电脑进入休眠，否则会

    2. 通过 `rustup update stable` 更新 rust

  2. 安装完成后，安装后的位置会在 `/root/.cargo/git/checkouts/sui-6ac459c53b1b685a/8ea6008/`这样的地址内，后续启动本地网络需要用到

## 连接到 Sui 网络

### 配置 Sui 客户端

运行`sui client`命令，然后基本上选默认就行。

`sui client envs` 查看本地存在的环境。

由于刚安装完成后是没有启动本地网络的。所以上面命令在刚安装完成后是没有 `local` 这一项的.

![image.png](https://flowus.cn/preview/9d7b5fe1-18f5-4a76-beb7-495d942e7a9d)

### 连接到本地网络

3. 打开 `sui` 的根目录，即上面的 `/root/.cargo/git/checkouts/sui-6ac459c53b1b685a/8ea6008/`

4. 运行 `RUST_LOG="off,sui_node=info" cargo run --bin sui-test-validator`

  1. 这个安装和 build 时间也比较久不能让电脑进入休眠，否则会失败

5. 通过文档的一些 shell 命令检查服务是不是正常运行

  1. `curl --location --request POST 'http://127.0.0.1:9000' \--header 'Content-Type: application/json' \--data-raw '{"jsonrpc": "2.0","id": 1,"method": "sui_getTotalTransactionBlocks","params": []}'`

6. 成功运行后通过 `sui client new-env --alias local --rpc [http://127.0.0.1:9000](http://127.0.0.1:9000)`将改地址配置到客户端

7. 运行 `sui client switch --env local` 切换环境至本地

8. 运行 `sui client active-env` 查看当前环境

9. 运行 `sui client active-address` 查看当前地址

10. 运行 `sui client faucet` 获取硬币

11. 运行 `sui client gas` 查看地址的硬币对象

### 在本地安装 Sui Wallet 和 Sui Explorer

目录: `/root/.cargo/git/checkouts/sui-6ac459c53b1b685a/8ea6008/`

12. `pnpm install` 安装依赖

13. `pnpm turbo build` 安装 *Sui Wallet* 和 *Sui Explorer*

14. `pnpm explorer dev` 启动本地

### 设置本地 Sui 钱包

15. 进入`/root/.cargo/git/checkouts/sui-6ac459c53b1b685a/8ea6008/appss/wallet/configs/environment`目录

  1. `ls -la` 查看目录下文件

  2. `cp .env.defaults .env` 复制一份文件

  3. 打开 `.env` 修改 `API_ENV=local` 并保存

16. `pnpm wallet dev` 在本地网络上启动 Sui Wallet

## 创建 package

1. `sui move new my_first_package` 新建一个空的 package

2. 进入 `Move.toml` 文件

  1. 需要把 `subdir` 中的路径修改，这里使用 sui 根目录下的文件夹地址

  2. `/root/.cargo/git/checkouts/sui-6ac459c53b1b685a/8ea6008/crates/sui-framework/packages/sui-framework`

## 部署智能合约

1. package 目录下执行 `sui client publish --gas-budget 10000000`
