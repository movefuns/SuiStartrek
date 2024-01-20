问题及解决办法主要记录在notion:[notion](https://www.notion.so/jeffierw/SuiStartrek-Problems-b0a25bbaefe14b679f71d0bf17e27e5a)

# 安装sui及move开发环境

## 安装sui

一开始使用二进制安装，配置环境变量一直8行，后来还是采用了第二种源码的方式安装了

前置条件 安装了 brew curl cmake git 然后安装了rust cargo 

再用cargo安装了sui-1.13.0 中途没遇到什么问题 主要是科学上网要稳 因为sui仓库是monorepo比较大

## move安装

step 0: 安装

git clone https://github.com/move-language/move.git 

完事 cd move 执行脚本./scripts/dev_setup.sh -ypt 下载move所需依赖

完成后 source ~/.profile 保存环境变量

cargo install --path language/tools/move-cli 安装move-cli