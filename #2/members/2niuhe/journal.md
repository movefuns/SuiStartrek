# 学习日志

## Roadmap1

1. 安装Move开发环境
   首先尝试源码编译安装，macos最新系统不兼容testnet分支的代码
   然后尝试了两种安装方式：
   - 在Linux系统源码安装成功
   - 在Macos上使用release的二进制安装

    ```shell
    nh@nh:~$ date
    2023年 11月 16日 星期四 22:18:36 CST
    nh@nh:~$ sui --version
    sui 1.14.0-8b46c5ed9
    ```

2. 使用chrome插件创建钱包并且导出自己的私钥保存
3. 熟悉了区块链浏览器的使用
4. 创建react项目，并尝试了dapp-kit,前端功能上连接钱包，查看钱包状态
   
   [dapp-kit](https://sui-typescript-docs.vercel.app/dapp-kit)

    ```shell
    pnpm create @mysten/create-dapp
    
    npm install
    npm run dev
    ```

5. 学习并发布ERC20

    **当前只能在devnet发布**

    ```shell
    # 安装Move开发环境
    git clone https://github.com/move-language/move.git
    cd move
    ./scripts/dev_setup.sh -ypt
    source ~/.profile
    cargo install --path language/tools/move-cli
    move --help
    ```

    参考步骤4中的README教程编辑并发布ERC20
   