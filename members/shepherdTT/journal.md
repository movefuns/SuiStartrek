# 学习日志
一、
第一个任务是完成第一个简单的Move智能合约并成功部署到测试网络，工作可以分为以下两部分
· 配置环境
· 写智能合约，编译、发布、mint

1.配置环境
· 步骤
    step1 安装依赖Rust and Cargo;Additional prerequisites 
    step2 安装sui的二进制文件 
    step3 为vs code配置move analyzer插件
· 注意事项及参考
    注意这些依赖的安装方法在不同的操作系统中有差别，可以参考https://github.com/movefuns/SuiStartrek/blob/main/roadmap/01.start.md第一部分的教程（文档和bilibili视频）

2.写智能合约，编译、发布、mint
· 步骤
    step1 创建并编写智能合约（创建：sui move new myFirstTask）
    step2 编译（命令sui move build）--编译有问题可能是sui二进制文件没更新
    step3 发布（命令sui client publish  --gas-budget 100000000）
    step4 mint（复制package id到sui explorer查询）
· 注意事项及参考
    参考文档：
        1.教程：https://zhuanlan.zhihu.com/p/681443475
        2.sui move导论中文版第一章：https://intro-zh.sui-book.com/unit-one/lessons/5_hello_world.html  介绍了sui项目姐狗，move智能合约的定制类型、函数等，以及关于hello world项目的一些教程
    注意事项
        1.编译有问题可能与sui二进制文件没更新有关
        2.发布有问题可能与依赖有关，以下代码可以解决从连接网络到publish过程的bug。
            *执行 
            sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443 
            *执行
            sui client switch --env testnet
            *Move.toml
            Sui = { git = "https://github.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/mainnet" }
            *publish 的时候 执行
            sui client publish --gas-budget 100000000
            --skip-dependency-verification
        3.网络问题可以参考sui move导论1.1最下面部分，在linux里，连上devnet和testnet都可以用curl命令，群聊里还有windows版本的命令
            curl --location --request POST 'https://faucet.testnet.sui.io/v1/gas'  --header 'Content-Type: application/json'  --data-raw '{"FixedAmountRequest":{"recipient":"0x0d525301e8e3f8db86f06758866e22c2b899262df03afde38a1f0de576e2019e"}}'
        4.mint时记得钱包切网络，浏览器-钱包-设置里改。

        