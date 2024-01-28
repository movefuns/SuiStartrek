# 学习日志
## 配置sui move环境
Windows——使用Powershell脚本：
`Invoke-Expression (Invoke-WebRequest -Uri "https://gist.githubusercontent.com/WGB5445/73b3b54f8293125d4ba74260ea5a39ce/raw" -UseBasicParsing).Content`

Liunx Ubuntu——二进制自动化构建（要配置丝滑的代理）：
`curl -fsSL https://raw.githubusercontent.com/ProbiusOfficial/Sui-DevSetup/main/sui-ubuntu-x86_64.sh | bash`

## 安装Sui Wallet
浏览器插件安装即可
![w](p/w.png)

## 区块链浏览器
- https://suiexplorer.com/
- https://suivision.xyz/

# 语法学习：
## 快速创建一个 Sui package 框架
`sui move new <PACKAGE NAME>`<br />这条指令创建了:

- 项目根文件夹 `hello_world`
- `Move.toml` 配置文件
- 用于存放 Sui Move 智能合约的 `sources` 子文件夹

`Move.toml` 包含三个部分:

- `[package]` 声明了该 package 的命名和版本数
- `[dependencies]` 声明了该 package 依赖的其他 packages, 包括 Sui 标准库和其他第三方依赖库
- `[addresses]` 声明了该 packages 源代码中地址的别名
<a name="yLGq1"></a>
## 基本数据类型
`Integers` (u8, u64, u128), `boolean` and `address`.<br />即整型、布尔型、地址型。
<a name="nyQLI"></a>
### Integer types 整数类型

- `u8` 表示一个无符号的 8 位整数，也就是一个字节。
- `u64` 表示一个无符号的 64 位整数，也就是 8 字节。
- `u128` 表示一个无符号的 128 位整数，也就是 16 字节。

