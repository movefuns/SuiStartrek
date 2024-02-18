# 学习日志

# 1.在测试网部署简单合约

## 1.1 SUI Tools

学习了SUI Client CLI、SUI KeyTool CLI，用这两个工具生成钱包，并且通过Sui Wallet来获取了native token。

使用SUI Client CLI部署了合约FLY NFT.

部署地址：https://suiscan.xyz/devnet/object/0xbb8b0d43790be349b198a2d61d75a9d7201b9621fdafcd11feeef183ff41c7a8



# 2. 发布NFT和游戏作业

## 2.1 发布NFT合约，并铸造NFT

学习了sui client命令来调用测试网的函数，并发布了NFT

通过如下命令调用mint_to_sender

`sui client call --package 0xe44e77f7475ff96b1b85e1925e94772b860bbf42fb6068867252566e3dc0e132 --module flynft --function mint_to_sender --gas-budget 50000000`

Package ID：0xe44e77f7475ff96b1b85e1925e94772b860bbf42fb6068867252566e3dc0e132

NFT Object ID：https://suiscan.xyz/devnet/object/0xdc52f039bfceaf15ece6ca70d34d2e64a3c3934e63a45c50444230dc8143b8d7

## 2.2 井字棋游戏(sui)

按照官方的代码敲的，熟悉了一些语法，虽然敲的是 share object版的，对share object加深了理解。

share object：任何人都可以使用的对象，任何一个人都可以通过object id将这个object作为参数传入某个函数中。这就是share object，而一般的object 只有owner可以使用。

另外普通版本也看了一下，熟悉了一下move的对象所有权。

Package ID：0xe5643f515e8e0e9004f62e9afcedb0db56081f01f654e0faf7ff3b1afd12afe2



