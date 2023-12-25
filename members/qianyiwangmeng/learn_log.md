#### 环境变量

1. cmd

临时变量 当前窗口有效

```
set http_proxy = http://127.0.0.1:7890
set https_proxy = https://127.0.0.1:7890
```

永久有效

```
setx http_proxy http://127.0.0.1:7890
setx https_proxy https://127.0.0.1:7890
```

2. powershell 

临时变量 当前窗口有效

```
$env:http_proxy="http://127.0.0.1:7890"
$env:https_proxy="https://127.0.0.1:7890"
```

永久有效

```
[System.Environment]::SetEnvironmentVariable("http_proxy", "http://127.0.0.1:7890", [System.EnvironmentVariableTarget]::User)

[System.Environment]::SetEnvironmentVariable("https_proxy", "https://127.0.0.1:7890", [System.EnvironmentVariableTarget]::User)
```

3. 验证是否设置成功

```
curl www.google.com                            cmd
curl.exe -vv http://www.google.com/			   powershell
```

#### wsl 操作系统

此博客很详细： https://xlog.app/zh/site/dethan/wsl2-install-sui-by-ubuntu20_04 但记得安装好每一步后，有些需要手动刷新和加载环境变量

`source ~/.$(basename $SHELL)rc`

#### 传递参数

1. view 传引用
2. update 传可变引用
3. delete 传所有权
   1. 析构出对象的id，再调用删除对象id的方法

#### 对象所有权

##### 创建不可变对象

```
public native fun public_freeze_object<T: key>(obj: T);
```

对象被冻结且永远无法被更改，且不属于任何人。 则需要值传递，则所有权传递

```
public fun copy_into(from: &ColorObject, into: &mut ColorObject);
```

不可变对象可以不可变传递引用，只读，给其他使用，比如复制值，万一其他人能用

`freeze_object（）` 将coin的metadata 变为任何人可读取的 不可变对象 共享对象

#### 嵌套object

```
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

- Folder 有`key`的能力,所以可以根据id查询地址信息

- 被嵌入的WrappableTranscript具有`store`的能力。被封装的object不能通过参数进行传递也不能根据object ID来获取。只能根据父object进行获取
- 父对象(包装对象)被销毁了，才能取出被包装的子对象

将资产包装到request里面发送给服务端，服务端解包并进行交换，最后比较后，transfer后，再删除包装

#### key 和 store

拥有这两个能力则可以称为资产和被转移

没有store则不能转移

权限获取控制

```
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

TeacherCap是只有key的对象，放入参数后_,

拥有了唯一 `TeacherCap` object 的地址能够调用该函数方法，对该函数方法实现了获取权限控制，实现专有操作

#### 初始化函数

初始化智能合约的初试状态，分发最初的capacility objects

```
    /// Module initializer is called only once on module publish.
    fun init(ctx: &mut TxContext) {
        transfer::transfer(TeacherCap {
            id: object::new(ctx)
        }, tx_context::sender(ctx))
    }
```

该module publish后 创建一份TeacherCap 发送到 合约发布者的地址

#### event

    /// Event marking when a transcript has been requested
    struct TranscriptRequestEvent has copy, drop {
        // The Object ID of the transcript wrapper
        wrapper_id: ID,
        // The requester of the transcript
        requester: address,
        // The intended address of the transcript
        intended_address: address,
    }

event的类型拥有copy和drop的能力，event不是资产只对数据感兴趣，所以可以被复制并且在作用域结束后会被销毁

event::emit(event object)

#### tictactoe share版本

创建一个share的版本，玩家都可以操作棋盘，每次下棋后棋盘会自动判断状态

1. ##### borrow_mut

```
        let cell = vector::borrow_mut(vector::borrow_mut(&mut game.gameboard, (row as u64)), (col as u64));
        assert!(*cell == MARK_EMPTY, ECellOccupied);
```

- borrow_mut 可变借用，由于类型为vector<vector<u8>>，故需要两次调用borrow_mut ，一次为row，一次为col
- 返回值为&，故真正的值需要解引用*

2. ##### 轮次和mark符号

- 轮次依次加1，用%2来（0,1）来做标记，因为是回合制度，故是你的标记则每一次下棋都是这个来标记

3. ##### update_winner原理

数学问题，一共三行三列，计算每一行的和

若玩家第一行全一样，则根据下标我们需要取 (0,0) (0,1) (0,2)

然后判断这三个是否相等，则可以确定是否胜利