这些类型后面的数字表示整数分配的内存空间的大小。所以，u8 表示的是 1 个字节的内存空间大小，u64 表示的是 8 个字节的内存空间大小，而 u128 表示的是 16 个字节的内存空间大小。<br />定义方式：<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704899034404-58271b4b-3e3f-4413-8376-30f7c535e979.png#averageHue=%23efefef&clientId=u4038541f-546f-4&from=paste&height=404&id=u74816f6b&originHeight=606&originWidth=1025&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=67894&status=done&style=none&taskId=u4fbd2bd3-ccd9-4783-a19f-326563d2124&title=&width=683.3333333333334)
<a name="Lnzez"></a>
### Boolean 布尔类型
`false` and `true`<br />一些定义方式：<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704899284163-d8add5c8-f428-40e1-89e9-d33397570645.png#averageHue=%23efeeee&clientId=u4038541f-546f-4&from=paste&height=171&id=ua04ba20f&originHeight=256&originWidth=714&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=28348&status=done&style=none&taskId=ud3a6d712-1330-4e50-abaa-c3ae4766acc&title=&width=476)
<a name="UxNkN"></a>
### Address 地址
地址是区块链中发送者（或钱包）的标识符。需要地址类型的最基本的操作是发送硬币和导入模块（module）。<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704899387005-9edb1a5d-f352-4fd7-bc13-df34eb08aa92.png#averageHue=%23efeeee&clientId=u4038541f-546f-4&from=paste&height=271&id=u3f55d7ca&originHeight=406&originWidth=991&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=58527&status=done&style=none&taskId=u32f68d3f-cf2f-4695-aa08-9f15538a79f&title=&width=660.6666666666666)
<a name="n8VwL"></a>
### 数值比较
使用运算符 as 将整数变量转换为另一个大小：<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704899424725-caec67f4-6014-46ac-8594-acef36b7a55d.png#averageHue=%23efeeee&clientId=u4038541f-546f-4&from=paste&height=181&id=u04b448a7&originHeight=271&originWidth=643&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=28656&status=done&style=none&taskId=ua5c08eb7-8a96-4b9e-ad09-1350308dce4&title=&width=428.6666666666667)<br />同等大小类型的整数才可以比较
<a name="vEem1"></a>
## 注释
语法和C一样，但不能使用utf-8（就是注释不能写汉字）
<a name="x2yQM"></a>
## 初始化变量
使用 `let` 在当前范围内创建新变量，并选择性地使用 `value` 初始化此变量<br />`let <VARIABLE> : <TYPE>; `or `let <VARIABLE> = <EXPRESSION>`<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704936241016-934ba8d9-d402-48d3-b3ae-ec71327c54fd.png#averageHue=%23efeeed&clientId=ub317da65-8c34-4&from=paste&height=165&id=u3635bdb1&originHeight=247&originWidth=282&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=12002&status=done&style=none&taskId=ubac8e22f-cb18-474a-b171-0d5d0b38c96&title=&width=188)
<a name="SRcXD"></a>
## 下划线——未使用
在 Move 中，必须使用每个变量（否则您的代码将无法编译），因此您不能初始化一个变量并保持其不变。虽然您有一种方法可以将变量标记为故意未使用 - 通过使用下划线 `_` 。<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704936360724-e5b59162-ce3d-46b6-bda6-fd3f6d291e89.png#averageHue=%23f2f1f1&clientId=ub317da65-8c34-4&from=paste&height=485&id=u271ffd92&originHeight=728&originWidth=1083&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=67545&status=done&style=none&taskId=u7f932fa2-de7c-4c3a-bebb-d88185dbf85&title=&width=722)<br />Move 允许您定义相同的变量两次，但有一个限制 - 它仍然需要使用。
<a name="i1GKr"></a>
## 块表达式与作用域
块是一个表达式;它标有大括号 - `{}` 。块可以包含其他表达式（和其他块）。<br />在定义块时，您实际上定义了一个范围。<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704936495749-d8f1e096-20bf-4bd7-967e-85b97c8335b0.png#averageHue=%23efefef&clientId=ub317da65-8c34-4&from=paste&height=293&id=u170c27c8&originHeight=439&originWidth=764&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=37896&status=done&style=none&taskId=u55d9c24f-e90b-42a9-b451-090730cb94c&title=&width=509.3333333333333)
<a name="nau1l"></a>
## 变量的生命周期
变量仅存在于定义它的作用域（或块）内。当其作用域结束时，变量将死亡。
<a name="oGGLN"></a>
## 块返回值
作用域中的最后一个表达式（不带分号）是此作用域的返回值。<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704936792834-71a49c61-9586-4efd-928f-0962aa419c59.png#averageHue=%231f1f1f&clientId=ub317da65-8c34-4&from=paste&height=631&id=u4e3913f4&originHeight=946&originWidth=1078&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=86351&status=done&style=none&taskId=u0a768b45-5f86-45d2-8624-63f4845da00&title=&width=718.6666666666666)
<a name="KFKPn"></a>
## 控制流
<a name="B1DVD"></a>
### if表达式
`if (<bool_expression>) <expression> else <expression>;`<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704936972171-c8c1f51f-77a6-4329-8626-1cef2d0fb348.png#averageHue=%23efefee&clientId=ub317da65-8c34-4&from=paste&height=291&id=u6c45aa9e&originHeight=437&originWidth=498&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=32528&status=done&style=none&taskId=u9ef442a3-fd8c-429f-8d63-b6271efdbfa&title=&width=332)

- 分支兼容性：两个分支必须返回兼容（相同）类型
- `if` 可以单独使用 - 没有 `else`
- 没有`else` 分支的表达式不能用于赋值

<a name="qL7yF"></a>
### 条件while循环
`while (<bool_expression>) <expression>;`

-  `while` 不能返回值
<a name="UdMwj"></a>
### 无限loop循环
无限循环是用关键字`loop`定义的。<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704937182720-a78bacc5-b8ef-47b2-b8d4-f86a772cf8e1.png#averageHue=%23efefef&clientId=ub317da65-8c34-4&from=paste&height=258&id=uc0025319&originHeight=387&originWidth=666&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=31206&status=done&style=none&taskId=uf33cc24b-3104-4a47-a2ab-65046b33f0c&title=&width=444)
<a name="gkLAv"></a>
### break与continue
关于分号。如果 break 和 continue 是块中的最后一个关键字，则不能在它们后面加上分号，因为 after 之后的任何代码都不会被执行。<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704937272834-ac6318d2-f92c-47aa-aed0-d6920df62077.png#averageHue=%231f1f1f&clientId=ub317da65-8c34-4&from=paste&height=603&id=uf6050832&originHeight=905&originWidth=1452&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=83533&status=done&style=none&taskId=u9da01ae2-3084-4835-879c-762d2c2866b&title=&width=968)
<a name="wF8Sm"></a>
### 有条件的中止abort
关键字 `abort`允许您中止执行，并在其后放置错误代码。<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704937345168-dd77d1bc-cee0-4795-861d-cab4f83c748a.png#averageHue=%23f0efef&clientId=ub317da65-8c34-4&from=paste&height=203&id=uc76fbe48&originHeight=304&originWidth=643&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=21607&status=done&style=none&taskId=uc17ed75a-868d-41db-a2ce-ff668076f1d&title=&width=428.6666666666667)
<a name="NEvLg"></a>
### assert条件中止
内置 `assert!(<bool expression>, <code>)` 方法已经包装了 `abort + 条件`，并且可以在代码中的任何位置访问。**左边的条件必须为真，否则执行右边。**<br />`assert()` 当不满足条件时将中止执行，或者在相反的情况下将不执行任何操作。<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704937457288-301ffd5e-6bc4-4a05-87cc-38ce26961b76.png#averageHue=%23efefef&clientId=ub317da65-8c34-4&from=paste&height=145&id=u24be0a51&originHeight=217&originWidth=651&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=17201&status=done&style=none&taskId=u5762f114-0939-4aa9-a321-54b8487c557&title=&width=434)

