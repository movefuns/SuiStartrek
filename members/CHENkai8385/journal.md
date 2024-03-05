# 学习日志

## 学习资料

[视频资料](https://github.com/movefuns/SuiStartrek/blob/main/video.md)

[中文书籍](https://intro-zh.sui-book.com/unit-one/lessons/1_%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83.html)

## 学习过程
### 配置开发环境（Linux-Centos8Stream）
[具体参考地址](https://docs.sui.io/guides/developer/getting-started/sui-install#prerequisites)
#### 遇到的具体问题
1.linux上的网络问题

- dns配置8.8.8.8
- 建议是搞定vpn，我这里用的是clash+购买的订阅，最后配置为终端代理，可以解决90%的网络下载问题

2.libssl-dev,libclang-dev,libpq-dev这三个库我的linux不支持，对应分别用yum安装openssl,clang,postgresql-libs解决了问题

### 开发工具配置
1.vscode

2.sui move analyzer插件

- 插件需要额外配置一个path，需要去下载一个sui move analyzer的可执行文件

### sui-cli主要用法
#### 管理网络
1.添加测试网络
```sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443```

2.切换测试网络
```sui client switch --env testnet```

3.列出所有网络
```sui client envs```

#### 管理地址
1.查询当前保存了密钥的地址: ```sui client addresses```

2.查询当前启用的地址: ```sui client active-address```

3.按私钥导入地址
    
- 根据私钥获取byte32 ```sui keytool convert <private key>```
    
- 根觉byte32导入新地址 ```sui keytool import <byte32> ed25519```

4.切换激活地址```sui client switch --address <地址>```

#### 获取测试币
获取到当前激活地址```sui client faucet```

#### 查看余额
```sui client gas```

### 实战
#### 创建项目
sui move new hello_world

#### 发布项目
sui client publish --gas-budget 10000000

#### DEMO
hello_world合约地址：
packageID(智能合约)：0x8b79c94da042350f128cc8071950409fa1e124de06db986fb1c3fc6fb22c0aac