# 学习日志

## 学习资料

[视频资料](https://github.com/movefuns/SuiStartrek/blob/main/video.md)

[中文书籍](https://intro-zh.sui-book.com/unit-one/lessons/1_%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83.html)

## 学习过程
### 配置开发环境（Linux-Centos8Stream）
[具体参考地址](https://docs.sui.io/guides/developer/getting-started/sui-install#prerequisites)

#### 遇到的具体问题
1.failed to run custom build command for `librocksdb-sys v0.11.0+8.1.1`

- 没有clang编译器，即rocksdb的lib库需要用clang编译器编译。因此解决办法就是安装clang编译器即可。 装C盘，以防path找不到

2.error: linker `link.exe` not found
- 缺少C++编译环境

### 开发工具配置
1.vscode

2.sui move analyzer插件

- 插件需要额外配置一个path，需要去下载一个sui move analyzer的可执行文件

### Hello World
- ``sui move new 项目名`` 创建项目
- ``sui move build`` 编译文件 注意文件名 大小写敏感
- 添加测试网络 ``sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443``
- 切换到测试网络 ``sui client switch --env testnet``
- 水龙头获取测试币 ``sui client faucet``
- 发布 ``sui client publish --gas-budget 10000000``


#### 任务1-HelloWorld
[代码仓库](https://github.com/John-jin/SuiDemo/blob/main/helloWorld/sources/hello.move)
packageID：0x30ffaeabbe1c65220061c30bd6c6e348196e45d3f230181b360017f49db32948

[链上记录](https://suiexplorer.com/txblock/Gdo3dM3LvKCZSRnvTP8yeFwyco8ASeajsKkEgCjTn1rw?network=testnet)
#### 任务2-发布NFT
[代码仓库](https://github.com/John-jin/SuiDemo/blob/main/helloWorld/sources/hello.move)
* 发行
   * packageID：0x536fd002fa93949d168a77b8d76a66aba9706cb300d0fbf88c15837c01d14fae
   * [链上记录](https://suiexplorer.com/txblock/HXjt9LvGq5ENuciTCJZYECA9uuYKMaox3rjmMQZpBcb6?network=testnet)
* mint
  * 调用 ``sui client call --function mint --module mynft --package 0x536fd002fa93949d168a77b8d76a66aba9706cb300d0fbf88c15837c01d14fae --args Join-jin https://avatars.githubusercontent.com/u/19257955?v=4 --gas-budget
    10000000``
  * [链上记录](https://suiexplorer.com/object/0x34de8788ec17f756d01d6fd58063b3c75ed752aaa3349ec641dbc708998975f3?network=testnet)

#### 任务3-游戏
- 玩家输入一个 0 到 9 之间的数字。
- 计算机随机生成一个 0 到 9 之间的数字。
- 比较玩家和计算机的数字大小，并显示游戏结果。

* 发布
  * [代码仓库](https://github.com/John-jin/SuiDemo/blob/main/game/sources/mygame.move) 
  * packageID：0x536fd002fa93949d168a77b8d76a66aba9706cb300d0fbf88c15837c01d14fae
  * [链上记录](https://suiexplorer.com/txblock/4t2iLyK1TbqKXsGXkaLw3sx2w5W2QxVFgYoHP3TuBVy3?network=testnet)
* 玩法
  *```sui client call --function play --module mygame --package 0x6064ab3cb02d76699d1ff9afd7a32496c4283dbcba5385e1be585359df790493 --args 9 0x6 --gas-budget 10000000```
* 控制台详情
```
Transaction Digest: GrKMWpT1cXHwyqAHjeGp3oiNZdFVZJs1ngntk9ZReWRt
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x74133becc5cac68a90832a84f8158f2c19e04db0d369b66171f5d761c78eec54                      │
│ Gas Owner: 0x74133becc5cac68a90832a84f8158f2c19e04db0d369b66171f5d761c78eec54                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xf363b8480d038c593529f0c44d0afe2d8267b904f5785d29060e0ad6a0329d29                       │
│  │ Version: 997451                                                                              │
│  │ Digest: 8J9EZxEChe7uq9hBYExVxbcwkjYruAUKoM8tWFqeDGsG                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: u64, Value: "9"                                                         │ │
│ │ 1   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  play                                                               │            │
│ │  │ Module:    mygame                                                             │            │
│ │  │ Package:   0x6064ab3cb02d76699d1ff9afd7a32496c4283dbcba5385e1be585359df790493 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    +L0S4Muh7svTbD8fV/wQWEnaG9X6VO7n1xE9ZW2V7Mr02nWyGHd61VyCojo2cS2ykq47V4HxQVbrDsFqyU9bAQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GrKMWpT1cXHwyqAHjeGp3oiNZdFVZJs1ngntk9ZReWRt                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 306                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xf363b8480d038c593529f0c44d0afe2d8267b904f5785d29060e0ad6a0329d29                         │
│  │ Owner: Account Address ( 0x74133becc5cac68a90832a84f8158f2c19e04db0d369b66171f5d761c78eec54 )  │
│  │ Version: 26331714                                                                              │
│  │ Digest: CybYDYxxwuVxKN7PLoc1gcULTbF5EjnfsLd227GC6ZcB                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 26331713                                                                              │
│  │ Digest: E2ZPPPNVCT8NS8p4ZUVCi2AwMZ484dNk9Gp4mPNfhDP7                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xf363b8480d038c593529f0c44d0afe2d8267b904f5785d29060e0ad6a0329d29                         │
│  │ Owner: Account Address ( 0x74133becc5cac68a90832a84f8158f2c19e04db0d369b66171f5d761c78eec54 )  │
│  │ Version: 26331714                                                                              │
│  │ Digest: CybYDYxxwuVxKN7PLoc1gcULTbF5EjnfsLd227GC6ZcB                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000 MIST                                                                      │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4t2iLyK1TbqKXsGXkaLw3sx2w5W2QxVFgYoHP3TuBVy3                                                   │
│    GKdPvf845PgmWcQpZcxZXt87M7yUtovsFnAUpn88Nxks                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                 │
│  │ EventID: GrKMWpT1cXHwyqAHjeGp3oiNZdFVZJs1ngntk9ZReWRt:0                                           │
│  │ PackageID: 0x6064ab3cb02d76699d1ff9afd7a32496c4283dbcba5385e1be585359df790493                     │
│  │ Transaction Module: mygame                                                                        │
│  │ Sender: 0x74133becc5cac68a90832a84f8158f2c19e04db0d369b66171f5d761c78eec54                        │
│  │ EventType: 0x6064ab3cb02d76699d1ff9afd7a32496c4283dbcba5385e1be585359df790493::mygame::GameResult │
│  │ ParsedJSON:                                                                                       │
│  │   ┌─────────────────┬─────────┐                                                                   │
│  │   │ computer_number │ 2       │                                                                   │
│  │   ├─────────────────┼─────────┤                                                                   │
│  │   │ result          │ you win │                                                                   │
│  │   ├─────────────────┼─────────┤                                                                   │
│  │   │ your_number     │ 9       │                                                                   │
│  │   └─────────────────┴─────────┘                                                                   │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xf363b8480d038c593529f0c44d0afe2d8267b904f5785d29060e0ad6a0329d29                  │
│  │ Sender: 0x74133becc5cac68a90832a84f8158f2c19e04db0d369b66171f5d761c78eec54                    │
│  │ Owner: Account Address ( 0x74133becc5cac68a90832a84f8158f2c19e04db0d369b66171f5d761c78eec54 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 26331714                                                                             │
│  │ Digest: CybYDYxxwuVxKN7PLoc1gcULTbF5EjnfsLd227GC6ZcB                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x74133becc5cac68a90832a84f8158f2c19e04db0d369b66171f5d761c78eec54 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1009880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```
