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

#### 创建项目

```sui move new hello_world```

#### 发布项目

```sui client publish --gas-budget 10000000```

发布关键信息：

1.最上面一行是发布的交易hash

2.最下面有packageid

##### 调用方法

```sui client call --function <function_name> --module <module_name>  --package <package_id> --args <arguments> --gas-budget <gas_budget>```

### 实战


#### 任务1-HelloWorld
[代码仓库](https://github.com/CHENkai8385/sui_study/blob/main/hello_world/sources/hello.move)
packageID：0x8b79c94da042350f128cc8071950409fa1e124de06db986fb1c3fc6fb22c0aac

[链上记录](https://suiexplorer.com/txblock/3VVxT2KJXdrQMVLzgGKM9W1qh9GQ4L3k4BQnPAwhvBzD?network=testnet)

#### 任务2

##### 1.nft

[代码仓库](https://github.com/CHENkai8385/sui_study/blob/main/nft_demo/sources/mynft.move)

- 发行
  - packageID：0xe14500e34063d7400ffa934cfcde675ca18f50a08c74bc6cf047293d3aee15df
  - [链上记录](https://suiexplorer.com/txblock/CeR3kie9YR3iz6FA6rwWtRXH2o5TR7LHxyQzG6BLTj4q?network=testnet)

- mint
  - objectID: 0x1c9bdf641aeaff43f3e96531db2c45858a130406eee6c0f77f79ee45db8b1a68
  - [object查看](https://suiexplorer.com/object/0x1c9bdf641aeaff43f3e96531db2c45858a130406eee6c0f77f79ee45db8b1a68?network=testnet)
  - [链上记录](https://suiexplorer.com/txblock/7rdUmoh73sYN6hkh1V8Ht7aAEzQmkQpCNJrbQ7QqxvQm?network=testnet)



##### 2.猜数字游戏

**游戏规则：**

1. 玩家和计算机各猜一个 0 到 9 之间的数字。
2. 谁猜的数字大，谁就获胜。
3. 如果双方猜的数字相同，则平局。

**游戏逻辑:**

- 玩家输入一个 0 到 9 之间的数字。
- 计算机随机生成一个 0 到 9 之间的数字。
- 比较玩家和计算机的数字大小，并显示游戏结果。

**游戏玩法:**

```sui client call --function play --module guess_number_game  --package <package_id> --args <你的数字> 0x6 --gas-budget <gas_budget>```

控制台会打印，你的数字，电脑数字，游戏结果

[代码仓库](https://github.com/CHENkai8385/sui_study/blob/main/game_demo/sources/mygame.move)
packageID：0x4a374a6fd8bc863a6f8bad0564e6935619f86a36fe980ed9d7a1ca83228c5c20 

[链上记录](https://suiexplorer.com/txblock/AkocXKmkWKtk2BkJp4xUz7ydjZREjpfA9Mm71B6qU2J8?network=testnet)

play命令：只需要把第一个参数2换为你想输入的数字即可

```sui client call --function play --module mygame --package 0x4a374a6fd8bc863a6f8bad0564e6935619f86a36fe980ed9d7a1ca83228c5c20 --args 2 0x6 --gas-budget 10000000```

游戏结果展示：

``````
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                 │
│  │ EventID: 5TUrD2QhmzgfyQuiNWdaLqJPfUpfqvdjVeLkg4nJEKpJ:0                                           │
│  │ PackageID: 0x4a374a6fd8bc863a6f8bad0564e6935619f86a36fe980ed9d7a1ca83228c5c20                     │
│  │ Transaction Module: mygame                                                                        │
│  │ Sender: 0xba64eccae040d94e77f478f26bb0bbc868afd673757116ee52a7901c9686e465                        │
│  │ EventType: 0x4a374a6fd8bc863a6f8bad0564e6935619f86a36fe980ed9d7a1ca83228c5c20::mygame::GameResult │
│  │ ParsedJSON:                                                                                       │
│  │   ┌─────────────────┬─────────┐                                                                   │
│  │   │ computer_number │ 3       │                                                                   │
│  │   ├─────────────────┼─────────┤                                                                   │
│  │   │ result          │ you win │                                                                   │
│  │   ├─────────────────┼─────────┤                                                                   │
│  │   │ your_number     │ 9       │                                                                   │
│  │   └─────────────────┴─────────┘                                                                   │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯╭
``````



 
