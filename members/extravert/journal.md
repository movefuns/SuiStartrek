# 学习日志

# Roadmap 1

## 安装

### 安装Sui命令行

Sui的命令行有三种安装方式，我因为我本身对Rust有一定的了解，Sui命令行本身是rust编写的所以我选择了用
编译安装的方式

- 按照Rust官网  [get-started](https://www.rust-lang.org/learn/get-started) 的内容
```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
```
1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
```
一路选择了默认安装

-  clone sui 官方代码

```shell
git clone git@github.com:MystenLabs/sui.git
```
- 编译sui代码
```shell
 cd sui
 # 编译指定的分支
 git checkout mainnet
 # 在 clone的sui 目录 运行 build 指令
 cargo build --relese
```

在漫长的等待时间过后  显示 编译完成在 `sui`的目录下面有 



最开始使用实验室的集群来做，发现一方面是实验室的资源是公共的，另一方面就是代理问题始终解决不了，sui放弃。

然后打算使用windows，结果环境就出错，sui使用wsl，记录如下：

### 安装Move 开发环境

使用以下命令进行更新apt-get：

```bash
sudo apt-get update
```

安装需要的包

```bash
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

使用以下命令在 macOS 或 Linux 上安装 Rust 和 Cargo：

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

网络问题会超时，参考群友的解决方案：

https://sui-startrek-birch.vercel.app/docs#%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91

clash的配置