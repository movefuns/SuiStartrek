# 学习日志
## 1. Week 1
### a. 发布一个ERC20代币
1. `sui move new haycoin``
2. 在当前环境下打开IDE，然后在Sources文件下新建一个 `haycoin.move` 文件，这就是我们的move文件夹
3. 这里的coin的代码从[官方文档](https://examples.sui.io/samples/coin.html)获得
4. 在终端输入`sui move build`，国内朋友可能这里build不动，可以把clash的tun mode打开
5. 编译通过之后就可以发布了 使用`sui client publish --gas-budget 1000000000`来部署我们的代币发行合约

### b. 前端方向HelloWorld
1. 这里需要注意的是要配置好npm和node环境
2. 之后这里建议使用pnpm来进行包管理，会快很多
3. 安装好npm后再安装pnpm也很方便, 直接
    ```bash
    npm install -g pnpm
    ```
4. 之后再跟着教程走完即可。但是在跟随教程搭建好前端进行交互时，发现需要钱包有gas，discord里面领取gas有2小时的时限，所以这里写一下在cli输出私钥的命令
   ```bash
   sui keytool list
   sui keytool convert <your_private_key>
   ```
    以及转移sui的命令
    ```bash
    sui client transfer-sui --to <TO> --amount <SUI_AMOUNT> --sui-coin-object-id <SUI_COIN_OBJECT_ID> --gas-budget <GAS_BUDGET>
    ```