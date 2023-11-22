# 学习日志

## Roadmap 1

1. 安装 move 环境
   安装 rust & cargo

   ```
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   rustup update stable
   ```

   Linux 安装环境依赖

   ```
   sudo apt-get update
   sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
   ```

   安装 sui

   ```
   cargo install --locked --git https://github.com/MystenLabs/sui.git --branch main sui sui-node
   ```

2. 配置 sui 和 move 并 publish

   ```
   sui move mew my_first_package

   sui move build

   sui client active-address

   sui client switch --env testnet

   sui client publish --gas-budget 100000000
   ```
