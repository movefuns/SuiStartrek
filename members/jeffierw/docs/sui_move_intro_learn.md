# sui move 导论学习笔记

## unit 1

### 配置环境

[安装sui以及vscode plugin在之前已完成](./sui_install.md)

### sui项目结构

sui module是一堆functions 以及一堆结构体的结合，被开发者发布到链上。

已发布的sui module 是不可变对象（immutable objects），无法修改，转移或者删除。

多个sui module 外加一个Move.toml文件构成一个sui package。

使用`sui move new <PACKAGE NAME>`创建sui package。

Move.toml类似package.json，包含三个部分：

- [package] 声明了该 package 的命名和版本数
- [dependencies] 声明了该 package 依赖的其他 package
- [addresses] 声明了该 package 源代码中地址的别名

sui move package 命名规范使用蛇形命名法 snake casing, i.e. this_is_snake_casing.

sui module 名称会使用 Rust 路径分隔符`::`来分开 package 名和 module 名。

### 定制类型和能力

sui move类似move语法定义结构体时拥有四个`ablities`能力：

- `copy` 允许结构体被复制
- `drop` 允许结构体被丢弃
- `store` 允许结构体被存储
- `key` 允许结构体被作为键使用

sui move 定义了两种定制类型：

- `struct` 定义了一种结构体
- `enum` 定义了一种枚举

### 函数

