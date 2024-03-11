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
[代码仓库](https://github.com/CHENkai8385/sui_study/blob/main/hello_world/sources/hello.move)
packageID：0x30ffaeabbe1c65220061c30bd6c6e348196e45d3f230181b360017f49db32948

[链上记录](https://suiexplorer.com/txblock/Gdo3dM3LvKCZSRnvTP8yeFwyco8ASeajsKkEgCjTn1rw?network=testnet)
