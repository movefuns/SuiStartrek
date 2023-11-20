# 学习日志
## 1. Week 1
### a. 发布一个ERC20代币
1. `sui move new haycoin``
2. 在当前环境下打开IDE，然后在Sources文件下新建一个 `haycoin.move` 文件，这就是我们的move文件夹
3. 这里的coin的代码从[官方文档](https://examples.sui.io/samples/coin.html)获得
4. 在终端输入`sui move build`，国内朋友可能这里build不动，可以把clash的tun mode打开
5. 编译通过之后就可以发布了 使用`sui client publish --gas-budget 1000000000`来部署我们的代币发行合约

### b. 