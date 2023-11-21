# 学习日志

# Roadmap 1

## move环境搭建(wsl2：Ubuntu)
```
// wsl设置代理 ps:代理端口在vpn软件自己找，我的是10809
export http_proxy=http://localhost:10809
export https_proxy=http://localhost:10809
// 检查代理已经正确配置 
curl google.com
[response]
<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>301 Moved</TITLE></HEAD><BODY>
<H1>301 Moved</H1>
The document has moved
<A HREF="http://www.google.com/">here</A>.
</BODY></HTML>
// 安装rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
// 安装sui
git clone https://github.com/MystenLabs/sui.git
cd sui
git checkout devnet
cargo build -p sui
```

## 运行本地sui节点
```
 //到sui的root目录下执行
 RUST_LOG="off,sui_node=info" cargo run --bin sui-test-validator
```
## 前端页面

### react创建项目
```
pnpm create @mysten/create-dapp --template react-client-dapp
```
## 合约部分
```
//在dev环境发布简单的合约流程
//创建账户
sui client active-address
sui client active-env
//新建合约
sui move new my_first_package
//复制简单的合约内容
//编译合约
sui move build

//合约发布
sui client publish --gas-budget 10000000

----- Transaction Digest ----
C32nHHvJDsNs3ZXogJsvFc3bcLKa233zV3hXnbEKdVMq
```


