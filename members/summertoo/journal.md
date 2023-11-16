# 学习日志

1.首先把git搞定

git 收集资料
入门教程 
https://www.runoob.com/git/git-tutorial.html

用梯子时注意,要设定好git的vpn代理端口否则会经常获得443和10054的暴击!
git config --global http.proxy http://127.0.0.1:XXXXX 
XXXXX指的是各自的梯子的端口,每个梯子都不同,找不到这个端口请联系供应商咨询

星航计划链接
https://github.com/movefuns/SuiStartrek

自己的fork链接
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

执行 hello world 的试验 
1.
https://github.com/movefuns/SuiStartrek/blob/main/roadmap/01.start.md
2.
https://sui-typescript-docs.vercel.app/dapp-kit/create-dapp

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

查看当前sui地址
sui client active-address




