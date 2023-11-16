# 学习日志

## 安装

相关资料：

- <https://github.com/movefuns/co-learn-sui/blob/main/courses/unit-1/1-get-start/README.md>
- <https://docs.sui.io/guides/developer/getting-started/sui-install#prerequisites>
- <https://www.rust-lang.org/zh-CN/learn/get-started>

### 安装Rust环境及相关依赖

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup update stable

brew install curl cmake git
```

### 安装 sui

```shell
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui

sui --version

sui help
```

### 安装sui-cli 和 Move IDEs and plugins

- <https://docs.sui.io/references/cli/client>
- <https://docs.sui.io/guides/developer/getting-started/sui-environment#move-ides-and-plugins>

```shell
cargo install --git https://github.com/move-language/move move-analyzer --branch sui-move --features "address32"

move-analyzer --version

sui client help

sui client -h
```

#### vscode 扩展配置

```shell
/Users/qiaopengjun/.cargo/bin/move-analyzer
```

## 项目

### 创建项目并用vscode打开

```shell
cd Code/

mcd sui # mkdir sui cd sui

git clone git@github.com:qiaopengjun5162/SuiStartrek.git

ls

cd SuiStartrek/

c # code .
```
