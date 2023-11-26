# 学习日志

## 一、开发环境配置

1、安装依赖
进入sui官网，依照需求安装所需依赖
https://docs.sui.io/guides/developer/getting-started/sui-install
（中途可能会碰见一些报错，问题不大，按照报错信息依次调整即可）

2、安装sui
通过cmd命令来安装sui（windows系统）

cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui

这条指令在官网的安装依赖下面也有，只不过是testnet的。
这里可能会碰到下到一定程度然后卡住停止的问题，这时候请检查你的依赖有没有下载完全，如果有，那就看看系统变量是否配置过。比如我的就是卡在了clang，这时去系统设置配置一下LIBCLANG_PATH就可以了

安装完成后用sui --version检测一下，出现类似sui 1.14.0-a48eee624这样的字样就表示安装成功了

3、vs code配置
参考：https://www.bilibili.com/video/BV1RY411v7YU?p=1
依照视频演示，在vscode的插件中找到move analysis并安装

## 二、第一个项目hello_world

  （参考：https://www.bilibili.com/video/BV1RY411v7YU?p=1）

1、sui move new hello_world
使用sui move new <项目名>创建一个新的项目
![image](https://github.com/Juedsd/Sui_move_1/assets/118274140/a4a4f183-cd61-49ad-839e-ce455ed74108)

2、检查toml文件
默认应该是这样的
![image](https://github.com/Juedsd/Sui_move_1/assets/118274140/1c2af64c-0b43-42b3-bc95-5caf3c3ddc17)
但因为我这样子老是build失败，无奈只能把依赖给下载到本地了

指令是git clone https://github.com/MystenLabs/sui.git (记得要把github的分支切换到testnet）

最后我的toml文件是这样的
![image](https://github.com/Juedsd/Sui_move_1/assets/118274140/a6961f35-f808-4a3b-91de-bd233cab8523)

3、创建move文件
在sources文件夹里创建hello_world.move文件，并打入代码
(代码参考:https://www.bilibili.com/video/BV1RY411v7YU?p=1)

4、sui move build
上述做完后就可以尝试构建我的的项目了。在cmd中先cd到项目文件夹，然后用sui move build指令来检测项目能否被构建,成功的构建如下
![image](https://github.com/Juedsd/Sui_move_1/assets/118274140/edeef1c4-1fc6-49aa-928d-b1dbefec9dc2)

5、publish
为了发布到网上，我们需要先去申请一些gas以便支付我们的gas费

一种方法是去discord中找到sui加入，寻找devnet-faucet。在其中输入!faucet <我们的钱包地址> 就可以了。
还有一种是curl指令，但我自己用不了，可以的小伙伴可以自己试试，要方便不少。

那么万事俱备，接下来我们就可以尝试将我们的项目发布到测试网上去了

使用sui client publish --gas-budget 30000000 --skip-dependency-verification来发布我们的项目(需要账户中有gas)

发布成功后会出现类似这样的界面
![image](https://github.com/Juedsd/Sui_move_1/assets/118274140/9fd072b6-8415-428f-823f-ceb40c79a8a2)

这时我们可以用发布的id去suiexplorer(https://suiexplorer.com/)去找到我们发布的项目
![image](https://github.com/Juedsd/Sui_move_1/assets/118274140/de62bd1c-3f43-4483-94e7-d2a1d62ad98e)


6、erc20
yysy，这应该不算是hello_world的项目了，但我感觉单独开一个大标题挺浪费的，便干脆一块这了

其实就是把.move文件中的代码换成suibook(https://examples.sui-book.com/samples/coin.html)里面erc20的代码，然后再走一遍上面的流程就可以了
![image](https://github.com/Juedsd/Sui_move_1/assets/118274140/16950aac-41a5-4b51-8c83-7cb51c6c785e)