- 错误码赋值：`const ENotIntendedAddress: u64  = 1;`
<a name="A2xq1"></a>
## 模块module
模块以 `module` 关键字开头，后跟模块名称和大括号 - 其中放置了模块内容。<br />默认情况下，您的模块将从您的地址编译和发布。但是，如果您需要在本地使用某些模块（例如用于测试或开发）或想在模块文件中指定您的地址，请使用 `address <ADDR> {}`语法<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704937697907-0c5f01c6-8114-4b3d-b87b-ef44ab4be049.png#averageHue=%23f0efee&clientId=ub317da65-8c34-4&from=paste&height=168&id=u4f1c8184&originHeight=252&originWidth=554&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=18331&status=done&style=none&taskId=udaba6678-4d22-40d8-89fe-1bbc04f3c98&title=&width=369.3333333333333)
<a name="UmpFp"></a>
## 导入模块或标准库

- 您可以直接在代码中按模块的地址使用模块：

![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704937757877-4fc2a558-5ac8-43d4-a8db-be9ffcf9c0c6.png#averageHue=%23efeeed&clientId=ub317da65-8c34-4&from=paste&height=97&id=ue8186511&originHeight=146&originWidth=536&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=12132&status=done&style=none&taskId=u521d0577-f2ec-4127-9bd2-3a22151c764&title=&width=357.3333333333333)<br />在此示例中，我们从地址`0x1`（标准库）导入了模块`Offer` 并使用了它的方法

- 关键字导入

 `use <Address/Alias>::<ModuleName>;`<br />`<Address>` 是发布者的地址，也是 `<ModuleName>` 模块的名称。

- 成员导入：可以扩展 `import` 语句 - 您可以指定要导入的模块的哪些成员：![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704938948255-ee4469ad-ba41-4456-b81d-d890ec208196.png#averageHue=%23efeeed&clientId=ub317da65-8c34-4&from=paste&height=105&id=ua272e965&originHeight=158&originWidth=516&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=14131&status=done&style=none&taskId=u8d74dc3c-0e10-4fcd-90c6-db1408ae206&title=&width=344)
- 用于`Self`将模块与其成员一起导入![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704939029580-5e336642-6c64-404a-b2a8-a2c0722f935c.png#averageHue=%23efeeed&clientId=ub317da65-8c34-4&from=paste&height=252&id=u5ac634d1&originHeight=378&originWidth=533&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=35970&status=done&style=none&taskId=u7862a33a-9fef-4d9d-bd9e-c98f5915a8a&title=&width=355.3333333333333)
- 使用关键字 `as` 更改导入模块的名称。              `use <Address>::<ModuleName> as <Alias>;`
<a name="ZZTak"></a>
## 常量
您可以定义模块级或脚本级常量。一旦定义，常量就无法更改。
<a name="Y4ucf"></a>
## 函数

- 函数参数
<a name="IkGDL"></a>
### 定制类型
Structure 使用关键词 struct 声明。一个 structure 最多拥有 4 项能力。<br />四类能力特性：

- **Copy**: 值可以被复制
- **Drop**: 在作用域范围结束后值可以被丢弃
- **Key**: 在全局存储操作中值可以被用为key键
- **Store**: 值可以在全局存储中被存储
<a name="gHSVq"></a>
### 函数可见性

- **private**: 作为函数可见性的默认设置；只允许同一 module 内的函数获取
- **public**: 该函数既可以被同一 module 内的函数获取，也可以被其他 module 定义的函数获取
- **public(friend)**: 该函数既可以被同一 module 内的函数获取，同时也可以被该 module 的 friends 清单上包含的 module 所定义的函数获取。
<a name="aOZfV"></a>
### Entry 函数
在 Sui Move 中，entry 函数可以被交易 transactions 直接调用。它们需要满足下面三个条件:

- 被关键词 entry 标注
- 没有返回值
- (可选) 最后一个参数是 TxContext 类型实例的可变引用

<a name="fqq73"></a>
## 部署智能合约
`sui client publish --path <absolute local path to the Sui Move package> --gas-budget 100000000`（要是提示gas不够就多加几个0）

- 获取测试币

Win：（Powershell中执行）
```powershell
$body = @{
    FixedAmountRequest = @{
        recipient = '钱包地址'
    }
} | ConvertTo-Json

Invoke-WebRequest -Uri 'https://faucet.devnet.sui.io/gas' -Method POST -Body $body -Headers @{
    'Content-Type' = 'application/json'
}
```
Linux：
```powershell
curl --location --request POST 'https://faucet.devnet.sui.io/gas' --header 'Content-Type: application/json' --data-raw '{ "FixedAmountRequest": { "recipient": "替换为你的钱包地址" } }'
```

- 跳过版本检查：`--skip-fetch-latest-git-deps`
- 跳过依赖性检查：`--skip-dependency-verification`

![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704942838747-27f8f761-b7cf-42cb-a960-aef6a84b6216.png#averageHue=%23111111&clientId=ub317da65-8c34-4&from=paste&height=727&id=u4f7e99dd&originHeight=1090&originWidth=2244&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=122339&status=done&style=none&taskId=u6e7de1e8-bf58-4562-9f4d-495323eb331&title=&width=1496)

- 输出中文

![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704944726914-25a67fb1-f80c-41bf-b24c-860fc621a6f0.png#averageHue=%23212120&clientId=ub317da65-8c34-4&from=paste&height=563&id=uce2fa16e&originHeight=845&originWidth=1146&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=128175&status=done&style=none&taskId=u6a75e747-50a0-4834-add8-3d3cdc5543e&title=&width=764)
```
module hello::hello{
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    
        ///include any string object
    struct HelloWorldObject has key, store {
        id: UID,
        /// strings included by object 
        text: string::String
    }
    
    public entry fun mint(text: vector<u8>,ctx: &mut TxContext){
        let object = HelloWorldObject{
            id: object::new(ctx),
            text: string::utf8(text)
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}
```
使用vector来定义字符串变量<br />再次发布智能合约 <br />`sui client publish --gas-budget 100000000 --skip-fetch-latest-git-deps --skip-dependency-verification`<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704944771697-5099dd4c-f17c-4f9d-ac1b-9e3c4e368591.png#averageHue=%23121212&clientId=ub317da65-8c34-4&from=paste&height=544&id=ud654b6d7&originHeight=816&originWidth=1677&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=93144&status=done&style=none&taskId=udde489ea-9376-4da8-9b87-7067fab1830&title=&width=1118)<br />调用函数，传入参数args <br />`sui client call --function mint --module hello --package 0x0379266c1b772298bd93d0da5f8f684f30f9c5eb2be5af36d9f06f5ee7c47179 --args "你好，世界" --gas-budget 10000000`<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704944803479-9976efb9-0b65-4f87-8dd3-620975f37750.png#averageHue=%23161616&clientId=ub317da65-8c34-4&from=paste&height=529&id=u8ea13639&originHeight=794&originWidth=1955&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=116945&status=done&style=none&taskId=u7b4c5150-29df-4918-9f90-8539f7a2a9c&title=&width=1303.3333333333333)<br />在sui explorer上查看相关信息，输入 `Transaction Effects` 下的 `Created Objects ID`<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704945008492-850d570a-04fd-4625-9e40-9fd47f53f86b.png#averageHue=%238fc28e&clientId=ub317da65-8c34-4&from=paste&height=591&id=u5a53dc2f&originHeight=886&originWidth=2119&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=153639&status=done&style=none&taskId=uf37cdc58-2872-496d-bdc2-d9c9c89924c&title=&width=1412.6666666666667)<br />可以看到text信息

<a name="ThwyG"></a>
## Sui Objects 所有权
在 Sui Move 中总共有四种类型的所有权。

- 被拥有
   - 被一个地址拥有
   - 被另一个 object 拥有
- 共享
   - 不可变的共享
   - 可变的共享
<a name="lefHY"></a>
### 被拥有的 Objects

- 被一个地址拥有：使用transfer方法将一个object转移到一个地址

**（transfer的函数方法调用会完全消耗掉object，即transfer之后object在当前交易中是不能再次被获取的）**<br />之后对object的读写操作都必须由object所有者发起交易<br />`use sui::transfer`<br />`transfer::transfer(obj, recipient);`
<a name="erOpc"></a>
### 被另一object拥有的object（子object）
使用`dynamic_object_field`方法创建的`object`

<a name="dwI2D"></a>
### 不可变的共享object（不能被修改和删除，也不能解冻）
`transfer::freeze_object(obj);`
<a name="Jb6kf"></a>
### 可变的共享object
可被任何人读写<br />`transfer::share_object(obj);`
<a name="MKIkd"></a>
## 参数传递与删除Object
![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704966869213-e3f64f50-a646-4f6a-b624-1212634a15c3.png#averageHue=%23212020&clientId=u49829f64-2ed4-4&from=paste&height=544&id=u6ad46e0b&originHeight=816&originWidth=1510&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=162816&status=done&style=none&taskId=u39310314-659d-49e6-8ad3-5de91a96e9e&title=&width=1006.6666666666666)
<a name="A8xff"></a>
## 结构体嵌套（Object Wrapping）
![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704970141286-ced5fd98-e646-43d9-9a49-ef9e314deb62.png#averageHue=%23dee8fa&clientId=u49829f64-2ed4-4&from=paste&height=229&id=ue5aefb1f&originHeight=344&originWidth=432&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=72309&status=done&style=none&taskId=u8217db4a-36d0-4d12-9169-54e96a4be78&title=&width=288)![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704970149282-53a4f131-9b7d-465a-a95f-acfff48f4b33.png#averageHue=%23212020&clientId=u49829f64-2ed4-4&from=paste&height=230&id=u92a598f5&originHeight=419&originWidth=648&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=35153&status=done&style=none&taskId=u73ce6c8d-7b75-4d95-b191-974adf99ac3&title=&width=355)<br />实现成绩单信息的请求和解包<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704972549994-4ac4784b-861d-49a5-8b04-25942b820726.png#averageHue=%23212020&clientId=u49829f64-2ed4-4&from=paste&height=584&id=u2d865560&originHeight=876&originWidth=1966&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=208252&status=done&style=none&taskId=u8c56ed79-1440-481b-b6f1-92efae53bbd&title=&width=1310.6666666666667)

<a name="igaZs"></a>
## 用与权限管理的Capability模式
把带有管理员权限的能力也设计成一个Object并赋予给特定账户，同时限定需要管理员运行的函数方法<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704973791658-11f1aaae-350e-44d6-ad21-7af92dee0551.png#averageHue=%231f1f1f&clientId=u7ea07064-2ae2-4&from=paste&height=94&id=uaf768fb2&originHeight=141&originWidth=1528&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=19362&status=done&style=none&taskId=u6d7eea36-0a7c-475f-b072-c0fcfc169e1&title=&width=1018.6666666666666)<br />增加传入的参数`TeacherCap`，并用下划线将它标注为未使用的变量或参数<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704978098636-ca8d28a8-f749-451e-84b7-d863e66fb014.png#averageHue=%23212120&clientId=uee404845-247f-4&from=paste&height=255&id=u0f3bf099&originHeight=382&originWidth=1972&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=76814&status=done&style=none&taskId=u4993917d-1b74-4788-b027-898407a857d&title=&width=1314.6666666666667)<br />添加管理员<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704978219055-46932726-cdcf-4193-adc5-58d36c2ed12c.png#averageHue=%23202020&clientId=uee404845-247f-4&from=paste&height=393&id=u15754e9c&originHeight=590&originWidth=1811&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=91459&status=done&style=none&taskId=u0fb81dfb-448b-469e-9761-a3aaf976e12&title=&width=1207.3333333333333)
<a name="PkBIG"></a>
## 日志（Events）
要引用`use sui::event;`<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704978208530-e6e94936-5080-40b3-a63c-8db10f242f91.png#averageHue=%23212121&clientId=uee404845-247f-4&from=paste&height=145&id=u07724064&originHeight=218&originWidth=800&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=28342&status=done&style=none&taskId=ufec09fba-abf1-43c0-a782-e9a5b05b432&title=&width=533.3333333333334)<br />在函数中添加发送events信息

<a name="X6ycj"></a>
## 泛型
_泛型是具体类型或其他属性的抽象替代品_。

—————————————————————————2024.1.21笔记更新——————————————————————————

<a name="yYEU7"></a>
# 泛型
避免重复的模板函数<br />在没有范型的情况下，我们可以定义一个包含 u64 类型的 Box<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705805824371-9eccec6c-d7a3-4ce9-a06d-582722422664.png#averageHue=%23f5f6f5&clientId=ua54f5352-9c69-4&from=paste&height=106&id=ua4e651e1&originHeight=159&originWidth=270&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=7343&status=done&style=none&taskId=uf9980b95-e89f-422a-a054-d010aa167c9&title=&width=180)<br />但是，这种类型只能保存 u64 类型的值，为了能够存储其他类型显然我们不能把所有类型的box都枚举完，所以这个时候就需要使用泛型。<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705805852951-f8448a84-c2e8-4ee8-8a60-53e861dfd59e.png#averageHue=%23f5f6f5&clientId=ua54f5352-9c69-4&from=paste&height=101&id=u67a58279&originHeight=152&originWidth=268&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=7190&status=done&style=none&taskId=u4b3f9139-9ba5-42e3-95fc-9df7d305e56&title=&width=178.66666666666666)（加上尖括号）
<a name="j2NCr"></a>
## 能力限制
我们可以添加条件去强制传递给泛型的类型必须具有某些能力。（能多不能少）<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705805990630-a57e789b-50aa-421e-928c-c3badd43a984.png#averageHue=%23f5f6f5&clientId=ua54f5352-9c69-4&from=paste&height=119&id=u3fad2637&originHeight=178&originWidth=648&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=16819&status=done&style=none&taskId=ub5e9c7ba-3922-44c4-beab-72ee5d415da&title=&width=432)<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705808544500-41e76f08-cbfe-45ec-bdc9-004dae81f8c4.png#averageHue=%23211e21&clientId=ua54f5352-9c69-4&from=paste&height=433&id=u0a11194e&originHeight=649&originWidth=1260&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=322902&status=done&style=none&taskId=ub6722111-8076-476c-a566-3309a634633&title=&width=840)<br />phantom可以绕过规则
<a name="jplnt"></a>
### 示例：generics.move
先部署智能合约：`sui client publish --gas-budget 100000000 --skip-fetch-latest-git-deps --skip-dependency-verification` <br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705812025131-9348bab5-7a59-4d77-b0ef-fb8ac1adb2ed.png#averageHue=%231c1a1d&clientId=ua897697c-cc05-4&from=paste&height=303&id=ub9107948&originHeight=454&originWidth=1667&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=379168&status=done&style=none&taskId=ue015af88-2dcc-4325-9d9b-f53086d8eac&title=&width=1111.3333333333333)<br />类型参数 type-args<br />`sui client call --package 0x92321dc9b575a77207129d0321bb65041fe455f0e1c0c37b95ad0f363b274028 --module g1 --function "create_box" --args 0x2ffb33f9f1516e890e46d07739fecf38cdb4373920dd186d1977203c6771f84c --type-args "0x2::coin::Coin<0x2::sui::SUI>" --gas-budget 10000`
<a name="z2b6S"></a>
# Witness（见证者模式）
![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705824567721-c89fc1c4-b6d6-49bd-b261-7eef048b522c.png#averageHue=%23302e30&clientId=u4e2f32aa-d03e-4&from=paste&height=515&id=ue83b4948&originHeight=772&originWidth=1598&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=581254&status=done&style=none&taskId=u5f751ca6-ee9a-4173-afd3-88d859a8d69&title=&width=1065.3333333333333)<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705824665595-8bb3f2b4-bdf6-411b-ba71-3b3bb82b598f.png#averageHue=%23312f32&clientId=u4e2f32aa-d03e-4&from=paste&height=592&id=u63214f67&originHeight=888&originWidth=1568&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=822340&status=done&style=none&taskId=u929bcba8-156e-45da-916b-92df11af92c&title=&width=1045.3333333333333)

- Phantom：我们还想把 witness 资源 PEACE 传入 Guardian，但 PEACE 只有 drop 的能力。回顾我们之前关于能力约束和内部类型的讨论，该规则暗示PEACE也应该有key和storage，因为外部类型Guardian有。但是在这种情况下，我们不想给我们的witness类型添加不必要的能力，因为这样做可能会导致不符合预期的行为和漏洞。我们可以使用关键字`phantom`来解决这种情况。当一个类型参数没有在结构定义中使用，或者它只是作为另一个`phantom`类型参数的参数使用时，我们可以使用phantom关键字来要求Move类型系统放松对内部类型的能力约束规则。

![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705824700450-e9e9931f-8f06-419d-bb44-208378589fee.png#averageHue=%23201e21&clientId=u4e2f32aa-d03e-4&from=paste&height=596&id=Ow97A&originHeight=894&originWidth=1522&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=618912&status=done&style=none&taskId=u18f678cb-4e9e-4c6e-b111-82fd647cedb&title=&width=1014.6666666666666)

- One Time Witness：一次性见证One Time Witness（OTW）是Witness模式的一个子模式，我们利用模块init函数来确保只创建一个witness资源的实例（所以A类型被保证是唯一的）。
<a name="KcyoY"></a>
# 发行代币
<a name="bKdh5"></a>
## Coin资源
![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705825089941-98283993-9686-4072-864c-8d4a44830a55.png#averageHue=%23b9bebd&clientId=u4e2f32aa-d03e-4&from=paste&height=333&id=u6a7be891&originHeight=499&originWidth=857&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=182609&status=done&style=none&taskId=ueaf8c6bc-94aa-44b0-9971-36e1f602ddb&title=&width=571.3333333333334)<br />Balance没有Key能力，不能进行全局查找和transfer。而Coin可以，因此把Balance包在Coin里面。
<a name="PAWxP"></a>
## create_currency 方法
![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705826833850-7c1c65ef-5154-4a6a-9c58-414b42db792d.png#averageHue=%23f5f6f5&clientId=u4e2f32aa-d03e-4&from=paste&height=581&id=u639c5fc0&originHeight=871&originWidth=891&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=100000&status=done&style=none&taskId=ufdad4ee8-2ed2-499f-a97b-dce00443d4c&title=&width=594)<br />使用Sui框架中的sui::types::is_one_time_witness 方法检查传入的witness资源是否是一次性见证。<br />该方法创建并返回两个对象，一个是TreasuryCap资源，另一个是CoinMetadata资源。
<a name="Bgowj"></a>
### TreasuryCap
![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705826890839-6143d208-fb6a-497d-a47c-8c221ad48268.png#averageHue=%23f4f4f2&clientId=u4e2f32aa-d03e-4&from=paste&height=409&id=uab912c8b&originHeight=613&originWidth=1147&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=111821&status=done&style=none&taskId=u1d796c29-d743-48df-8968-fa89de6d960&title=&width=764.6666666666666)
<a name="kozzK"></a>
### CoinMetadata
这是一个存储已创建的可替换代币的元数据的资源。它包括以下字段。

- `decimals`: 这个自定义可替换代币的精度
- `name`：这个自定义可替换标记的名称
- `symbol`：这个自定义可替换标记的标记符号
- `description`: 这个自定义可替换标记的描述
- ``icon_url'`: 这个自定义可替换代币的图标文件的网址。
<a name="rsScX"></a>
## Manage Coin案例
合约部署后，创建的两个不可变对象分别是 `package` 本身和 `Managed Coin` 的 `CoinMetadata object`，交易发送人收到并拥有的对象就是 `Managed Coin` 的 `TreasuryCap` 对象。
<a name="H3xPB"></a>
### package
![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705828006275-3f095bb4-74de-40e7-912c-43565b3390d2.png#averageHue=%231c1b1b&clientId=u4e2f32aa-d03e-4&from=paste&height=221&id=ub0980c44&originHeight=331&originWidth=931&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=22218&status=done&style=none&taskId=u6556a1d7-f99f-423f-b6e2-c7a0b91ffb8&title=&width=620.6666666666666)<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705828020201-44b108c1-d7d3-45da-bfe9-f2ed05340a7f.png#averageHue=%23fdfdfd&clientId=u4e2f32aa-d03e-4&from=paste&height=593&id=u0e070bd8&originHeight=890&originWidth=2145&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=146922&status=done&style=none&taskId=ue4bd05fa-f2d2-4827-a0de-56ecb3f0794&title=&width=1430)

- <br />

<a name="RAQLZ"></a>
### CoinMetadata
![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705828100578-0885cc00-77ed-4308-8cdc-9cf2f6e9d793.png#averageHue=%231e1d1c&clientId=u4e2f32aa-d03e-4&from=paste&height=281&id=u426124c3&originHeight=421&originWidth=1133&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=41107&status=done&style=none&taskId=u8d6d331f-465e-448d-872a-67454592465&title=&width=755.3333333333334)<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705828089714-9cfdbc44-8e7d-4dd2-bfd8-da98c3f97292.png#averageHue=%238fc38e&clientId=u4e2f32aa-d03e-4&from=paste&height=783&id=u3bcf40c6&originHeight=1174&originWidth=2110&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=211314&status=done&style=none&taskId=u445c01f9-cea8-4985-8532-a2bb3c8527c&title=&width=1406.6666666666667)
<a name="N8S8A"></a>
### TreasuryCap
![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705828145403-975e680c-73bf-44fa-9402-47f9c6cce816.png#averageHue=%2321201f&clientId=u4e2f32aa-d03e-4&from=paste&height=213&id=ufd9a4f47&originHeight=319&originWidth=1126&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=43608&status=done&style=none&taskId=u1554dc22-f601-4ca4-a600-d3c34c89198&title=&width=750.6666666666666)<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705828154166-06e740a6-de9c-455c-8ed4-e042c028e120.png#averageHue=%2390c390&clientId=u4e2f32aa-d03e-4&from=paste&height=700&id=u661defd2&originHeight=1050&originWidth=2083&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=217006&status=done&style=none&taskId=u203bb18c-30c1-4c49-ae5a-2af771a20ae&title=&width=1388.6666666666667)
<a name="UKvyj"></a>
## 铸造代币（mint函数）

- `sui client call --function mint --module managed --package $PACKAGE_ID --args $TREASURYCAP_ID \"<amount to mint>\" <recipient address> --gas-budget 3000`

可以看到三个参数分别是 TreasuryCapID、铸造代币数量、接受者地址<br />实际代码 `sui client call --function mint --module managed --package 0x97a0b24e24d5103bbad0b47688356814c7e8e6b1f94b7907344a505459e677dc --args 0xb805040af4c66a770b9daa1c4646b5f8aac9f257fcd4535c7a45cd717ded29be 100 0xf1a3394e4cfbc855ffcad1774b7505eff2d87659ad135a9fecf2755b1097bb8f --gas-budget 10000000`<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705828425762-dc60cf3e-c512-43c2-9428-4aa585b16b05.png#averageHue=%231f1e1e&clientId=u4e2f32aa-d03e-4&from=paste&height=326&id=u5eb5d360&originHeight=489&originWidth=1961&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=85733&status=done&style=none&taskId=u3570b8a2-2a36-4259-835a-8d30f407de8&title=&width=1307.3333333333333)<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705828460084-ae5283cb-23bb-422a-aa2f-827537394f17.png#averageHue=%23efcfb0&clientId=u4e2f32aa-d03e-4&from=paste&height=817&id=ua04da394&originHeight=1226&originWidth=2178&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=248777&status=done&style=none&taskId=u6e0e87f7-48d0-47ba-bcdf-93bc836a434&title=&width=1452)<br />运行成功

<a name="HSuBV"></a>
## 销毁代币（burn函数）

- `sui client call --function burn --module managed --package $PACKAGE_ID --args $TREASURYCAP_ID $COIN_ID --gas-budget 3000`

需要的参数有两个：`TreasuryCapID`和`CoinID`

- Coin ID

![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705828603309-2802048e-c9e4-4141-8eaf-283be3a789bd.png#averageHue=%2390c390&clientId=u4e2f32aa-d03e-4&from=paste&height=561&id=ub9ba66e4&originHeight=842&originWidth=2100&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=164640&status=done&style=none&taskId=u160b6ff0-9665-4d5b-ae79-f89b1a803df&title=&width=1400)<br />实际代码 `sui client call --function burn --module managed --package 0x97a0b24e24d5103bbad0b47688356814c7e8e6b1f94b7907344a505459e677dc --args 0xb805040af4c66a770b9daa1c4646b5f8aac9f257fcd4535c7a45cd717ded29be 0x6ede12fb9c98d6bca757689bca94b8cf6a4aac8b0453e49e791fb9cc071890dc --gas-budget 10000000`<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705828827422-54d6f0a6-12b0-4a15-bb24-1c178c31c8c2.png#averageHue=%231f1e1e&clientId=u4e2f32aa-d03e-4&from=paste&height=348&id=ucb91bc2a&originHeight=522&originWidth=1914&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=82136&status=done&style=none&taskId=uf3201f56-1268-432d-b710-a9a54713148&title=&width=1276)<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705828856653-446de22c-ae4a-4c30-80b0-0dc689395618.png#averageHue=%23eee3c4&clientId=u4e2f32aa-d03e-4&from=paste&height=660&id=u0042a38a&originHeight=990&originWidth=2148&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=192911&status=done&style=none&taskId=uee1f07ce-5de3-4629-ae59-7239688fa09&title=&width=1432)

## @mysten/create-dapp 工具
### 模板
- react-client-dapp ：一个简单的 React dApp，用于获取连接钱包拥有的对象列表
- react-e2e-counter ：包含简单计数器应用的移动代码和 UI 的端到端示例