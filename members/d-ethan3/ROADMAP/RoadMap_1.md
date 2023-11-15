# Unit1 Sui set up

## 第 0 步

首先为了安装sui，我又在 windows 电脑上新安装了 wsl2 的 ubuntu20.04 发行版，因为 sui 的官网是说要这个版本，我将完全写出一套最简配置流程

### 配置系统环境

在一个全新的系统里，是没有任何东西的，所以要先安装必备的东西，对于新系统

### 1. 走代理

因为我是 wsl ，无论哪个系统，首先第一点，保证 `terminal` 走代理，网络好基本能解决大多数问题

例如 `export https_proxy=http://172.22.80.1:7890;export http_proxy=http://172.22.80.1:7890;export all_proxy=socks5://172.22.80.1:7890`

### 2. 更新系统包

`sudo apt-get update`

一般来说大家都是有 git 的，没有的话安装一下

### 3. 安装 Rust

rust 和 Cargo 是 Sui 必不可少的
在 Rust 官网的 [Getting started](https://www.rust-lang.org/learn/get-started) 可以找到适合你使用系统的安装方式，我是 wsl，我用

`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

有跳出的选项选择默认就好

安装完成后，重启终端，分别输入 `cargo -version` 和 `rustc --verison` 可以查看是否安装成功。
`cargo 1.73.0 (9c4383fb5 2023-08-26)` 和 `rustc 1.73.0 (cc66ad468 2023-10-03)` 有显示就说明成功了

### 安装 node

node 和 npm 不是安装 sui 所需要的，但却是之后做 dApp 是需要的，我日常习惯使用 `nvm`

安装 nvm `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash`

还是重启终端，`nvm --verison` 有返回 `0.39.5` 版本号，就说明安装成功了

接下来安装 node `nvm install node`

安装成功后接下来就是安装 sui 所需的依赖了

### 一把梭安装依赖

```bash
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

在终端中运行这行命令，中间所有问题都选 “是”，然后就可以全部安装了。经过一定时间的等待，就可以全部安装完成了。

### 安装 sui

`cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui`

从源文件安装 sui 二进制文件

这就是最重要的一步了，考验网络，电脑 CPU 的时候到了，如果你跟我一样电脑配置比较普通，可以在参数中加个 `-j*`, * 是数字，写几就是让 Cargo 用几个 CPU 核心。

```bash
    Finished release [optimized + debuginfo] target(s) in 17m 01s
    Installing /home/moon/.cargo/bin/sui
```

当你看到这些时候，说明安装成功了！

``` bash
$ sui --version
sui 1.14.0-8b46c5ed9
```

还不放心，这样就确认了, sui 确实安装成功！

现在就开放心的开始开发了！

## 第二步：链接