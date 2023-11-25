# sui move 学习

## install

通过源码方式安装

前置条件 安装了 brew curl cmake git 再安装了 rust cargo

再用 cargo 安装了 sui-1.13.0

git clone https://github.com/move-language/move.git

cd move 执行脚本./scripts/dev_setup.sh -ypt 下载 move 所需依赖

完成后 source ~/.profile 保存环境变量

cargo install --path language/tools/move-cli 安装 move-cli
