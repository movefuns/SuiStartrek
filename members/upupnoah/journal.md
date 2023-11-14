# 学习日志

# roadmap1

## Sui wallet
- 安装 sui wallet chrome 插件
- 安装 Ethos Sui Wallet APP

## 安装 move 开发环境
-  [Sui Documentation](https://docs.sui.io/guides/developer/getting-started/sui-install#prerequisites)
- 在 vscode 中安装 move-analyzer 插件
- 给 move-analyzer 插件提供 path：

## 熟悉区块链浏览器
- https://suiexplorer.com/
- https://suivision.xyz/

## 学习 ERC20
- [token 合约](https://sui-book.com/framework/02.coin.html)
- [例子](https://examples.sui-book.com/samples/coin.html)
  
# roadmap2
- 初始化一个 Sui Move Package
  - `sui move new hello_world`
- 完成 hello_world 代码
- 编译 hello_world
  - `sui move build`
- 使用 Sui CLI 将 package 部署到 Sui 网络，选择 devnet 开发网
  - `sui client publish --gas-budget 10000000`
  - export PACKAGE_ID=<在先前输出信息中的 package object ID>
- 在交易中调用 mint 函数
  - `sui client call --function mint --module hello_world --package $PACKAGE_ID --gas-budget 10000000`
- 使用 Sui Explorer 查看交易
  - https://suiexplorer.com/
  - 右上角选择 devnet 开发网
  - 在搜索框中输入 object ID