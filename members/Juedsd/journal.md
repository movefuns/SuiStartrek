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

## 三、基于sui链的NFT交易市场

（这一部分的图片还没有复制，可以直接去项目页翻看doc文件，后面会补齐）

从零开始搭建基于sui链的nft市场

前排声明，lz也是新手，在了解并学习了move智能合约编程后一直疑惑于怎么在前端网页调用合约，遂在翻阅官方文档与社区大佬的教程后做出尝试，如有错误恳请大佬指出，共同进步

可能会用到的链接：
https://suiexplorer.com/
（sui的区块链浏览器，用于查看和即时操作我们的合约）
https://sui.io/
（sui的官网）
https://discord.gg/sui
（sui的discord的邀请链接，可在上面申领sui的测试币）
https://react.dev/
（react的官网）
https://sdk.mystenlabs.com/dapp-kit/create-dapp
（sui的dapp构建教程）
Move 编程语言 (move-book.com)
（move编程的中文说明书）
Introduction | React Bootstrap (react-bootstrap.github.io)
（react bootstrap）

一、环境设置与软件安装

本项目基于react框架和move编程语言，使用的工具为vscode
move语言的本地安装官方社区已经有很多更好的教程，在此就附上链接了
《SUI MOVE中文系列课程》SUI官方认证 Move智能合约语言入门指南_哔哩哔哩_bilibili（B站中文教程）
https://docs.sui.io/guides/developer/getting-started/sui-environment（sui的官方文档）
关于vscode的安装在此不多赘述，这里给出需要的插件


move的编译插件，用于检查move语法有没有错误，且高亮move语法，建议安装

二、开始构建我们的dapp应用

安装Sui dApp Kit
在创建好我们的项目文件夹之后，要想使用sui的dapp构建功能，我们需要在项目文件夹中安装Sui dApp Kit，在cmd或者vscode的终端中使用命令进行安装（选一个安装，取决于你电脑用的是什么）
npm i --save @mysten/dapp-kit @mysten/sui.js @tanstack/react-query
pnpm add @mysten/dapp-kit @mysten/sui.js @tanstack/react-query
yarn add @mysten/dapp-kit @mysten/sui.js @tanstack/react-query
安装好后文件夹内如下

随后，我们就可以用npm create @mysten/dapp命令来创建一个sui dapp框架了
输入命令后，终端会出现后续的选择页面

react-client-dapp是一个基本的 React dApp，用于获取连接的钱包拥有的对象列表。
react-e2e-counter则是带有 Move 代码和简单计数器应用程序 UI 的端到端示例。
这里选哪个都是可以的，我这里选择的是第二个选项，选择完成后会引导进入文件命名

命名完成后即创建完成，完成后文件夹如图所示

随后npm install @radix-ui/themes安装sui自带的ui框架
安装完成后再执行npm i --save-dev @types/react和npm i --save-dev @types/react-dom以及npm install vite --save-dev以安装react框架，这样就没有报错了

关于其中的各个文件夹
其中move文件夹是存放我们编写的智能合约的地方，src则是编写前端与js逻辑的地方。
在move的resource文件夹中，我们存放和编写.move智能合约文件；
Src的json与cjs文件是设置文件，一般情况下不需要我们去编写它们，除非你想产生一些奇怪的错误；
蓝色的ts文件和tsx文件是我们可以编写的文件，这里我们可以设置我们的前端网页与js逻辑；一般来说，如果你的代码只包含js逻辑，则使用ts为后缀；如果代码需要描述html元素，则使用支持jsx的tsx文件；

关于src文件夹下的文件
Main：用于总体渲染我们的前端框架

在这里通过一个主要函数将我们app的内容呈现到前端，这里因为我们要把合约部署到testnet，所以记得改一下defaultnetwork的设置。
networkConfig：网络设置文件，用来设置使用的网络的文件，同样添加一个testnet选项

Constants：合约地址的文件，这里同样需要添加一个testnet的格式。并置入我们的合约地址。

vite-env.d：不知道什么东西，不要动它。
Counter与CreateCounter：官方的示例代码，就是项目的具体逻辑，选第一个的可能没有这两个文件。
App：总输出函数，我们要把写的逻辑和前端页面放到这里来，最后app被送到main中进行总渲染，出来的就是我们看到的页面了。

