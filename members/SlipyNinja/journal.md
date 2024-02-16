# 学习日志
## 1. 使用二进制安装SUI
跟随教程[SUI MOVE导论](https://github.com/movefuns/co-learn-sui/blob/main/courses/unit-1/1-get-start/README.md)下载二进制文件并在windows系统上进行安装。 
安装完毕后通过 `sui --version`命令查看版本。
![image](https://github.com/SlipyNinja/SuiStartrek/assets/158538271/011600fb-4321-482f-974a-bc3ef22b8456)
## 2. Hello World合约
1）在Discord频道获取开发网和测试网用的SUI tokens。 
领取到以下地址：0xe1f49f3e0e178859feb9d93e3f452d05778a3505bbf08903239e7b830b5a7ef5  
![image](https://github.com/SlipyNinja/SuiStartrek/assets/158538271/aa2f9c8e-b10e-4810-930e-1a4a5bd377dd)
2）构建hello world合约
首先通过sui move new hello_world指令初始化项目。  
这条指令创建了:  
1. 项目根文件夹 hello_world
2. Move.toml 配置文件
3. 用于存放 Sui Move 智能合约的 sources 子文件夹  

然后复制官方网站的[hello_world.move](https://github.com/sui-foundation/sui-move-intro-course/blob/main/unit-one/example_projects/hello_world/sources/hello_world.move)文件放到sources文件夹下。这里move.toml文件不能直接采用自动生成的内容，需要把dependences编辑为测试网的地址。  
接下来通过如下指令把合约发布到devnet：`sui client publish --path <absolute local path to the Sui Move package> --gas-budget 3000000000`  
![image](https://github.com/SlipyNinja/SuiStartrek/assets/158538271/7f6c0094-d95d-4b7a-a553-7e9d86e092e9)  
其中objectID= 0x18e42e6b71d59531d3e68f28cb6cd08c122f51edf7fdec2b49fbfbcc29018025。  
然后通过调用刚才部署的智能合约中的 mint 函数来 mint 一个 Hello World object.  
`sui client call --function mint --module hello_world --package  0x18e42e6b71d59531d3e68f28cb6cd08c122f51edf7fdec2b49fbfbcc29018025 --gas-budget 300000000`  
使用 Sui Explorer 来察看我们刚才创建和转移的 Hello World object。
![image](https://github.com/SlipyNinja/SuiStartrek/assets/158538271/847b1f31-5b29-4928-b21d-688b5bc797ac)




