# Sui 账户

+ Sui 账户是在 Sui 区块链上保存的钱包，是所有活动（开发、测试、发布、使用）的基础
+ Sui 钱包也有很多，包括如下几种，主要是使用官方的 Sui 钱包：
    + [Sui Wallet](https://chrome.google.com/webstore/detail/opcgpfmipidbgpenhmajoajpbobppdil) | [教程-如何开始使用Sui钱包](https://mp.weixin.qq.com/s/-_hCFUO-62hv9amPzmJdeg)
    + [Suiet Wallet](https://chrome.google.com/webstore/detail/suiet-sui-wallet/khpkpbbcccdmmclmpigdgddabeilkdpd) | [教程-如何获取Suiet钱包](https://suiet.app/blog/what-is-suiet-sui-wallet-how-to-use-sui-wallet)
    + [surf](https://surf.tech/)
    + [Ethos Wallet](https://ethoswallet.xyz/)


## 1.Sui 钱包
Sui 钱包的获取方式有两种：
+ 通过 [Sui Wallet](https://chrome.google.com/webstore/detail/opcgpfmipidbgpenhmajoajpbobppdil) | [教程-如何开始使用Sui钱包](https://mp.weixin.qq.com/s/-_hCFUO-62hv9amPzmJdeg) 的方式注册获取，这种方式可以方便记录密码和助记词
+ 通过 Sui client 获取，这种方式需要手动导出密钥
```bash 
# 使用 Sui CLI 命令生成一个
sui client new-address
```

## 2.Sui Client CLI
### 2.1 账户相关
```bash
# 查看所有账户
sui client addresses
# 查看当前激活账户
sui client active-address
# 更换当前激活账户
sui switch --address <other address>
# 查看地址余额
sui client gas
```

### 2.2 合约发布
```bash
# 发布合约
sui client publish --gas-budget 100000000 <合约>
```