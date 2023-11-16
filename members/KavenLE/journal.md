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

```

```