当然因为我们要调用的是链上的合约，所以实际上你合约放哪都没问题，只要在编写完后上传到sui链上就行。

测试币的申领在注册完discord后可以在sui的discord的testnet-faucet频道中通过!faucet <地址>的指令格式申领

三、智能合约的编写

介绍完上面的页面，我们就可以正式开始建设我们的项目了。在开始建设前端市场之前，我们需要编写一个用于和链上交互的智能合约。以便nft属性的设置和市场逻辑的实现。
关于move编程会遇到的一些问题，大家可以直接去看我的github
（https://github.com/Juedsd/Sui_move_1/blob/main/journal.md）
这里就不多赘述了，我们直接开始编写部分
1、NFT合约

首先，我们先创建一个module，这里我命名的module是book_nft，中间的booknft是我的包名，切记不要写错。
然后我们引入一些sui定义的一些关键字，用于后面的定义

随后我们创建一个struct结构体，来定义这个nft的基础属性
struct BookNFT has key, store {
        id: UID,
        title: string::String,
        author: address,
        description:  string::String,
        content: string::String,
        url: Url,
    }
其中id是定义nft所必须的属性，用于表明nft的唯一id，中间则是我们自己定义的属性，最后我url则是用来显示nft的封面图片。
接下来是一个状态结构体NFTMinted，我们用这个来记录mint的nft的id，以及mint的地址
struct NFTMinted has copy, drop {

        object_id: ID,
        creator: address,
        name: string::String,
    }

然后是最重要的mint函数，这里我们参考sui的官方合约的写法
public entry fun mint_to_sender(
        title: vector<u8>,
        description: vector<u8>,
        content: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = BookNFT {
            id: object::new(ctx),
            title: string::utf8(title),
            description: string::utf8(description),
            content: string::utf8(content),
            author: sender,
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.title,
        });
        transfer::public_transfer(nft, sender);
    }
即将之作为一个公共函数，并以我们创建的那些为参数，接收参数并铸造一个新的NFT，记录mint地址信息后将该NFT发送至该地址。
最后是定义的transfer发送函数和burn销毁函数，顾名思义，他们被用来进行NFT的发送和销毁
public entry fun transfer(
        nft: BookNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }


    public entry fun burn(nft: BookNFT, _: &mut TxContext) {
        let BookNFT { id, title: _,author: _, description: _, content: _, url: _ } = nft;
        object::delete(id)
    }
至此，我们的NFT合约就已经编写完成，它包括基础的铸造（mint），发送（transfer）和销毁（burn）功能，能够执行一些基础的操作，当然这里只是一个基础的NFT示例，读者也可以参照资料来完善，编写更高级的NFT。

2、市场合约

这一部分我们主要参照的是官方的市场合约示例（可以在），官方的示例包括创建市场，上架&下架，购买和获利等基本内容，这里我们主要关注获利之外的内容，并介绍他们的用法。
首先，同我们的NFT合约一样，市场合约先进行module的创建和关键词的导入

随后就是各个市场合约函数的设置以及他们的功能
首先是结构体的定义，这个分别是市场的定义以及list的商品的定义

然后是创建市场以及上架函数的定义。
其中create函数接受一个coin的类型，即告诉我们这个市场接受何种同质化代币，调用时我们需要将其代币的地址作为参数输入。
List上架函数则需要我们将NFT类型（合约地址）coin类型，市场id（即我们刚刚创建的市场的id），nftid以及ask报价这五个参数传入。它会将nft储存到我们创建的市场里面，作为一个动态对象存在。


然后是delist和delistandtake函数，这两个函数配套使用，用户调用public的delistandtake函数来下架他们的nft以及取回。这个函数需要四个参数，即nft类型，coin类型，市场id，nftid。

接下来是buy和buyandtake函数，同样的，他们也是一组共同使用的函数，buy函数来处理购买的内部逻辑，而buyandtake对外开放调用。这个函数需要五个参数，分别是NFT类型，coin类型，市场id，nftid，以及支付coinid。（关于支付硬币id，我们的sui在区块链上是一一组一组的coin体现的，因此当支付时我们就需要来获取到他们的id来使用，这个合约内部有对于coin的检测，所以我们需要在支付之前分割出符合售价的coin，后面会实现）

