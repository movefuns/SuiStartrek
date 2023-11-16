# 学习日志

# 第一周.web3入门

## 1.安装Move 开发环境 2023.11.13，14

- 1.1先安装rust

下载rustup-init.exe[Getting started - Rust Programming Language](https://www.rust-lang.org/learn/get-started)

教程：https://zhuanlan.zhihu.com/p/556088822

- 1.2安装sui

  替换cargo源https://blog.csdn.net/qq_46660921/article/details/128201244

  - 来到 .cargo 目录下，windows默认目录是C:\User\用户名\.cargo，若是修改过目录的话查看环境变量CARGO_HOME的变量值，总之，来到 .cargo 目录下
  - 打开或原地创建 config文件，无文件扩展名，内容如下：

  ~~~
  # `source` 就是存储有关要更换的来源名称
  [source.tuna]
  registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"
  
  [source.crates-io]
  replace-with = 'tuna'
  ~~~

打开powershell，输入以下命令

~~~
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
~~~

> cargo是Rust的构建工具和包管理器，是rustup安装后自带的，所以要先安转rust,类似于npm之于node,pip之于python

耐心等待。。。。。。。。记得开启全局梯子

<img src="journal/image-20231114205303641.png" alt="image-20231114205303641" style="zoom: 33%;" />

- 1.3安装失败，使用新的方法

https://jeffierw.notion.site/jeffierw/SuiStartrek-Problems-b0a25bbaefe14b679f71d0bf17e27e5a

先下载sui二级制文件，

然后解压，修改对应exe文件名，

最后一步配置环境变量名即可

<img src="journal/image-20231116232244227.png" alt="image-20231116232244227" style="zoom:50%;" />

## 2.安装web3钱包

https://mp.weixin.qq.com/s/-_hCFUO-62hv9amPzmJdeg

- 2.1安装谷歌插件

<img src="journal/image-20231116233119920.png" alt="image-20231116233119920" style="zoom:50%;" />

- 2.2创建新账户。密码需要复杂些

<img src="journal/image-20231116233310832.png" alt="image-20231116233310832" style="zoom:33%;" />

- 2.3创建完登录

<img src="journal/image-20231116233631022.png" alt="image-20231116233631022" style="zoom:33%;" />

我的钱包：0xa60168aeff50181532eb335246022fb951554ba85c4af2f5cfeb5137c2886a57

## 3.学习ERC20

## 4.完成ERC20的发布

