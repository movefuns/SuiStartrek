# 学习日志

* 1.首先把git搞定

git 收集资料
入门教程 
https://www.runoob.com/git/git-tutorial.html

用梯子时注意,要设定好git的vpn代理端口否则会经常获得443和10054的暴击!
git config --global http.proxy http://127.0.0.1:XXXXX 
XXXXX指的是各自的梯子的端口,每个梯子都不同,找不到这个端口请联系供应商咨询

# 星航计划链接
https://github.com/movefuns/SuiStartrek

# 自己的fork链接
https://github.com/summertoo/SuiStartrek

如何提交一个pull request (简称PR)
https://www.freecodecamp.org/chinese/news/how-to-make-your-first-pull-request-on-github/

PR关键点 先 add 后push origin branch

https://www.youtube.com/watch?v=igh-wYkv2sg  
这是zklogin的入门和介绍    
https://docs.sui.io/concepts/cryptography/zklogin 
这是文档 大家也可以提前预习了明天提问，大美女程序员给大家分享

https://docs.google.com/presentation/d/1aQNNNqVT77B6WmIIBL1b5YzcC3KzJ7mTVxmh8fBkrQY
最早的ppt在这里

# 执行 hello world 的试验 
1. https://github.com/movefuns/SuiStartrek/blob/main/roadmap/01.start.md
2. https://sui-typescript-docs.vercel.app/dapp-kit/create-dapp

windows 下安装 pnpm
https://www.pnpm.cn/installation

npm版本更新到 20.9.0 LTS

运行 pnpm create @mysten/create-dapp
windows 命令行下 : 无法建立目录 (已经是管理员权限)
可能是python问题

尝试wsl中安装nodejs
https://learn.microsoft.com/zh-cn/windows/dev-environment/javascript/nodejs-on-wsl

失败
node: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.28' not found (required by node)

curl 要设置代理 
https://www.myfreax.com/curl-set-proxy-server/

安装 nvm (代理服务器用自己的,下面的127是示例)
curl -x 127.0.0.1:17890 -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

碰到 node: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.28' not found (required by node)
从知乎上找到的解决方法,做一下测试
https://zhuanlan.zhihu.com/p/603962871
失败
小结:windows状态下没有运行乘成功例子,原因可能是npm的问题和wsl的问题

mac环境成功执行hello world例子并成功发布合约
目标例子(https://sui-typescript-docs.vercel.app/dapp-kit)

查看当前sui地址
sui client active-address

获取开发网测试币
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "你的sui地址,0x开头的一串"
    }
}'

返回结果
{"transferredGasObjects":[{"amount":10000000000,"id":"0xca7fd934819c9e0bf46b96a7f23cfe69cc320949d992771a350c4d9a12ccd9db","transferTxDigest":"2BgewudWokvBVuhbv6rasxiPXenTjNLzNBFmBn99aUfu"}],"error":null}

sui client gas
╭────────────────────────────────────────────────────────────────────┬─────────────╮
│ gasCoinId                                                          │ gasBalance  │
├────────────────────────────────────────────────────────────────────┼─────────────┤
│ 0xca7fd934819c9e0bf46b96a7f23cfe69cc320949d992771a350c4d9a12ccd9db │ 10000000000 │
╰────────────────────────────────────────────────────────────────────┴─────────────╯

重装sui
[uninstall sui]
cargo uninstall sui
cd /root
rm -rf .sui
清理临时目录
/tmp# rm -rf *
然后重装
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui

不过有个问题,每次重装后,sui地址就变了,无法固定(解决方案 用sui keytool 导入原地址 sui keytool import 你的私钥地址 ed25519 #导入私钥)

招聘讯息
https://www.notion.so/modifidao-060d0b29ceeb4a86bdfc1ae23978666c

mac代理
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

# NFT 发布主网过程记录
* 目标: 完成一个主网NFT的发布合约 ,并mint一个名称为自己githubid 名称或者微信名称名字的nft 图片用自己的github头像或者微信头像
* 实施: 
    * 准备一个图片作为头像
        * 用AI生成工具生成一个300x300的jpg图片格式文件,存到服务器上(没有服务器的可以考虑svg或base64)
        http://IP地址/newhead.jpg
    * 编写涉及NFT的智能合约
        * 建立新的一个结构体 HeadIconNFT 用来存储 githubid和图片路径
        * 完善move代码并本地进行必要的编译和测试
            * sui move build --skip-fetch-latest-git-deps
        * 发布代码
            * sui client publish --skip-fetch-latest-git-deps --gas-budget 100000000
        * 发布后直接在线上进行execute mint操作获得NFT
            https://suiexplorer.com/
            找到package 并执行mint 参数填入shareobject的地址
        * 源码地址
          https://github.com/summertoo/SuiRoot/tree/6be00ea8f17bc00f84e11cef5496a87b9dc33cb6/NTF/fd01


# 小游戏项目 过程记录
* 目标:完成一个简单小游戏 ，并且能通过命令行调用或者网页端调用和合约比大小 ，石头剪刀布等都可以 不追求完全正确，但是要可玩
* 实施:
    * 准备游戏逻辑 目前设计一个养成卡牌类小游戏
    * 养成特点 获取经验值,然后提升等级
    * 卡牌战斗 HP AT 影响血量
    PackageID: 0x63e9eac43b4b5d2bb5d26afe02e5fbd8329969aef51cf89fb00fcc7536ac71b4
    在suiexplorer上建立几个卡牌
    调用 initCard接口 建立卡牌并给卡牌编号
    卡牌1 0x813882f1d5c85e8d6aed928feb7bbfb35ae6247a7307911e7a2e42a865159a1c
    卡牌2 0x1b1166d2b8387bc6c39e2d28ebaff815a5a015cbe6ab9d838dc397d96ffaf87b
    调用 levelUp接口
        卡牌2的xp增加 测试通过
    调用战斗接口 fight
        一次战斗后卡牌1和卡牌2的hp都是9说明战斗判断成功
    

