# move学习
本人主要做前端开发 对rust和move语法完全不懂 更别说变种sui move 所以先学习下move
[Move-book](https://move-book.com/cn/index.html)

[Move Tutorial](https://github.com/move-language/move/blob/main/language/documentation/tutorial/README.md)

move和其他智能合约语言不同 move程序分为脚本和模块

## 基本类型：

整型（u8, u64, u128）布尔型 地址（address） 不支持浮点型 和 字符串

### 整型:
```rust
script {
  fun main() {
    // define empty variable, set value later
    let a: u8;
    a = 10;
    // define variable, set type
    let a: u64 = 10;
    // finally simple assignment
    let a = 10;
    // simple assignment with defined value type
    let a = 10u128;
    // in function calls or expressions you can use ints as constant values
    if (a < 10) {};
    // or like this, with type
    if (a < 10u8) {}; // usually you don't need to specify type
  }
}
```
### 运算符as:
```rust
script {
    fun main() {
        let a: u8 = 10;
        let b: u64 = 100;

        // we can only compare same size integers
        if (a == (b as u8)) abort 11;
        if ((a as u64) == b) abort 11;
    }
}
```
### 布尔型: 
```rust
script {
    fun main() {
        // these are all the ways to do it
        let b : bool; b = true;
        let b : bool = true;
        let b = true
        let b = false; // here's an example with false
    }
}
```
### 地址: 
```rust
script {
    fun main() {
        let addr: address; // type identifier

        // in this book I'll use {{sender}} notation;
        // always replace `{{sender}}` in examples with VM specific address!!!
        addr = {{sender}};

        // in Diem's Move VM and Starcoin - 16-byte address in HEX
        addr = 0x...;

        // in dfinance's DVM - bech32 encoded address with `wallet1` prefix
        addr = wallet1....;
    }
}
```

## 注释
和别的语法一样 行注释 //  块注释 /* */

## 表达式和作用域
其中表达式必须用分号";"隔开
### 空表达式：
```rust
script {
  fun empty() {
    () // this is an empty expression
  }
}
```

### 文字表达式：
```rust
script {
    fun main() {
        10;
        10 + 5;
        true;
        true != false;
        0x1;
        1; 2; 3
    }
}
```

### 变量和let关键字：
```rust
script {
    fun main() {
        let a;
        let b = true;
        let c = 10;
        let d = 0x1;
        a = c;
    }
}
```

### 整型运算符:
+ - * / % \ & ^ << >> 加 减 乘 除 模 或 与 异或 左位移 右位移
其中左右位移运算 
左位移：将一个数的**二进制**表示向左移动指定的位数。移动后，右侧空出的位将用0填充。左移运算符的结果相当于将原数乘以2的移动位数次方。
右位移：将一个数的**二进制**表示向右移动指定的位数。移动后，左侧空出的位将根据原数的符号位进行填充。对于正数，空出的位用0填充；对于负数，空出的位用1填充。右移运算符的结果相当于将原数除以2的移动位数次方并向下取整。
举个例子
```rust
let a: u8 = 5;
let b = a << 2; // 将a左移2位，结果为5 * 2*2 = 20

let c: i32 = -10;
let d = c >> 1; // 将c右移1位，结果为-10 / 2*1 = -5
```

### 下划线_表示未被使用：
Move 中每个变量都必须被使用，否则代码编译不会通过, 因此我们不能初始化一个变量却不去使用它。但是你可以用下划线来告诉编译器，这个变量是故意不被使用的。
```rust
script {
    fun main() {
        let _ = 1;
    }
}
```

### 块表达式：
{}表示

### 作用域：
Move 作用域是由花括号扩起来的代码块，它本质上是一个块。

### 变量的生命周期和可见性：
变量仅存在于其作用域（或代码块）内，当作用域结束时变量随之消亡。

### 块返回值：
代码块可以返回一个值，如果它后面没有分号，则返回值为代码块内最后一个表达式的值。
```rust
script {
    fun block_ret_sample() {

        // since block is an expression, we can
        // assign it's value to variable with let
        let a = {

            let c = 10;

            c * 1000  // no semicolon!
        }; // scope ended, variable a got value 10000

        let b = {
            a * 1000  // no semi!
        };

        // variable b got value 10000000

        {
            10; // see semi!
        }; // this block does not return a value

        let _ = a + b; // both a and b get their values from blocks
    }
}
```

## 控制流
### 条件表达式 if else 
if表达式可以被let声明
其中if的两个分支必须返回相同的类型
```rust
script {
    use 0x1::Debug;

    fun main() {

        // try switching to false
        let a = true;
        let b = if (a) { // 1st branch
            10
        } else { // 2nd branch
            20
        };

        Debug::print<u8>(&b);
    }
}
```

### 循环表达式：
while条件循环
语法
```rust
while (<布尔表达式>) <表达式>;
```
与 if 表达式不同的是，while 表达式没有返回值，因而也就不能像 if 那样把自己赋值给某变量。

并且出于安全考虑，Move 规定所有变量必须被使用。并且出于同样的原因，Move 禁止使用无法访问的代码。

无限循环loop：使用无限循环时一定要注意安全，通常情况下建议使用 while 条件循环。

```rust
script {
    fun main() {
        let i = 0;

        loop {
            if (i == 1) { // i never changed
                break // this statement breaks loop
            }
        };

        // actually unreachable
        0x1::Debug::print<u8>(&i);
    }
}
```
对于编译器而言，要了解循环是否真的是无限的，这是一项艰巨的任务，因此，就目前而言，只有开发者自己可以帮助自己发现循环错误，避免资产损失。

通过break和continue跳出循环

注意，如果 break 和 continue 是代码块中的最后一个关键字，则不能在其后加分号，因为后面的任何代码都不会被执行。

终止程序执行abort
```rust
script {
    fun main(a: u8) {

        if (a != 10) {
            abort 0;
        }

        // code here won't be executed if a != 10
        // transaction aborted
    }
}
```

使用assert断言方法
内置方法 assert(<condition>, <code>) 对 abort和条件进行了封装，你可以在代码中任何地方使用它。
```rust
script {

    fun main(a: u8) {
        assert(a == 10, 0);

        // code here will be executed if (a == 10)
    }
}
```

## 模块和导入

模块是发布在特定地址下的打包在一起的一组函数和结构体。

脚本需要与已发布的模块或标准库一起运行，而标准库本身就是在 0x1 地址下发布的一组模块。

模块在发布者的地址下发布。标准库在 0x1 地址下发布。

发布模块时，不会执行任何函数。要使用模块就得使用脚本。

模块是发布代码供他人访问的唯一方法。新的类型和 Resource 也只能在模块中定义。

默认情况下，模块将在发布者的地址下进行编译和发布。但如果只是测试或开发，或者想要在模块中指定地址，请使用以下address {}语法：
```rust
address 0x1 {
module Math {
    // module contents

    public fun sum(a: u64, b: u64): u64 {
        a + b
    }
}
}
```

### 导入
move除了可以在全局上下文去操作各种类型，还可以导入别人的模块或者标准库进行开发。

直接导入
```rust
script {
    fun main(a: u8) {
        0x1::Debug::print(&a);
    }
}
// 在此示例中，我们从地址0x1（标准库）导入了 Debug 模块，并使用了它的 print 方法。
```

使用关键词use导入
```rust
use <Address>::<ModuleName>;
use 0x1::Vector;
```

访问模块的内容
要访问导入的模块的方法（或类型），需要使用`::`符号。

在script脚本中访问
```rust
script {
    use 0x1::Vector;

    // in just the same way you can import any
    // other module(s). as many as you want!

    fun main() {
        let _ = Vector::empty<u64>();
    }
}
```

在模块中导入
和在script导入一样

成员导入
导入语句还可以进一步被扩展，可以直接导入模块的成员:
```rust
script {
    // single member import
    use 0x1::Signer::address_of;

    // multi member import (mind braces)
    use 0x1::Vector::{
        empty,
        push_back
    };

    fun main(acc: &signer) {
        // use functions without module access
        let vec = empty<u8>();
        push_back(&mut vec, 10);

        // same here
        let _ = address_of(acc);
    }
}
```

使用 Self 来同时导入模块和模块成员
```rust
script {
    use 0x1::Vector::{
        Self, // Self == Imported module
        empty
    };

    fun main() {
        // `empty` imported as `empty`
        let vec = empty<u8>();

        // Self means Vector
        Vector::push_back(&mut vec, 10);
    }
}
```

使用use as 来处理同名的别名导入
```rust
script {
    use 0x1::Vector as V; // V now means Vector

    fun main() {
        V::empty<u64>();
    }
}
// 在模块中类似语法
```

##  常量
Move 支持模块或脚本级常量。常量一旦定义，就无法更改。

常量可以定义为基本类型或者数组， 但是只能在模块和脚本内部访问。
```rust
module M {
    // 类似ts的语法
    const MAX : u64 = 100;

    // however you can pass constant outside using a function
    public fun get_max(): u64 {
        MAX
    }

    // or using
    public fun is_max(num: u64): bool {
        num == MAX
    }
}
```

## 函数
Move 中代码的执行是通过调用函数实现。

Move 函数使用snake_case命名规则，也就是小写字母以及下划线作为单词分隔符。
```rust
fun function_name(arg1: u64, arg2: bool): u64 {
    // function body
}
```

### 脚本中的函数
脚本块只能包含一个main函数。它作为交易被执行，可以有参数，但是没有返回值。它可以操作其它已经发布的模块中的函数。
```rust
// 判断地址是否存在
script {
    use 0x1::Account;

    fun main(addr: address) {
        assert(Account::exists(addr), 1);
    }
}
```

### 模块中的函数
脚本中能使用的函数功能是相对有限的，函数的全部潜能只有在模块中才能展现。

模块是一组函数和结构体，可以封装多项功能。
```rust
module Math {
    fun zero(): u8 {
        0
    }
}
// 0 之后没有分号 作为函数的返回值返回，就像块表达式一样
```

### 函数参数
可以设置多个参数，且每个参数有两个属性：参数名和参数类型。

像作用域中定义的任何其他变量一样，函数参数仅存在于函数体内。当函数块结束时，参数也会消亡。

```rust
// 参数语法和返回值语法类似TS
module Math {

    public fun sum(a: u64, b: u64): u64 {
        a + b
    }

    fun zero(): u8 {
        0
    }
}
```
### 如何在脚本内使用这些函数
通过导入即可：
```rust
script {
    use 0x1::Math;  // used 0x1 here; could be your address
    use 0x1::Debug; // this one will be covered later!

    fun main(first_num: u64, second_num: u64) {

        // variables names don't have to match the function's ones
        let sum = Math::sum(first_num, second_num);

        Debug::print<u64>(&sum);
    }
}
```

return 返回结果：
如果要返回多个结果？
```rust
module Math {

    // ...

    public fun max(a: u8, b: u8): (u8, bool) {
        if (a > b) {
            (a, false)
        } else if (a < b) {
            (b, false)
        } else {
            (a, true)
        }
    }
}
```

### 函数可见性：
使用函数可见性修饰符。
```rust
module Math {
    // sum 能够被别的模块访问 zero不行
    public fun sum(a: u64, b: u64): u64 {
        a + b
    }

    fun zero(): u8 {
        0
    }
}
```
那么如何访问私有函数？
私有函数只能在定义它们的模块中访问。

但是可以在调用public函数时用私有函数执行一些操作。
```rust
module Math {

    public fun is_zero(a: u8): bool {
        a == zero() // 直接调用内部函数
    }

    fun zero(): u8 {
        0
    }
}
```

### 本地方法：

有一种特殊的函数叫做"本地方法"。本地方法实现的功能超出了 Move 的能力，它可以提供了额外的功能。本地方法由 VM 本身定义，并且在不同的VM实现中可能会有所不同。这意味着它们没有用 Move 语法实现，没有函数体，直接以分号结尾。关键字 native 用于标记本地函数，它和函数可见性修饰符不冲突，native 和 public 可以同时使用。

```rust
// Diem标准库中的示例
module Signer {

    native public fun borrow_address(s: &signer): &address;

    // ... some other functions ...
}
```

## 结构体
语法类似TS定义interface
```rust
struct NAME {
    FIELD1: TYPE1,
    FIELD2: TYPE2,
    ...
}
// 被定义的结构体成为新的类型 可以通过定义它的模块来访问
module M {

    // struct can be without fields
    // but it is a new type
    struct Empty {}

    struct MyStruct {
        field1: address,
    }

    struct Example {
        field1: u8,
        // you can use another struct as type
        field6: MyStruct
    }
}
M::MyStruct;
// or
M::Example;
```

### 不允许递归定义结构体。
```rust
module M {
    struct MyStruct {
        // WON'T COMPILE
        field: MyStruct
    }
}
```

### 创建结构体实例：
```rust
module Country {
    struct Country {
        id: u8,
        population: u64
    }
    // Contry is a return type of this function!
    public fun new_country(c_id: u8, c_population: u64): Country {
        // structure creation is an expression
        let country = Country {
            id: c_id,
            population: c_population
        };
        country
    }
}
// 设置可以通过函数参数名与结构体字段匹配的方式来创造实例
public fun new_country(id: u8, population: u64): Country {
    // id matches id: u8 field
    // population matches population field
    Country {
        id,
        population
    }
    // or even in one line: Country { id, population }
}
```

### 访问结构体字段：
struct.x // 只有在定义模块内可访问

### 设置结构体getter供外部访问：
```rust
module Country {

    struct Country {
        id: u8,
        population: u64
    }

    public fun new_country(id: u8, population: u64): Country {
        Country {
            id, population
        }
    }

    // don't forget to make these methods public!
    public fun id(country: &Country): u8 {
        country.id
    }

    // don't mind ampersand here for now. you'll learn why it's 
    // put here in references chapter 
    public fun population(country: &Country): u64 {
        country.population
    }

    // ... fun destroy ... 
}

// 外部访问
script {
    use {{sender}}::Country as C;
    use 0x1::Debug;

    fun main() {
        // variable here is of type C::Country
        let country = C::new_country(1, 10000000);

        Debug::print<u8>(
            &C::id(&country)
        ); // print id

        Debug::print<u64>(
            &C::population(&country)
        );
        // however this is impossible and will lead to compile error
        // let id = country.id;
        // let population = country.population.
    }
}
```

### 结构体销毁：
语法 `let <STRUCT DEF> = <STRUCT>`

Move 中禁止定义不会被使用的变量，有时你可能需要在不使用其字段的情况下销毁该结构体。对于未使用的结构体字段，请使用下划线"_"表示
```rust
module Country {
    // ...
    public fun destroy(country: Country) {
        // this way you destroy struct and don't create unused variables
        let Country { id: _, population: _ } = country;
        // or take only id and don't init `population` variable
        // let Country { id, population: _ } = country;
    }
}
```

销毁结构体并不是必需的，但是，Resource结构体则必需被销毁。

## abilities类型限制符
定义了类型的值是否可以被复制、丢弃、访问和存储。 分别是: Copy, Drop, Key 和 Store.

基本类型和内建类型的 abilities 是预先定义好的并且不可改变: integers, vector, addresses 和 boolean 类型的值先天具有 copy，drop 和 store ability。

但是结构体的限制符可以按以下语法添加：
`struct NAME has ABILITY [, ABILITY] { [FIELDS] }`

## 所有权和引用
js有定期垃圾回收 底层系统设计语言类似c需要自己管理内存释放 rust的垃圾回收手动管理，通过所有权系统和编译时的一些规则管理内存。
```rust
module M {
    // create_fun skipped
    struct T { value: u8 }

    public fun create(value: u8): T {
        T { value }
    }

    // variable t of type M::T passed
    // `value()` function takes ownership
    public fun value(t: T): u8 {
        // we can use t as variable
        t.value
    }
    // function scope ends, t dropped, only u8 result returned
    // t no longer exists
}

script {
    use {{sender}}::M;
    fun main() {
        // Module::T is a struct
        let a : Module::T = Module::create(10);
        // here variable `a` leaves scope of `main` function
        // and is being put into new scope of `M::value` function
        M::value(a);
        // variable a no longer exists in this scope
        // this code won't compile
        M::value(a);
    }
}
```

当函数 value() 结束时，t 将不复存在，返回的只是一个 u8 类型的值。如何让t仍然可用呢？
move copy 关键字：
```rust
script {
    use {{sender}}::M;

    fun main() {
        let a : Module::T = Module::create(10);

        M::value(move a); // variable a is moved 这里的move可以缺省不填默认move

        // local a is dropped
    }
}
script {
    use {{sender}}::M;

    fun main() {
        let a : Module::T = Module::create(10);

        // we use keyword copy to clone structure
        // can be used as `let a_copy = copy a`
        M::value(copy a);
        M::value(a); // won't fail, a is still here
    }
}
```
在区块链中，交易执行时占用的内存资源是消耗交易费的，每个字节都会影响交易执行费用。因此不加限制的使用 copy 会浪费很多交易费。

### 引用：
类似js的引用， 使用引用可以避免使用过多的copy节省gas

引用（标记为＆）使我们可以使用值而无需拥有所有权。

Move 支持两种类型的引用：不可变引用 &（例如&T）和可变引用 &mut（例如&mut T）。不可变引用允许读取值。可变引用可以读取和更改值。
```rust
module M {
    struct T { value: u8 }
    // ...
    // ...
    // instead of passing a value, we'll pass a reference
    public fun value(t: &T): u8 {
        t.value
    }
}
```

### Borrow 检查：
Move 通过"Borrow 检查"来控制程序中"引用"的使用，这样有助于防止意外出错。
```rust
module Borrow {

    struct B { value: u64 }
    struct A { b: B }

    // create A with inner B
    public fun create(value: u64): A {
        A { b: B { value } }
    }

    // give a mutable reference to inner B
    public fun ref_from_mut_a(a: &mut A): &mut B {
        &mut a.b
    }

    // change B
    public fun change_b(b: &mut B, value: u64) {
        b.value = value;
    }
}
script {
    use {{sender}}::Borrow;

    fun main() {
        // create a struct A { b: B { value: u64 } }
        let a = Borrow::create(0);

        // get mutable reference to B from mut A
        let mut_a = &mut a;
        let mut_b = Borrow::ref_from_mut_a(mut_a);

        // change B
        Borrow::change_b(mut_b, 100000);

        // get another mutable reference from A
        let _ = Borrow::ref_from_mut_a(mut_a);
    }
}
// 我们使用 A 的可变引用（&mut A）来获取对其内部 struct B 的可变引用（&mut B）。然后我们改变 B。然后可以再次通过 &mut A 获取对 B 的可变引用。
// 如果我们交换最后两个表达式，即首先尝试创建新的 &mut A，而 &mut B 仍然存在，会出现什么情况呢？
let mut_a = &mut a;
let mut_b = Borrow::ref_from_mut_a(mut_a);

let _ = Borrow::ref_from_mut_a(mut_a);

Borrow::change_b(mut_b, 100000);
// 该代码不会编译成功。为什么？因为 &mut A 已经被 &mut B 借用。如果我们再将其作为参数传递，那么我们将陷入一种奇怪的情况，A 可以被更改，但 A 同时又被引用。而 mut_b 应该指向何处呢？
```
  1. 编译器通过所谓的"借用检查"（最初是Rust语言的概念）来防止上面这些错误。编译器通过建立"借用图"，不允许被借用的值被"move"。这就是 Move 在区块链中如此安全的原因之一。
  2. 可以从引用创建新的引用，老的引用将被新引用"借用"。可变引用可以创建可变或者不可变引用，而不可变引用只能创建不可变引用。
  3. 当一个值被引用时，就无法"move"它了，因为其它值对它有依赖。

### 取值运算：
可以通过取值运算*来获取引用所指向的值。

取值运算实际上是产生了一个副本，要确保这个值具有 Copy ability。

取值运算不会将原始值 move 到当前作用域，实际上只是生成了一个副本。
```rust
module M {
    struct T has copy {}

    // value t here is of reference type
    public fun deref(t: &T): T {
        *t
    }
}
// 使用*&，引用并取值。通过使用*&（编译器会建议这样做），我们复制了结构体的内部值。
module M {
    struct H has copy {}
    struct T { inner: H }

    // we can do it even from immutable reference!
    public fun copy_inner(t: &T): H {
        *&t.inner
    }
}
```

### 引用基本类型：
基本类型非常简单，它们不需要作为引用传递，缺省会被复制。当基本类型的值被传给函数时，相当于使用了copy关键字，传递进函数的是它们的副本。

## 泛型
rust对于泛型的定义：
泛型是具体类型或其他属性的抽象替代品。实际上，泛型允许我们只编写单个函数，而该函数可以应用于任何类型。这种函数也被称为模板 —— 一个可以应用于任何类型的模板处理程序。

Move 中泛型可以应用于结构体和函数的定义中。

### 结构体中的泛型：
```rust
module Storage {
    struct Box {
        value: u64
    }
}
// 如果我们需要增加u8,u128的Box结构体， 可以使用泛型定义，类型T实际并不存在，它只是任何类型的占位符。
module Storage {
    struct Box<T> {
        value: T
    }
}
```

### 函数中的泛型：
```rust
module Storage {
    struct Box<T> {
        value: T
    }

    public fun create<T>(value: T): Box<T> {
        Box { value }
    }
}
```

### 函数调用中使用泛型：
```rust
script {
    use {{sender}}::Storage;
    use 0x1::Debug;

    fun main() {
        // value will be of type Storage::Box<bool>
        let bool_box = Storage::create_box<bool>(true);
        let bool_val = Storage::value(&bool_box);

        assert(bool_val, 0);

        // we can do the same with integer
        let u64_box = Storage::create_box<u64>(1000000);
        let _ = Storage::value(&u64_box);

        // let's do the same with another box!
        let u64_box_in_box = Storage::create_box<Storage::Box<u64>>(u64_box);

        // accessing value of this box in box will be tricky :)
        // Box<u64> is a type and Box<Box<u64>> is also a type
        let value: u64 = Storage::value<u64>(
            &Storage::value<Storage::Box<u64>>( // Box<u64> type
                &u64_box_in_box // Box<Box<u64>> type
            )
        );

        // you've already seed Debug::print<T> method
        // which also uses generics to print any type
        Debug::print<u64>(&value);
    }
}
```

### abilities限制符作用于泛型：
```rust
fun name<T: copy>() {} // allow only values that can be copied
fun name<T: copy + drop>() {} // values can be copied and dropped
fun name<T: key + store + drop + copy>() {} // all 4 abilities are present
// 结构体中使用
struct name<T: copy + drop> { value: T } // T can be copied and dropped
struct name<T: stored> { value: T } // T can be stored in global storage
```

另一个需要被提及的是结构体的成员必须和结构体具有相同的 abilities （除了key以外）。 但是为了避免犯错，应该尽可能使泛型参数的限制符和结构体本身的 abilities 显式的保持一致。

### 泛型中包含多个类型：
```rust
module Storage {

    struct Box<T> {
        value: T
    }

    struct Shelf<T1, T2> {
        box_1: Box<T1>,
        box_2: Box<T2>
    }

    public fun create_shelf<Type1, Type2>(
        box_1: Box<Type1>,
        box_2: Box<Type2>
    ): Shelf<Type1, Type2> {
        Shelf {
            box_1,
            box_2
        }
    }
}
```

### 未使用的类型参数：
泛型中指定的每种类型参数不一定都需要被使用。
```rust
module Storage {

    // these two types will be used to mark
    // where box will be sent when it's taken from shelf
    struct Abroad {}
    struct Local {}

    // modified Box will have target property
    struct Box<T, Destination> {
        value: T
    }

    public fun create_box<T, Dest>(value: T): Box<T, Dest> {
        Box { value }
    }
}
script {
    use {{sender}}::Storage;

    fun main() {
        // value will be of type Storage::Box<bool>
        let _ = Storage::create_box<bool, Storage::Abroad>(true);
        let _ = Storage::create_box<u64, Storage::Abroad>(1000);

        let _ = Storage::create_box<u128, Storage::Local>(1000);
        let _ = Storage::create_box<address, Storage::Local>(0x1);

        // or even u64 destination!
        let _ = Storage::create_box<address, u64>(0x1);
    }
}
```

## 数组
我们已经非常熟悉结构体类型了，它使我们能够创建自己的类型并存储复杂数据。但是有时我们需要动态、可扩展和可管理的功能。为此，Move 提供了向量 Vector。

Vector 是用于存储数据集合的内置类型。集合的数据可以是任何类型（但仅一种）。Vector 功能实际上是由 VM 提供的，不是由 Move 语言提供的，使用它的唯一方法是使用标准库和 native 函数。
```rust
script {
    use 0x1::Vector;

    fun main() {
        // use generics to create an emtpy vector
        let a = Vector::empty<&u8>();
        let i = 0;

        // let's fill it with data
        while (i < 10) {
            Vector::push_back(&mut a, i);
            i = i + 1;
        }

        // now print vector length
        let a_len = Vector::length(&a);
        0x1::Debug::print<u64>(&a_len);

        // then remove 2 elements from it end element
        Vector::pop_back(&mut a);
        Vector::pop_back(&mut a);

        // and print length again
        let a_len = Vector::length(&a);
        0x1::Debug::print<u64>(&a_len);
    }
}
```

### 内联 Vector 定义的十六进制数组和字符串:
```rust
script {

    use 0x1::Vector;

    // this is the way to accept arguments in main
    fun main(name: vector<u8>) {
        let _ = name;

        // and this is how you use literals
        // this is a "hello world" string!
        let str = x"68656c6c6f20776f726c64";

        // hex literal gives you vector<u8> as well
        Vector::length<u8>(&str);
    }
}
// 更简单的方法是使用字符串字面值（literal）,它们被视为 ASCII 字符串，也被解释为 vector。
script {

    fun main() {
        let _ = b"hello world";
    }
}
```

### Vector各种方法：
```rust
// 创建一个类型为<E>的空向量
Vector::empty<E>(): vector<E>;
// 获取向量的长度
Vector::length<E>(v: &vector<E>): u64;
// 将元素 e 添加到向量末尾
Vector::push_back<E>(v: &mut vector<E>, e: E);
// 获取对向量元素的可变引用。不可变引用可使用Vector::borrow()
Vector::borrow_mut<E>(v: &mut vector<E>, i: u64): &E;
// 从向量的末尾取出一个元素
Vector::pop_back<E>(v: &mut vector<E>): E;
```

## 可编程 Resource
简单理解就是在move中资源Resource作为特殊结构体，可以被存储和在函数中作为参数或者被返回。通过代码的方式管理数字资产。

Resource 永远不能被复制，重用或丢弃。

Resource 类型只能由定义该类型的模块创建或销毁。

### 发送者和签署者：

Signer 是一种原生的类似 Resource 的不可复制的类型，它包含了交易发送者的地址。

Signer 类型代表了发送者权限。换句话说，使用 signer 意味着可以访问发送者的地址和 Resource。它与signature没有直接关系，就 Move VM 而言，它仅表示发送者。

Signer 只有一种 ability： Drop。

#### 脚本中的Signer：
Signer 是原生类型，使用前必须先创建。与 vector 这样的原生类型不同，signer 不能直接在代码中创建，但是可以作为脚本参数传递：
```rust
script {
    // signer is an owned value
    // 当前，约定俗成的 signer 类型的变量名是 account
    fun main(account: signer) {
        let _ = account;
    }
}
```
Signer 参数无需手动将其传递到脚本中，客户端（CLI）会自动将它放入你的脚本中。而且，signer 自始至终都只是引用，虽然标准库中可以访问签名者的实际值，但使用此值的函数是私有的，无法在其他任何地方使用或传递 signer 值。

#### 标准库中的Signer：
```rust
module Signer {
    // Borrows the address of the signer
    // Conceptually, you can think of the `signer`
    // as being a resource struct wrapper arround an address
    // ```
    // resource struct Signer { addr: address }
    // ```
    // `borrow_address` borrows this inner field
    native public fun borrow_address(s: &signer): &address;

    // Copies the address of the signer
    public fun address_of(s: &signer): address {
        *borrow_address(s)
    }
}
// 模块中包含两个方法，一个是原生方法，另一个是 Move 方法。后者使用更方便，因为它使用了取值运算符来复制地址。
script {
    fun main(account: signer) {
        let _ : address = 0x1::Signer::address_of(&account);
    }
}
```
引入signer类型的原因之一是要明确显示哪些函数需要发送者权限，哪些不需要。因此，函数不能欺骗用户未经授权访问其 Resource。

## Resource
Move 白皮书中详细描述了 Resource 这个概念。最初，它是作为一种名为 resource 的结构体类型被实现，自从引入 ability 以后，它被实现成拥有 Key 和 Store 两种 ability 的结构体。

Resource 可以安全的表示数字资产，它不能被复制，也不能被丢弃或重新使用，但是它却可以被安全地存储和转移。
```rust
module M {
    struct T has key, store {
        field: u8
    }
}
```
Resource的限制：
  1. Resource 存储在帐户下。因此，只有在分配帐户后才会存在，并且只能通过该帐户访问。
  2. 一个帐户同一时刻只能容纳一个某类型的 Resource。
  3. Resource 不能被复制；与它对应的是一种特殊的kind：resource，它与copyable不同，这一点在泛型章节中已经介绍。
  4. Resource 必需被使用，这意味着必须将新创建的 Resource move到某个帐户下，从帐户移出的Resource 必须被解构或存储在另一个帐户下。

## Resource 示例
本节中，我们将学习如何定义、使用 Resource。最终我们将得到一份完整的智能合约，可以作为模板供日后使用。

我们将创建一个集合合约，它的功能包括：
  1. 创建一个集合
  2. 集合中添加、取出元素
  3. 回收集合

### 创建和转移：
```rust
module Collection {
    use 0x1::Vector;

    struct Item has store {
        // we'll think of the properties later
    }
    struct Collection has key {
        items: <Item>
    }
    // note that &signer type is passed here!
    public fun start_collection(account: &signer) {
        move_to<Collection>(account, Collection {
            items: Vector::empty<Collection>()
        })
    }
}
```
还记得 signer 吗？现在，你将了解它的运作方式！移动 Resource 到 account 需要使用内建函数 move_to，需要 signer 作为第一个参数，T 作为第二个参数。
`native fun move_to<T: key>(account: &signer, value: T);`

查看Resource是否存在：
Move 提供 exists 函数来查看某 Resource 是否存在于给定地址下
`native fun exists<T: key>(addr: address): bool;`

```rust
module Collection {
    struct Item has store, drop {}

    struct Collection has store, key {
        items: Item
    }

    // ... skipped ...

    /// this function will check if resource exists at address
    public fun exists_at(at: address): bool {
        exists<Collection>(at)
    }
}
```

### 读取和修改：
Move 有两个内建函数用来读取和修改 Resource。它们的功能就像名字一样：borrow_global 和 borrow_global_mut。

不可变借用 borrow_global:
```rust
module Collection {

    // added a dependency here!
    use 0x1::Signer;
    use 0x1::Vector;

    struct Item has store, drop {}
    struct Collection has key, store {
        items: vector<Item>
    }

    // ... skipped ...

    /// get collection size
    /// mind keyword acquires!
    public fun size(account: &signer): u64 acquires Collection {
        let owner = Signer::address_of(account);
        let collection = borrow_global<Collection>(owner);

        Vector::length(&collection.items)
    }
}
```
全局函数 borrow_global 返回了对 Resource T 的不可变引用。
`native fun borrow_global<T: key>(addr: address): &T;`

由于 Borrow 检查，你不能返回对 Resource 的引用或对其内容的引用（因为对 Resource 的引用将在函数作用域结束时消失）。

由于 Resource 是不可复制的类型，因此不能在其上使用取值运算符 “*”。

上面代码里的关键字 acquires。该关键字放在函数返回值之后，用来显式定义此函数获取的所有 Resource。我们必须指定所有获取的 Resource，即使它实际上是子函数所获取的 Resource，即父函数必须在其获取列表中包含子函数的获取列表。
`fun <name>(<args...>): <ret_type> acquires T, T1 ... {`

可变借用 borrow_global_mut:
获得对 Resource 的可变引用。
```rust
module Collection {

    // ... skipped ...

    public fun add_item(account: &signer) acquires T {
        let collection = borrow_global_mut<T>(Signer::address_of(account));

        Vector::push_back(&mut collection.items, Item {});
    }
}
```
`native fun borrow_global_mut<T: key>(addr: address): &mut T;`

### 取出和销毁：
`move_from`，它用来将 Resource 从账户下取出。我们将实现 destroy 函数，将 Collection 的 T Resource 从账户取出并且销毁它的内容。
```rust
module Collection {

    // ... skipped ...

    public fun destroy(account: &signer) acquires Collection {

        // account no longer has resource attached
        let collection = move_from<Collection>(Signer::address_of(account));

        // now we must use resource value - we'll destructure it
        // look carefully - Items must have drop ability
        let Collection { items: _ } = collection;

        // done. resource destroyed
    }
}
```
`native fun move_from<T: key>(addr: address): T;`