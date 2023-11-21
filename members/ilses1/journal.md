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

ERC是"EthereumRequest for Comment"也就是“以太坊征求意见协议”的缩写。

借助ERC-20，用户可以通过持有其中**一种储值卡（token）很方便地享受整个生态的各种服务**；商户（开发者）则节约了开发运营成本、同时提升了获取用户的效率；而物业公司（以太坊基金会和矿工）则可以通过做大生态体量实现更多的租金（ETH增值）和储值卡结算手续费（Gas费用）收入。

https://docs.sui.io/guides/developer/first-app/write-package

- 3.1  创建程序包,打开powershell执行以下命令

~~~shell
sui move new my_first_package
~~~

执行成功，使用vscode打开文件如下<img src="journal/image-20231117011834584.png" alt="image-20231117011834584" style="zoom: 50%;" />

- 3.2 在sources下新建文件my_module.move

  <img src="journal/image-20231117012015165.png" alt="image-20231117012015165" style="zoom:50%;" />

- 复制一下代码到my_module.move

- 以下代码分为三个部分，1.引入，2.类型定义，3.函数定义

~~~rust
module my_first_package::my_module {

    // Part 1: Imports
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // Part 2: Struct definitions
    struct Sword has key, store {
        id: UID,
        magic: u64,
        strength: u64,
    }

    struct Forge has key, store {
        id: UID,
        swords_created: u64,
    }

    // Part 3: Module initializer to be executed when this module is published
    fun init(ctx: &mut TxContext) {
        let admin = Forge {
            id: object::new(ctx),
            swords_created: 0,
        };
        // Transfer the forge object to the module/package publisher
        transfer::transfer(admin, tx_context::sender(ctx));
    }

    // Part 4: Accessors required to read the struct attributes
    public fun magic(self: &Sword): u64 {
        self.magic
    }

    public fun strength(self: &Sword): u64 {
        self.strength
    }

    public fun swords_created(self: &Forge): u64 {
        self.swords_created
    }

    // Part 5: Public/entry functions (introduced later in the tutorial)

    // Part 6: Private functions (if any)

}
~~~

- 3.3打包
- 执行以下命令

~~~
sui move build
~~~

- 打包成功

  <img src="journal/image-20231117013249235.png" alt="image-20231117013249235" style="zoom:50%;" />

<img src="journal/image-20231117013307728.png" alt="image-20231117013307728" style="zoom:50%;" />

- 3.4测试打包

- 执行以下命令

  ~~~
  sui move test
  ~~~

<img src="journal/image-20231117013723478.png" alt="image-20231117013723478" style="zoom:50%;" />

测试通过，因为测试为0，也就没有失败。

在my_module.move中加入以下代码

```rust
    #[test]
    public fun test_sword_create() {
    use sui::transfer;

        // Create a dummy TxContext for testing
        let ctx = tx_context::dummy();

        // Create a sword
        let sword = Sword {
            id: object::new(&mut ctx),
            magic: 42,
            strength: 7,
        };

        // Check if accessor functions return correct values
        assert!(magic(&sword) == 42 && strength(&sword) == 7, 1);
        // Create a dummy address and transfer the sword
        let dummy_address = @0xCAFE;
        transfer::transfer(sword, dummy_address);
    }
```

<img src="journal/image-20231117015155064.png" alt="image-20231117015155064" style="zoom:50%;" />

单元测试通过



增加以下特殊测试

~~~rust
    public entry fun sword_create(magic: u64, strength: u64, recipient: address, ctx: &mut TxContext) {
        use sui::transfer;

        // create a sword
        let sword = Sword {
            id: object::new(ctx),
            magic: magic,
            strength: strength,
        };
        // transfer the sword
        transfer::transfer(sword, recipient);
    }

    public entry fun sword_transfer(sword: Sword, recipient: address, _ctx: &mut TxContext) {
        use sui::transfer;
        // transfer the sword
        transfer::transfer(sword, recipient);
    }
~~~

~~~rust
    #[test]
    fun test_sword_transactions() {
        use sui::test_scenario;

        // create test addresses representing users
        let admin = @0xBABE;
        let initial_owner = @0xCAFE;
        let final_owner = @0xFACE;

        // first transaction to emulate module initialization
        let scenario_val = test_scenario::begin(admin);
        let scenario = &mut scenario_val;
        {
            init(test_scenario::ctx(scenario));
        };
        // second transaction executed by admin to create the sword
        test_scenario::next_tx(scenario, admin);
        {
            // create the sword and transfer it to the initial owner
            sword_create(42, 7, initial_owner, test_scenario::ctx(scenario));
        };
        // third transaction executed by the initial sword owner
        test_scenario::next_tx(scenario, initial_owner);
        {
            // extract the sword owned by the initial owner
            let sword = test_scenario::take_from_sender<Sword>(scenario);
            // transfer the sword to the final owner
            sword_transfer(sword, final_owner, test_scenario::ctx(scenario))
        };
        // fourth transaction executed by the final sword owner
        test_scenario::next_tx(scenario, final_owner);
        {
            // extract the sword owned by the final owner
            let sword = test_scenario::take_from_sender<Sword>(scenario);
            // verify that the sword has expected properties
            assert!(magic(&sword) == 42 && strength(&sword) == 7, 1);
            // return the sword to the object pool (it cannot be simply "dropped")
            test_scenario::return_to_sender(scenario, sword)
        };
        test_scenario::end(scenario_val);
    }
~~~

<img src="journal/image-20231117015448731.png" alt="image-20231117015448731" style="zoom:50%;" />

通过测试

- 3.5发布包



## 4.完成ERC20的发布



## 5.前端方向的 Hello world

- 全局安装pnpm
- <img src="journal/image-20231120202139968.png" alt="image-20231120202139968" style="zoom:50%;" />
- 创建项目

- <img src="journal/image-20231120202305185.png" alt="image-20231120202305185" style="zoom:50%;" />
