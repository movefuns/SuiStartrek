# 安装 SUI

_为了安装 sui，我在 windows 电脑上新安装了 wsl2 的 ubuntu20.04 发行版，这是 sui 官方支持的 Linux 版本。_

## 一、配置系统环境

在一个全新的系统里，要先安装必备的软件才可以安装 sui 的二进制文件。

### 1. 终端走代理

无论是 WSL ，还是任何一个系统，首先自己的保证 `terminal` 走代理，丝滑的网络是解决大多数问题的基础。

### 2. 更新系统包

`sudo apt-get update`

一般来说 Linux 都有预装 git ，没有的话也记得安装一下。

### 3. 安装 Rust

rust 和 cargo 是安装 Sui 必不可少的。

在 Rust 官网的 [Getting started](https://www.rust-lang.org/learn/get-started) 可以找到适合你的安装方式，我现在用 WSL，用下面这行命令就好：

`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

在安装过程中有跳出选项填 `Y` 就可以。

安装完成后，重启终端，分别输入 `cargo -version` 和 `rustc --verison` 可以查看是否安装成功。

例如显示 `cargo 1.73.0 (9c4383fb5 2023-08-26)` 和 rustc `1.73.0 (cc66ad468 2023-10-03)` 就说明安装成功。

### 4. 安装 Node.js

`node.js` 和 `npm` 不是安装 `sui` 所需要的，但却是之后做 dApp 是需要的，现在可以顺便安装了。

我日常习惯使用 [nvm](https://github.com/nvm-sh/nvm) 来管理不同版本的 node 和 npm, 同样也可以快速安装升级 node

1. 安装 nvm ： `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash`

2. 重启终端，运行 `nvm --verison` 有返回 0.39.5 之类的版本号，就说明安装成功了。

3. 安装 node `nvm install node`, 安装完成可自行验证 node 和 npm 是否安装成功。

4. 安装 pnpm，目前用不到，之后大概率会用到。

```sh
corepack enable
corepack prepare pnpm@latest --activate
```

## 二、安装 sui 的二进制文件

### 1. 安装所需依赖

```sh
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

在终端中运行这行命令，中间所有问题都输入 “y”，再耐心等一段时间，安装 sui 所需的依赖就全部安装完成了。

### 2. 安装 sui 二进制文件

```sh
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```

这就是最重要的一步了，输入上面这行命令，理论上就应该开始安装了。

这也是考验网络，电脑 CPU 的时候，如果你跟我一样电脑配置比较普通，可以在参数中加个 `-j*`, `*` 填数字，可以让 cargo 用 `*` 个 CPU 核心编译文件。

例如我的 CPU 是 6 核，我选择用 4 个核心编译

```sh
cargo install -j4 --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```

或许当你漫长的等待之后，在看到以下这些内容的时候，sui 应该安装成功了。

```sh
    Finished release [optimized + debuginfo] target(s) in 17m 01s
    Installing /home/user/.cargo/bin/sui
```


还不放心？再确认一下

```sh
$ sui --version
sui 1.14.0-8b46c5ed9
```

看到版本号说明 SUI 安装成功！