剩下还有个take_profits获利函数，这里就不细讲了。市场合约的全部代码编写完毕。
接下来，我们需要将这份合约发布到链上，在外面的合约文件夹内使用cmd运行sui move build指令来检测我们的合约有没有语法错误？没有问题的话就可以用sui client publish --gas-budget 30000000 --skip-dependency-verification指令来将我们的项目发布到链上了(需要账户中有gas)成功后我们可以在cmd中找到我们的合约地址，并在sui的区块链浏览器中找到它。（此处具体信息参考我的github文件
https://github.com/Juedsd/Sui_move_1/blob/main/journal.md

至此，智能合约部分完结，然后我们就可以开始来进行前端的编写和前端对合约的调用了。
注：合约代码
module booknft::marketplace {
    use sui::dynamic_object_field as ofield;
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self, ID, UID};
    use sui::coin::{Self, Coin};
    use sui::transfer;
    use sui::url::{Self, Url};
    use std::string;
    use sui::event;

    const EAmountIncorrect: u64 = 0;

    const ENotOwner: u64 = 1;

    struct Marketplace<phantom COIN> has key {
        id: UID,
    }

    struct Listing has key, store {
        id: UID,
        ask: u64,
        owner: address,
    }

    /// Create a new shared Marketplace.
    public entry fun create<COIN>(ctx: &mut TxContext) {
        let id = object::new(ctx);
        transfer::share_object(Marketplace<COIN> { id })
    }

    /// List an item at the Marketplace.
    public entry fun list<T: key + store, COIN>(
        marketplace: &mut Marketplace<COIN>,
        item: T,
        ask: u64,
        ctx: &mut TxContext
    ) {
        let item_id = object::id(&item);
        let listing = Listing {
            ask,
            id: object::new(ctx),
            owner: tx_context::sender(ctx),
        };

        ofield::add(&mut listing.id, true, item);
        ofield::add(&mut marketplace.id, item_id, listing)
    }

    public fun delist<T: key + store, COIN>(
        marketplace: &mut Marketplace<COIN>,
        item_id: ID,
        ctx: &TxContext
    ): T {
        let Listing {
            id,
            owner,
            ask: _,
        } = ofield::remove(&mut marketplace.id, item_id);

        assert!(tx_context::sender(ctx) == owner, ENotOwner);

        let item = ofield::remove(&mut id, true);
        object::delete(id);
        item
    }

    public entry fun delist_and_take<T: key + store, COIN>(
        marketplace: &mut Marketplace<COIN>,
        item_id: ID,
        ctx: &TxContext
    ) {
        let item = delist<T, COIN>(marketplace, item_id, ctx);
        transfer::public_transfer(item, tx_context::sender(ctx));
    }

    public fun buy<T: key + store, COIN>(
        marketplace: &mut Marketplace<COIN>,
        item_id: ID,
        paid: Coin<COIN>,
    ): T {
        let Listing {
            id,
            ask,
            owner
        } = ofield::remove(&mut marketplace.id, item_id);

        assert!(ask == coin::value(&paid), EAmountIncorrect);
        if (ofield::exists_<address>(&marketplace.id, owner)) {
            coin::join(
                ofield::borrow_mut<address, Coin<COIN>>(&mut marketplace.id, owner),
                paid
            )
        } else {
            ofield::add(&mut marketplace.id, owner, paid)
        };
        let item = ofield::remove(&mut id, true);
        object::delete(id);
        item
    }
    public entry fun buy_and_take<T: key + store, COIN>(
        marketplace: &mut Marketplace<COIN>,
        item_id: ID,
        paid: Coin<COIN>,
        ctx: &TxContext
    ) {
        transfer::public_transfer(
            buy<T, COIN>(marketplace, item_id, paid),
            tx_context::sender(ctx)
        )
    }

    /// Take profits from selling items on the `Marketplace`.
    public fun take_profits<COIN>(
        marketplace: &mut Marketplace<COIN>,
        ctx: &TxContext
    ): Coin<COIN> {
        ofield::remove<address, Coin<COIN>>(&mut marketplace.id, tx_context::sender(ctx))
    }

    /// Call [`take_profits`] and transfer Coin to the sender.
    public entry fun take_profits_and_keep<COIN>(
        marketplace: &mut Marketplace<COIN>,
        ctx: &TxContext
    ) {
        transfer::public_transfer(
            take_profits(marketplace, ctx),
            tx_context::sender(ctx)
        )
    }
}

