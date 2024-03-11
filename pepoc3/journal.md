# 学习日志

## 学习过程
### 配置开发环境（windows powershell运行命令）
iex (iwr "https://gist.githubusercontent.com/WGB5445/73b3b54f8293125d4ba74260ea5a39ce/raw" ).Content

### sui-cli主要用法
#### 管理网络
1.新建rpc网络端点
```sui client new-env --alias <ALIAS> --rpc <RPC-SERVER-URL>```

2.查看当前在哪个网络
```sui client envs```

3.切换网络
```sui client switch --env <ALIAS>```

#### 管理地址
1.查询当前保存了密钥的地址: ```sui client addresses```

2.查询当前启用的地址: ```sui client active-address```

3.切换激活地址```sui client switch --address <地址>```

4.新增钱包地址```sui client new-address ed25519 <ALIAS>```

#### 获取测试币
获取到当前激活地址```sui client faucet```

#### 查看余额
```sui client gas```

#### 创建项目

```sui move new hello_world```

#### 发布项目

```sui client publish --gas-budget 10000000```

##### 调用方法

```sui client call --function <function_name> --module <module_name>  --package <package_id> --args <arguments> --gas-budget <gas_budget>```

### 实战


#### 任务1-HelloWorld
[代码仓库](https://github.com/pepoc3/Sui_Study/blob/main/hello_world.move)
packageID：0xae4ac1d66188478fc8abebbcb5c5fa7927e77bde1369daf1e028d1e34f322964

[链上记录](https://suiexplorer.com/txblock/8N8BBULE6vCr5UABiTJPTricjGtn56f8iUYpg8QE97sU?network=testnet)

#### 任务2-计数器
[代码仓库](https://github.com/pepoc3/Sui_Study/blob/main/Counter.move)

  - PackageID: 0x48f0f3511402dd364d9962a6a8b35e8cd8bb62fa0fc1ca933bb420daf713006e
  - [链上记录](https://suiexplorer.com/object/0x48f0f3511402dd364d9962a6a8b35e8cd8bb62fa0fc1ca933bb420daf713006e?network=devnet)
  ![alt text](image.png)


#### 任务3-nft
- 发行
  - [代码仓库](https://github.com/pepoc3/Sui_Study/blob/main/nft.move)
  - PackageID: 0xbc1f090b59fee57b30c1bb29e8a3971f28db9fd30b1197304e4973d41775edec
- mint
  - objectID: 0x77b9de2c758d334020e655b589a4faaf90429ffe4d5e83bca0886a4346bb8da9
  - [object查看](https://suiexplorer.com/object/0x77b9de2c758d334020e655b589a4faaf90429ffe4d5e83bca0886a4346bb8da9?network=devnet)
  ![alt text](image-2.png)

#### 任务4-猜数字游戏

**游戏玩法:**

```sui client call --function play --module guess_number_game  --package <package_id> --args <你的数字> 0x6 --gas-budget <gas_budget>```

控制台会打印，你的数字，电脑数字，比较大小，谁大就赢，并打印游戏结果

[代码仓库](https://github.com/pepoc3/Sui_Study/blob/main/mygame.move)
packageID：0x195e2b4cd5a987b98a8f4885485ea96832c82c9fa16693e6de6ae9bdb8e6eb59 

[链上记录](https://suiexplorer.com/txblock/Dq7scfmfqgSowyCQUeKx58dDyQ2g88CfkZU2YA1r3PM3?network=devnet)
![alt text](image-3.png)

play命令：只需要把第一个参数3换为你想输入的数字即可

```sui client call --function play --module mygame --package 0x195e2b4cd5a987b98a8f4885485ea96832c82c9fa16693e6de6ae9bdb8e6eb59 --args 3 0x6 --gas-budget 10000000```

游戏结果展示：

![alt text](image-1.png)



 