函数可见性：
- `private`：只能被定义module访问，函数定义默认为private
- `public`：可以被定义module访问，也可以被其他定义module的函数访问
- `public(script)`：可以被定义module访问，也可以被其他定义为[该module的白名单](https://diem.github.io/move/friends.html)上包含的module的函数访问

entry入口函数： 在sui move中 entry函数可以被交易 transactions 直接调用 该函数需满足：
- 被关键词 `entry` 标注
- 没有返回值
- (可选) 最后一个参数是 `TxContext` 类型实例的可变引用

transaction context 交易上下文：

- entry 函数通常使用 `TxContext` 类型实例作为最后一个参数。这是由 Sui Move 虚拟机指定的特殊参数。在用户调用函数时不需要指定该参数，只需要输入其他参数即可。
- `TxContext` object 包含了关于交易的基本信息，比如 sender 的地址，signer 的地址，tx 的 epoch 数等。这些信息在调用 entry 函数时可能会被用到。

hello_world.move例子
```rust
// mint函数创建了HelloWorldObject的实例object，并使用transfer模块的transfer方法把object实例传递给模块的调用者
module sui_hello_world::hello {
  use std::string;
  use sui::object::{Self, UID};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};

  struct HelloWorldObject has key, store {
    id: UID,
    text: string::String
  }

  public entry fun mint(ctx: &mut TxContext) {
    let object = HelloWorldObject {
      id: object::new(ctx),
      text: string::utf8(b"Hello World!")
    };
    transfer::transfer(object, tx_context::sender(ctx))
  }
}
```

### Hello World

部署：`sui client publish --gas-budget 10000000`
```shell
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING sui_hello_world
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
3AUkZjSmK7YnJQMgPKAGRG4Zp1kPDXQonAWxA7f1v3jD
----- Transaction Data ----
Transaction Signature: [Signature(Ed25519SuiSignature(Ed25519SuiSignature([0, 247, 163, 47, 240, 240, 51, 141, 99, 32, 18, 216, 55, 21, 245, 76, 182, 200, 62, 57, 0, 166, 89, 44, 181, 11, 212, 160, 170, 156, 185, 127, 255, 225, 108, 57, 182, 64, 56, 35, 78, 10, 65, 61, 22, 240, 249, 83, 205, 153, 237, 242, 204, 30, 143, 185, 13, 33, 80, 73, 36, 24, 187, 16, 12, 147, 65, 17, 209, 59, 150, 166, 162, 172, 118, 74, 194, 201, 128, 115, 3, 118, 8, 195, 217, 163, 34, 159, 242, 134, 61, 187, 6, 230, 168, 184, 199])))]
Transaction Kind : Programmable
Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab" })]
Commands: [
  Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002),
  TransferObjects([Result(0)],Input(0)),
]

Sender: 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab
Gas Payment: Object ID: 0xa4e7e8ece137bc292d6ee6157f3ac70766b1d23047c953da208def5e5ee8f544, version: 0xbb030, digest: 7XKTr72k5fouwzD5SttzJYUKkbfb99n1JNjY9ENvGwf4 
Gas Owner: 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab
Gas Price: 1000
Gas Budget: 10000000

----- Transaction Effects ----
Status : Success
Created Objects:
  - ID: 0x77c7b830b60cdd349bff3889c813899e973a5f6289d763710c57e36c4aed602b , Owner: Immutable
  - ID: 0xf0289d9e56eff9b3fbabd1d6dfe434a7ff38efc911a063e0a1a6627716fa9ea2 , Owner: Account Address ( 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab )
Mutated Objects:
  - ID: 0xa4e7e8ece137bc292d6ee6157f3ac70766b1d23047c953da208def5e5ee8f544 , Owner: Account Address ( 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab )

----- Events ----
Array []
----- Object changes ----
Array [
    Object {
        "type": String("mutated"),
        "sender": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        "owner": Object {
            "AddressOwner": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        },
        "objectType": String("0x2::coin::Coin<0x2::sui::SUI>"),
        "objectId": String("0xa4e7e8ece137bc292d6ee6157f3ac70766b1d23047c953da208def5e5ee8f544"),
        "version": String("766001"),
        "previousVersion": String("766000"),
        "digest": String("DqpsDt6WWQXQPce3kQtPDWt5oY4SYL7cwTVqmY5ihPEi"),
    },
    Object {
        "type": String("published"),
        "packageId": String("0x77c7b830b60cdd349bff3889c813899e973a5f6289d763710c57e36c4aed602b"),
        "version": String("1"),
        "digest": String("2mdbJNpuG1kiKxjdeuRS6DsJh3oqMkPgeYyXKQ9jM9oD"),
        "modules": Array [
            String("hello"),
        ],
    },
    Object {
        "type": String("created"),
        "sender": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        "owner": Object {
            "AddressOwner": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        },
        "objectType": String("0x2::package::UpgradeCap"),
        "objectId": String("0xf0289d9e56eff9b3fbabd1d6dfe434a7ff38efc911a063e0a1a6627716fa9ea2"),
        "version": String("766001"),
        "digest": String("5jvc6tksMU1b8hzqEP1K5b34WiDuMC3Wk2eTYrowEGSJ"),
    },
]
----- Balance changes ----
Array [
    Object {
        "owner": Object {
            "AddressOwner": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        },
        "coinType": String("0x2::sui::SUI"),
        "amount": String("-7713080"),
    },
]
```

在 `Created Objects` 下面的三个对象id 其中owner是`Immutable`的是已发布的module，ID是刚才发布的 Hello World package 智能合约的 object ID.

使用export命令保存这个ID值 之后可以通过call命令来调用我们的hello world模块
`export PACKAGE_ID=<在先前输出信息中的 package object ID>`

因为我们hello world模块的mint函数是entry函数 可以直接被transactions直接调用

`sui client call --function mint --module hello_world --package $PACKAGE_ID --gas-budget 300000000`

执行结果 Created Objects第一个ID是执行mint后创建并转移的object ID
```shell
----- Transaction Digest ----
Ci653WgFueBEDPz266LS37c2GkdC7zp3hZ5WYEnCajAe
----- Transaction Data ----
Transaction Signature: [Signature(Ed25519SuiSignature(Ed25519SuiSignature([0, 37, 194, 244, 193, 170, 128, 96, 32, 0, 21, 187, 140, 65, 216, 18, 126, 214, 233, 93, 218, 42, 3, 198, 151, 117, 61, 83, 31, 172, 77, 3, 68, 251, 49, 231, 65, 69, 4, 213, 91, 182, 236, 218, 223, 24, 120, 240, 170, 199, 106, 153, 27, 114, 111, 28, 131, 207, 104, 90, 94, 232, 254, 175, 2, 147, 65, 17, 209, 59, 150, 166, 162, 172, 118, 74, 194, 201, 128, 115, 3, 118, 8, 195, 217, 163, 34, 159, 242, 134, 61, 187, 6, 230, 168, 184, 199])))]
Transaction Kind : Programmable
Inputs: []
Commands: [
  MoveCall(0x77c7b830b60cdd349bff3889c813899e973a5f6289d763710c57e36c4aed602b::hello::mint()),
]

Sender: 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab
Gas Payment: Object ID: 0xa4e7e8ece137bc292d6ee6157f3ac70766b1d23047c953da208def5e5ee8f544, version: 0xbb031, digest: DqpsDt6WWQXQPce3kQtPDWt5oY4SYL7cwTVqmY5ihPEi 
Gas Owner: 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab
Gas Price: 1000
Gas Budget: 300000000

----- Transaction Effects ----
Status : Success
Created Objects:
  - ID: 0x7ce65831075bbd315fde74247ccf5407cd1a4594cc02107b1586a639d380e0f8 , Owner: Account Address ( 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab )
Mutated Objects:
  - ID: 0xa4e7e8ece137bc292d6ee6157f3ac70766b1d23047c953da208def5e5ee8f544 , Owner: Account Address ( 0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab )

----- Events ----
Array []
----- Object changes ----
Array [
    Object {
        "type": String("mutated"),
        "sender": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        "owner": Object {
            "AddressOwner": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        },
        "objectType": String("0x2::coin::Coin<0x2::sui::SUI>"),
        "objectId": String("0xa4e7e8ece137bc292d6ee6157f3ac70766b1d23047c953da208def5e5ee8f544"),
        "version": String("766002"),
        "previousVersion": String("766001"),
        "digest": String("3yfWapr3zmka2WMDhZ3N4i4KWfrJB8XPkNbztYJkxGhQ"),
    },
    Object {
        "type": String("created"),
        "sender": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        "owner": Object {
            "AddressOwner": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        },
        "objectType": String("0x77c7b830b60cdd349bff3889c813899e973a5f6289d763710c57e36c4aed602b::hello::HelloWorldObject"),
        "objectId": String("0x7ce65831075bbd315fde74247ccf5407cd1a4594cc02107b1586a639d380e0f8"),
        "version": String("766002"),
        "digest": String("GNQT8rMCiVzrtZQwzUBYMtYCkB1e7Z41jVmu8kbqdaKA"),
    },
]
----- Balance changes ----
Array [
    Object {
        "owner": Object {
            "AddressOwner": String("0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"),
        },
        "coinType": String("0x2::sui::SUI"),
        "amount": String("-2461480"),
    },
]
```

## unit 2

### 使用sui objects

一个结构体当拥有`key`关键字和内部添加全局唯一的 id: UID 属性时才算是一个sui object。
```rust
use sui::object::{UID};

struct TranscriptObject has key {
    id: UID,
    history: u8,
    math: u8,
    literature: u8,
}
```

创建一个 sui object

创建一个 Sui object 需要一个唯一ID, 我们可以根据当前 TxContext 中的信息，使用 sui::object::new 函数来创建一个新的 ID.

在 Sui 当中，每个 object 都必须拥有一个所有者，这个所有者可以是地址，别的 object, 或者就被所有人共享。在我们的例子中，我们想让新建的 transcriptObject 属于交易发起者。这可以先使用 tx_context::sender 函数获得当前 entry 函数调用者也就是交易发起者 sender 的地址，然后用 Sui framework 中的 transfer 函数转移所有权。

```rust
use sui::object::{Self};
use sui::tx_context::{Self, TxContext};
use sui::transfer;

public entry fun create_transcript_object(history: u8, math: u8, literature: u8, ctx: &mut TxContext) {
  let transcriptObject = TranscriptObject {
    id: object::new(ctx),
    history,
    math,
    literature,
  };
  transfer::transfer(transcriptObject, tx_context::sender(ctx))
}
```

### 所有权

sui中的所有object都有一个所有权的概念，
- 被拥有： 1.被一个地址拥有 2.被另一个object拥有
- 共享：1.不可变的共享 2.可变的共享

其中被拥有里面 被一个地址拥有的情况:
`transfer::transfer(transcriptObject, tx_context::sender(ctx))`
将`transcriptObject`通过`transfer`函数传递给`ctx`
被另一个object拥有的情况：`dynamic_object_field`当一个 object 被另一个 object 拥有时，我们可以将其称为 子object.

不可变的共享object可以使用`transfer::freeze_object(obj)`手动让object不可变
创建可变的共享object可以使用`transfer::share_object(obj)`，任何人都可以发起交易改变object

### 参数传递和删除object

参数传递可以分为值传递，不可变引用传递和可变引用传递

```rust
use sui::object::{Self};

// 你被许可获取分数但不能修改它
public fun view_score(transcriptObject: &TranscriptObject): u8{
    transcriptObject.literature
}

// 你被允许查看和编辑分数，但不能删除它
public entry fun update_score(transcriptObject: &mut TranscriptObject, score: u8){
    transcriptObject.literature = score
}

// 你被允许对分数做任何的操作，包括查看、编辑、删除整个 transcript 
public entry fun delete_transcript(transcriptObject: TranscriptObject){
    let TranscriptObject {id, history: _, math: _, literature: _ } = transcriptObject;
    object::delete(id);
}
```

删除object和struct解包

上面的`delete_transcript`展示了如何删除一个object 需要先解包 类似js的解构，获取object id，然后delete

### 对象包裹

```rust
struct WrappableTranscript has store {
    history: u8,
    math: u8,
    literature: u8,
}

struct Folder has key {
    id: UID,
    transcript: WrappableTranscript,
}
```

如果一个 struct 类型能被嵌入到一个 Sui object struct 中，这个 Sui object struct 通常具有 key 能力，被嵌入的 struct 必须具有 store 能力。

### Capablity 设计模式

sui以object为中心，Capability是一种调整获取权限的设计模式，比如下面的函数 只能让拥有`TeacherCap capablity object`的人调用

```rust
public entry fun create_wrappable_transcript_object(_: &TeacherCap, history: u8, math: u8, literature: u8, ctx: &mut TxContext) {
  let wrappableTranscript = WrappableTranscript {
    id: object::new(ctx),
    history,
    math,
    literature,
  };
  transfer::transfer(wrappableTranscript, tx_context::sender(ctx))
}
```
我们传入了一个 `TeacherCap capability object` 的引用，然后使用 `_` 将其标注为未使用的变量或参数消耗掉。因为我们只传进了该 object 的引用，消耗掉这个引用对原始的 object 不造成任何影响。

## 事件Events

Events 对 Sui Move 智能合约很重要，是索引器 indexers 追踪链上行为时的主要方法。对比服务器后端，你可以将 events 理解为服务器日志 logging, 而 indexers 则是解析器 parsers。

Sui 上面的 events 也是以 objects 的形式表示。在 Sui 中有几种系统层级的 events, 包括 Move event, Publish event, Transfer object event。

也可以自定义events event objects不代表资产，可以复制，作用域结束后可销毁
```rust
/// Event marking when a transcript has been requested
  struct TranscriptRequestEvent has copy, drop {
    // The Object ID of the transcript wrapper
    wrapper_id: ID,
    // The requester of the transcript
    requester: address,
    // The intended address of the transcript
    intended_address: address,
  }
```

要在 Sui 上发出一个 event 信号，只需要使用`sui::event::emit`函数方法。

```rust
public entry fun request_transcript(transcript: WrappableTranscript, intended_address: address, ctx: &mut TxContext){
        let folderObject = Folder {
            id: object::new(ctx),
            transcript,
            intended_address
        };
        event::emit(TranscriptRequestEvent {
            wrapper_id: object::uid_to_inner(&folderObject.id),
            requester: tx_context::sender(ctx),
            intended_address,
        });
        //We transfer the wrapped transcript object directly to the intended address
        transfer::transfer(folderObject, intended_address);
    }
```

## unit 3

### Sui Framework

Sui Framework是Sui对Move VM功能的具体实现。 它包含 Sui 的原生 API，Move 标准库的实现，以及 Sui 特定的操作，例如密码原语和 Sui 在Framework级别的数据结构的实现。

在 Sui 上实现自定义同质化代币主要使用`sui::coin`模块

### 泛型

泛型允许我们只编写单个函数，写一套逻辑，而应用于任何类型上。所以这种函数也被称为模板 ——个可以应用于任何类型的模板处理程序。

```rust
module Storage {
    struct Box {
        value: u64
    }
    struct Box<T> {
        value: T
    }
    // T must be copyable and droppable 
    struct Box<T: store + drop> has key, store {
        value: T
    }
    // 函数中使用泛型
    public fun create_box<T>(value: T): Box<T> {
        Box<T> { value }
    }
    // 函数中传参只接受u64，但仍然使用同样的泛型Box结构
    public fun create_box(value: u64): Box<u64> {
        Box<u64>{ value }
    }
    // 使用泛型调用函数
    let bool_box = Storage::create_box<bool>(true);
    let u64_box = Storage::create_box<u64>(1000000);
}
```

### 见证者模式 The witness design pattern

简单理解就是不能被多次实例化的类型或资源，也就是该类型必须带有`drop`能力。

从下面的例子我们看到PEACE资源的实例被传递到create_guardian方法中并被丢弃（注意witness前的下划线），确保只能创建一个Guardian的实例。

```rust
/// Module that defines a generic type `Guardian<T>` which can only be
    /// instantiated with a witness.
    module witness::peace {
        use sui::object::{Self, UID};
        use sui::transfer;
        use sui::tx_context::{Self, TxContext};

        /// Phantom parameter T can only be initialized in the `create_guardian`
        /// function. But the types passed here must have `drop`.
        struct Guardian<phantom T: drop> has key, store {
            id: UID
        }

        /// This type is the witness resource and is intended to be used only once.
        struct PEACE has drop {}

        /// The first argument of this function is an actual instance of the
        /// type T with `drop` ability. It is dropped as soon as received.
        public fun create_guardian<T: drop>(
            _witness: T, ctx: &mut TxContext
        ): Guardian<T> {
            Guardian { id: object::new(ctx) }
        }

        /// Module initializer is the best way to ensure that the
        /// code is called only once. With `Witness` pattern it is
        /// often the best practice.
        fun init(witness: PEACE, ctx: &mut TxContext) {
            transfer::transfer(
                create_guardian(witness, ctx),
                tx_context::sender(ctx)
            )
        }
    }
```

#### phantom 关键字

在上面的例子我们想要在创建`Guardian`类型时传递witness参数`PEACE`,我们知道结构体中泛型参数设置为`drop`能力的为witness参数类型
按道理讲`Guardian`的参数也应该和`Guardian`一样拥有`store`的能力，但是我们又不希望传递的参数拥有`store`的能力，所以我们将其参数
设置为`<phantom T: drop>`, 来避免传递的参数导致不符合预期的行为。

#### 一次性证明 One time witness

一次性证明是一种特殊的证明模式，利用模块`init`函数确保只创建一个witness类型的实例

在sui move中这样定义类型被认为是一个一次性证明的类型：
- 该类型是以模块的名字命名的，但大写字母。
- 该类型只具有`drop`的能力。

为了得到这个类型的实例，你需要把它作为第一个参数添加到模块的init函数中，如上面的例子一样保证`Guardian`是单例。

### Coin类型和create_currency方法

`Coin`类型拥有id和balance两个字段，balance是`sui::balance::Balance`类型
其中T泛型作为`Balance`的另一个`phantom`参数，而在`Balance`中没有被使用， 所以T泛型是个`phantom`类型字段。
```rust
struct Coin<phantom T> has key, store {
    id: UID,
    balance: Balance<T>
}
struct Balance<phantom T> has store {
    value: u64
}
```
```rust
public fun create_currency<T: drop>(
        witness: T,
        decimals: u8,
        symbol: vector<u8>,
        name: vector<u8>,
        description: vector<u8>,
        icon_url: Option<Url>,
        ctx: &mut TxContext
    ): (TreasuryCap<T>, CoinMetadata<T>) {
        // Make sure there's only one instance of the type T
        assert!(sui::types::is_one_time_witness(&witness), EBadWitness);

        // Emit Currency metadata as an event.
        event::emit(CurrencyCreated<T> {
            decimals
        });

        (
            TreasuryCap {
                id: object::new(ctx),
                total_supply: balance::create_supply(witness)
            },
            CoinMetadata {
                id: object::new(ctx),
                decimals,
                name: string::utf8(name),
                symbol: ascii::string(symbol),
                description: string::utf8(description),
                icon_url
            }
        )
    }
```
`create_currency`先通过`sui::types::is_one_time_witness`方法检查传入的`witness`是否是一次性见证
该方法创建并返回两个对象`TreasuryCap`和`CoinMetadata`结构体。

`TreasuryCap`是一种资产，通过一次性见证模式保证是一个单例
```rust
/// Capability allowing the bearer to mint and burn
    /// coins of type `T`. Transferable
    struct TreasuryCap<phantom T> has key, store {
            id: UID,
            total_supply: Supply<T>
        }
```
它包装了一个类型为`balance::Supply`的`singtleton`字段`total_supply`：
```rust
/// A Supply of T. Used for minting and burning.
    /// Wrapped into a `TreasuryCap` in the `Coin` module.
    struct Supply<phantom T> has store {
        value: u64
    }
```
`Supple<T>`跟踪当前正在流通的T类型的同质化代币的发行总量。你可以看到为什么这个字段必须是一个单体，因为为一个代币类型拥有多个supply实例是没有意义的。

`CoinMetadata`是一个存储已创建的可替换代币的元数据的结构体。
- `decimals`: 这个自定义可替换代币的精度
- `name`：这个自定义可替换标记的名称
- `symbol`：这个自定义可替换标记的标记符号
- `description`: 这个自定义可替换标记的描述
- `icon_url`: 这个自定义可替换代币的图标文件的网址。

`CoinMetadata`中包含的信息可以被认为是Sui的基本和轻量级的可替换代币标准，可以被钱包和浏览器用来显示使用`sui::coin`模块创建同质化代币。

## unit 4

### homogeneous collections 同类型集合

在Sui中，我们可以使用`vector`表示同类型集合。

用泛型类型定义的向量可以接受任意类型的对象，集合中的所有对象仍然必须是相同类型，也就是说，集合是同质的。

```rust
const A: vector<u8> = vector[0u8, 1u8, 2u8];
const B: vector<bool> = vector<bool>[false];

(vector[]: vector<bool>);
(vector[0u8, 1u8, 2u8]: vector<u8>);
(vector<u128>[]: vector<u128>);
(vector<address>[@0x42, @0x100]: vector<address>);
```

下面是一个自定义类型的`vector`，并封装了相关的操作函数：
```rust
module collection::vector {

    use std::vector;

    struct Widget {
    }

    // Vector for a specified  type
    struct WidgetVector {
        widgets: vector<Widget>
    }

    // Vector for a generic type 
    struct GenericVector<T> {
        values: vector<T>
    }

    // Creates a GenericVector that hold a generic type T
    public fun create<T>(): GenericVector<T> {
        GenericVector<T> {
            values: vector::empty<T>()
        }
    }

    // Push a value of type T into a GenericVector
    public fun put<T>(vec: &mut GenericVector<T>, value: T) {
        vector::push_back<T>(&mut vec.values, value);
    }

    // Pops a value of type T from a GenericVector
    public fun remove<T>(vec: &mut GenericVector<T>): T {
        vector::pop_back<T>(&mut vec.values)
    }

    // Returns the size of a given GenericVector
    public fun size<T>(vec: &mut GenericVector<T>): u64 {
        vector::length<T>(&vec.values)
    }
}
```

#### Table

`Table`是一个映射类的集合，动态存储键值对。

其中键值对不存储在`Table`的值中，而是类似js对象引用一样，使用sui的对象存储，`Table`结构可以索引这些键值对。

其中每个`key`类型必须具有`copy + drop + store`的能力约束，并且value类型必须具有`store`的能力约束。

并且`Table`也是同类型集合类型，其中键和值子端可以指定值类型或者泛型，但所有值和所有键必须是相同的类型。

### 动态字段

提供sui的字段扩展功能，分为动态字段和动态对象字段：

```rust
// 假设下面是基础结构，以及需要添加的动态字段和动态对象字段
    // Parent struct
    struct Parent has key {
        id: UID,
    }

    // Dynamic field child struct type containing a counter
    struct DFChild has store {
        count: u64
    }

    // Dynamic object field child struct type containing a counter
    struct DOFChild has key, store {
        id: UID,
        count: u64,
    }
// 通过sui的动态字段和动态对象字段扩展功能，可以添加动态字段和动态对象字段
  module collection::dynamic_fields {

      use sui::dynamic_object_field as ofield;
      use sui::dynamic_field as field;

    // Adds a DFChild to the parent object under the provided name
    public fun add_dfchild(parent: &mut Parent, child: DFChild, name: vector<u8>) {
        field::add(&mut parent.id, name, child);
    }

    // Adds a DOFChild to the parent object under the provided name
    public entry fun add_dofchild(parent: &mut Parent, child: DOFChild, name: vector<u8>) {
        ofield::add(&mut parent.id, name, child);
    } 
  }
```

### heterogeneous collections 不同类型集合

Vector和Table都属于同类型集合，如果需要存储不同类型的对象，要用到异构集合`Bag`

`Bag`类似于Table 也是一个映射类的集合，存储不同类型的键值对。

同时也和Table一样，键值对不存储在`Bag`中，类似js对象引用一样，使用sui的对象存储，`Bag`结构可以索引这些键值对。

```rust
// 常见bag类型的操作
module collection::bag {

    use sui::bag::{Bag, Self};
    use sui::tx_context::{TxContext};

    // Defining a table with generic types for the key and value 
    struct GenericBag {
       items: Bag
    }

    // Create a new, empty GenericBag
    public fun create(ctx: &mut TxContext): GenericBag {
        GenericBag{
            items: bag::new(ctx)
        }
    }

    // Adds a key-value pair to GenericBag
    public fun add<K: copy + drop + store, V: store>(bag: &mut GenericBag, k: K, v: V) {
       bag::add(&mut bag.items, k, v);
    }

    /// Removes the key-value pair from the GenericBag with the provided key and returns the value.   
    public fun remove<K: copy + drop + store, V: store>(bag: &mut GenericBag, k: K): V {
        bag::remove(&mut bag.items, k)
    }

    // Borrows an immutable reference to the value associated with the key in GenericBag
    public fun borrow<K: copy + drop + store, V: store>(bag: &GenericBag, k: K): &V {
        bag::borrow(&bag.items, k)
    }

    /// Borrows a mutable reference to the value associated with the key in GenericBag
    public fun borrow_mut<K: copy + drop + store, V: store>(bag: &mut GenericBag, k: K): &mut V {
        bag::borrow_mut(&mut bag.items, k)
    }

    /// Check if a value associated with the key exists in the GenericBag
    public fun contains<K: copy + drop + store>(bag: &GenericBag, k: K): bool {
        bag::contains<K>(&bag.items, k)
    }

    /// Returns the size of the GenericBag, the number of key-value pairs
    public fun length(bag: &GenericBag): u64 {
        bag::length(&bag.items)
    }
}
```

### 编写市场合约


















