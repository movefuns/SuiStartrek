# 学习日志

## 一 开发环境配置（Mac）

### 1 安装依赖

```
# rust 环境：用于后续部分工具的编译
brew install rustup-init

# sui 工具安装: sui中包含了move语言
brew install sui
```

### 2 配置VSCODE

#### 2.1 安装插件

![1710253795202](image/journal/1710253795202.png)

#### 2.2 Move LSP

```
# 通过 cargo 编译安装 move 的 LSP 服务执行程序
# 注意：建议配置字节的crate源，加快下载：https://rsproxy.cn/
cargo install --git https://github.com/movebit/move --branch sui_move_analyzer sui-move-analyzer

```

![1710253894406](image/journal/1710253894406.png)

## 二 第一个项目

### 1 创建项目

```
# 通过模版创建项目：选择第二个包含move的和前端的
npm create @mysten/dapp
```

![1710254193816](image/journal/1710254193816.png)

### 2 编译项目

```
# 解决 move 项目没有语法提示问题
# 简单说就是需要下载 move 对应的 sdk，再加上配置的 vscode Move 插件提供语法提示 
cd move && sui move build # 网络问题记得挂上代理
```

### 3 开发网发布

这部分基本依照 README.md 中提供的内容发布就可以了， 一步一步执行，注意理解每一步的用意

### 4 测试网发布

#### 4.1 修改依赖

```
# 修改项目中 Move.toml 中依赖的 sui 的分支版本：因为发布的是测试环境了
```

![1710254572938](image/journal/1710254572938.png)

#### 4.2 修改本地配置

```
# 添加测试网
sui client new-env --alias 'testnet' --rpc 'https://fullnode.testnet.sui.io:443'

# 切换到测试网络
sui client switch --env testnet

# 获取测试币和查看
sui client faucet
sui slient gas
```

#### 4.3 发布项目

```
# 发布命令不变
sui client publish --gas-budget 100000000 counter

```

![1710254973810](image/journal/1710254973810.png)

#### 4.4 测试网查看

测试网： https://suiexplorer.com/?network=testn

![1710255016947](image/journal/1710255016947.png)

# 问题总结

## 问题一：开发网发布的合约交易为什么有时候查不到？

在群里问大佬说：开发网生成交易块不是很快导致的，所以大多时候在开发网不能立即查到交易块的信息

## 问题二：为什么合约开发者要使用测试网开发合约？

在传统项目开发中，都是发自己在开发环境自测完毕才上测试环境；但是在公链合约开发有点不同，开发公链是给公链维护的那批人使用的，而基于这个公链开发合约的开发者在测试网上开发会体验好点