module booknft::book_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct BookNFT has key, store {
        id: UID,
        title: string::String,
        author: address,
        description:  string::String,
        content: string::String,
        url: Url,

    }

    struct NFTMinted has copy, drop {

        object_id: ID,
        creator: address,
        name: string::String,
    }

    public fun name(nft: &BookNFT): &string::String {
        &nft.title
    }

    public fun description(nft: &BookNFT): &string::String {
        &nft.description
    }

    public fun content(nft: &BookNFT): &string::String {
        &nft.content
    }

    public fun url(nft: &BookNFT): &Url {
        &nft.url
    }

    public entry fun mint_to_sender(
        title: vector<u8>,
        description: vector<u8>,
        content: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = BookNFT {
            id: object::new(ctx),
            title: string::utf8(title),
            description: string::utf8(description),
            content: string::utf8(content),
            author: sender,
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.title,
        });

        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer(
        nft: BookNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    public entry fun update_description(
        nft: &mut BookNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    public entry fun burn(nft: BookNFT, _: &mut TxContext) {
        let BookNFT { id, title: _,author: _, description: _, content: _, url: _ } = nft;
        object::delete(id)
    }
}

四、前端用户界面搭建——铸造NFT界面

在完成了合约的编写后，我们就可以开始我们的用户端搭建，并调用编写的合约了。
那么到我们之前创建的dapp项目这里来。我们可以在package.json文件中找到一个调试按钮，点击这里来运行我们的项目，在vscod启动后运行过一次，下面就可以通过终端执行同样的运行代码来启动项目了（我也不知道为什么，但是确实直接运行指令就不行）

启动后的界面类似

这时候我们可以通过在终端中按o，来在浏览器中打开我们的项目，同时按q来退出。
初次运行应该是官方的模版，不过那不重要，就让我们从官方的模版中更改，将其变为一个铸造nft的页面。
我们在官方模版的createcounter中来编写我们mint界面的逻辑，并重命名为mint。还记得我们为NFT设置的参数属性吗？，让我们来写一个html表单以便用户输入参数。（这里采用的是bootstrap的模版，读者也可以采用其他的前端css模版框架）
同模版一样，我们可以写一个函数，在函数的return中写入html表单的标签，在函数内部定义表单属性对应的变量。用onchange函数来设置他们的变动更改记录。

随后，我们大周期函数内部创建一个mint函数来作为我们表单的提交函数。这个函数接受一个表单事件作为参数，并阻止了表单的默认提交事件。然后我们new一个名叫txb的交易区块，我们就可以把交易挂载到这个交易区块上，并向链上发起交易。让我们通过txb.movecall方法来锁定我们上传到链上的nft的mint公共接口。随后将我们表单的参数置入进去作为传参，最后signAndExecute签署交易就可以完成一次调用了，onSuccess则是完成调用后要执行的事件。


至此，mint界面就已经编写完成，铸造完成后，你可以在自己的钱包中看到NFT

五、前端用户界面搭建——MyAssert上架界面

铸造完NFT，下一步就是上架我们刚刚创造的NFT，但在此之前，我们要先创建一个该NFT的市场，创建市场的操作直接在区块链浏览器上调用create函数就可，coin类型可以写sui（0x2::sui::SUI）。随后我们就可以尝试向该市场上架我们创建的NFT了。

首先，我们创建一个名为Myassert.tsx的文件来编写我们的个人资产界面。与先前的mint不同，这次我们先创建一个初始化函数，再由初始化函数获取到数据后传递给含有html标签的市场函数。

在初始化函数中，我们首先检查钱包是否链接，确认链接后我们通过sui官方提供的SuiClient类来链接到网络的 JSON-RPC 服务器。并从服务器中获取当前账户的拥有所有的object数据。并将数据传递给下一层函数

对于传过来的数据，我们先过滤出他们的objectid，因为不是所有的NFT都是我们想要的，符合这个市场的类型的，所以我们要根据查询到的object数据进行过滤。

通过我们获取到的objectid，我们对其对应的object进行排查，当检测到其type等于我们的nfttype，就将其添加到我们的数组中，这里的Mycard是自己对于数据格式的定义，它可以使得数据按我们想要的格式排列。

在得到我们想要的数据后，我们就可以尝试在return函数中把他们展示到前端页面中去了，这里我用到了bootstrap的卡片来设置，显示NFT的基础信息，并写一个list按钮（用于调用后面编写的list函数）和detail按钮（用于查看完整的信息），点击这两个按钮都会出现对应的模态框。




现在已经可以在前端页面看到自己的NFT资产了，随后我们编写最后的list函数来完成Myassert页面的搭建。那么我们想要上架一个商品，该如何确定是哪一个NFT呢？我们可以先用一个函数来确定和设置我们想要上架的NFT，触发方式就是点击那两个按钮。

在确认好数据后，同我们先前的mint函数一样，我们在list函数中创建交易块并调用movecall方法，对链上的市场module中的list函数进行调用即可，需要注意的是，在五个参数中，nfttype和cointype是作为typeArguments上传的而另外的三个则是Arguments参数。

至此我们的NFT上架页面就编写完成，离我们的市场实现又进了一步。
关于页面跳转，我这里是用的route来进行跳转的，这里大家可以自行搜索route的教程，效果是一样的，我这里展示一下我的route相关代码



六、前端用户界面搭建——市场界面

接下来就是最为关键的市场交易部分了，这一部分比较复杂，我们采取的是多级函数传递的方式来构建完整的市场。
首先，同我们的Myassert一样，我们先编写一个初始化函数。用来得到我们创建的市场对象的动态对象池。（与在钱包不同，我们的NFT在市场中是以动态对象存放在市场对象的动态池里面的）

在得到这些数据后，我们在下一级函数中对数据进行进一步的查询。获取type，name数组和id，name数组。其中第一个用于下面循环构建查询函数。另一组则与构建好的查询函数数据传递到下个函数备用

在下级函数中接收上级传来的查询方法数据并执行，将执行后的数据向下传递

至此，前期数据准备工作已经完成，接下来的数据我们都将在最后一个函数内处理并使用。
首先是整理接收到上级的数据，从中筛选出object的id属性，这里可能会有人感到奇怪，前面我们不是已经获取到id了吗，为什么这里还要重新获取一遍id？这是因为我们上架的NFT在市场中不是以NFT的object形式存在的。还记得我们前面提到过的动态对象吗？我们上架的NFT在市场中是以名叫list的动态对象的形式存在，其也有一个独特的id属性，而我们nft的id则处于其value中储存。

通过查询到的数据，进行list订单（ask报价）与nft信息的查询

设置数据格式，留作前端备用

同myassert的一样，通过这些数据我们就可以在return中构建前端页面了

以及，同样的，我们通过函数唤醒模态框并设置订单id，在模态框中进行后续的购买操作。

但与上架不同，购买的参数需要我们提供一个等值于报价的coin的id，为此，我们需要查询该钱包的中的账户余额，并分割出这样一个coin。

分割硬币的方法是用交易块自带的的splitCoins方法，置入分割的coinid和分割数量即可分割，这里的gas即是默认的账户coin。

有了硬币id后我们就可以进行上架商品的购买工作了，同上架一样，调用movecall，选择buy方法并传入5个参数，这里为了确保有可用的coin，我设定的是必须先进行分割coin的操作，然后才能进行buy函数的调用。



至此购买功能就已实现，还剩下最后的delist下架功能，这个功能的调用也非常简单，但问题是如何筛选出该账户上架的NFT，这里我采取的笨办法直接遍历。

因为我们的id数组的顺序和NFT数据的数组顺序是一样的，因此在查询到数据后我们就可以直接选择数据中同位置的数据，而不用对此专门再次查询数据。
这里为了放到同一页面，我直接在market页面中做了一个滑动按钮组，来对市场与delist的container容器进行隐藏与显示的操作实现一个简单的页内跳转。



然后再设置delist函数就可以啦

至此，市场的基本功能就已经设计完成，详细的代码可以参考我的github
