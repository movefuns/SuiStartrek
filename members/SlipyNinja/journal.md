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
## 3. ERC20合约
根据[教程](https://intro-zh.sui-book.com/unit-three/lessons/5_managed_coin.html)发布ERC20 Coin合约。
```
PS D:\SuiStarTrek\SuiStartrek\members\SlipyNinja\fungible_tokens> sui client publish --gas-budget 100000000 --skip-fetch-latest-git-deps
[warn] Client/Server api version mismatch, client api version : 1.18.1, server api version : 1.19.0
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING fungible_tokens

...
Successfully verified dependencies on-chain against source.
Transaction Digest: 9YjmoXEU1bD7mHekg6uv7XNqdvk1f1prxvRuyZqApZYd
...

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                
                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                              
                                │
│  ┌──                                                                                          
                                │
│  │ ObjectID: 0x1944e9a8c05a77213377e0e3b6b921218b3ccf7edf2638f13cea52db5a94df90               
                                │
│  │ Sender: 0xe1f49f3e0e178859feb9d93e3f452d05778a3505bbf08903239e7b830b5a7ef5                 
                                │
│  │ Owner: Account Address ( 0xe1f49f3e0e178859feb9d93e3f452d05778a3505bbf08903239e7b830b5a7ef5 )                              │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x4f5b99def55a530a4587d0103a50cfd5779608fbbf40c934f51032f3b95e260b::managed::MANAGED>   │
│  │ Version: 6                                                                                 
                                │
│  │ Digest: Ax2Wp4c64j16ZG1DLp1GgbfRYDpzj2HSw2c9qtyc5C8B                                       
                                │
│  └──                                                                                          
                                │
│  ┌──                                                                                          
                                │
│  │ ObjectID: 0x2b4a5d423a43c95db8fda7abe683920c94743b61e3a73c40e0c2019cbb4f298a               
                                │
│  │ Sender: 0xe1f49f3e0e178859feb9d93e3f452d05778a3505bbf08903239e7b830b5a7ef5                 
                                │
│  │ Owner: Account Address ( 0xe1f49f3e0e178859feb9d93e3f452d05778a3505bbf08903239e7b830b5a7ef5 )                              │
│  │ ObjectType: 0x2::package::UpgradeCap                                                       
                                │
│  │ Version: 6                                                                                 
                                │
│  │ Digest: EXRjiPEfk51Ec7wZcsXvsFgSNjSJKUc6NL7m14KXUUvp                                       
                                │
│  └──                                                                                          
                                │
│  ┌──                                                                                          
                                │
│  │ ObjectID: 0xa5faee8d7d8b0ddce66d53475396c8740d3ad8a79c57eedc94a8f05cab3f2d85               
                                │
│  │ Sender: 0xe1f49f3e0e178859feb9d93e3f452d05778a3505bbf08903239e7b830b5a7ef5                 
                                │
│  │ Owner: Immutable                                                                           
                                │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x4f5b99def55a530a4587d0103a50cfd5779608fbbf40c934f51032f3b95e260b::managed::MANAGED>  │
│  │ Version: 6                                                                                 
                                │
│  │ Digest: 3Jeqk4mizUHagjAFjWjzenRtkkTX5R5B5m6mZ2gAU5ej                                       
                                │
│  └──                                                                                          
                                │
│ Mutated Objects:                                                                              
                                │
│  ┌──                                                                                          
                                │
│  │ ObjectID: 0xe27c749b59ba48c7e42708d22e9600c398d832b9cc90bd3613db7a0a18d2b7b4               
                                │
│  │ Sender: 0xe1f49f3e0e178859feb9d93e3f452d05778a3505bbf08903239e7b830b5a7ef5                 
                                │
│  │ Owner: Account Address ( 0xe1f49f3e0e178859feb9d93e3f452d05778a3505bbf08903239e7b830b5a7ef5 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                 
                                │
│  │ Version: 6                                                                                 
                                │
│  │ Digest: 3oWQLWebw7zkx4PGahkc726pYDdRhj3NLr2bB9oo8Mhw                                       
                                │
│  └──                                                                                          
                                │
│ Published Objects:                                                                            
                                │
│  ┌──                                                                                          
                                │
│  │ PackageID: 0x4f5b99def55a530a4587d0103a50cfd5779608fbbf40c934f51032f3b95e260b              
                                │
│  │ Version: 1                                                                                 
                                │
│  │ Digest: Eo4NiPRruwmVem8tNgzb2suUebzUg7CrBXFgAekp5GAw                                       
                                │
│  │ Modules: managed                                                                           
                                │
│  └──                                                                                          
                                │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                               
    │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                          
    │
│  │ Owner: Account Address ( 0xe1f49f3e0e178859feb9d93e3f452d05778a3505bbf08903239e7b830b5a7ef5 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -12599880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```



