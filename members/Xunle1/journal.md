# 学习日志

## Sui 命令行（Sui CLI）

### Sui Client CLI

`Sui Client CLI` 提供与 Sui 网络交互的命令行形式。通常用来发布 Move 智能合约，获取对象信息，执行事务，管理地址。

列出所有环境，环境信息被存储在 `~/.sui/sui_cnfig/client.yaml`。

```shell
sui client envs
```

创建环境。

```shell
sui client new-env --alias=mainnet --rpc https://fullnode.main.net.sui.io:443
```

切换环境。

```shell
sui client switch --env mainnet
```

获取所有/当前地址

```shell
sui client addresses
sui client active-address
```

查询对象信息

```shell
sui client objects
sui client object <OBJECT-ID>
```

发布包

```shell
sui client publish --gas-budget <GAS_BUDGET> [package_path]
```

调用发布包的函数

```shell
sui client call --package <PACKAGE> --module <MODULE> --function <Function> --gas_budget <GAS_BUDGET>
```

### Sui keytool CLI

使用 `Sui Keytool CLI` 来管理地址、签名、私钥、zkLogin。

生成密钥

```shell
sui keytool generate <KEY_SCHEME>
```

导入密钥

```shell
sui keytool import <MNEMONIC_PHRASE> <KEY_SCHEME>
```

列出所有密钥

```shell
sui keytool list
```

### Sui Move CLI

创建 Move 包

```shell
sui move new <NAME>
```

构建/测试包

```shell
sui move build
sui move test
```

## Sui 对象（Sui object）

move 可以使用 `has` 关键字赋予 struct 能力，比如：

```shell
struct Sword has key, store {
	id: UID,
	magic: u64,
	strength: u64,	
}
```

这段代码定义了一个名为 `Sword` 拥有 `key`、`store` 能力的 struct 。`key` 能力表明这个 struct 有一个唯一 ID，拥有 `key` 能力的 struct 才是 `sui object` 。`store` 能力表示这个结构体可以作为为其他的 sui object 的属性。

拥有 `key` 和 `store` 能力的类型被称为资产。

## 函数 (Function)

### Init 函数

模块可以有一个特殊的初始化函数 init 运行在 publication time。使用 init 函数的条件有：

- 函数名必须是 `init`
- 参数列表必须以 `&mut TxContext` 或 `&TxContext` 类型参数结尾
- 没有返回值
- 可见性为 `private`

### entry 函数

entry 函数可以在交易中被调用。

- 用 `entry` 关键字声明。
- 没有返回值。
- 最后一个参数是 TxContext 的可变引用（optional）。

## 一次性见证（One Time Witness)

一次性见证是一种特殊类型的实例，仅在模块初始化时创建，并保证是单例的，具有以下定义的类型是 OTW：

- 以模块名称命名，所有字母大写
- 只拥有 drop 修饰符

可以使用 `sui::types::is_one_time_witness(&T)` 来检查 T 是否为一个 OTW 实例。

## 单元测试（Unit Tests）

### annotation

Move 使用三种注解完成单元测试：

- `#[test]`
- `#[test_only]`
- `#[expected_failure]`

使用 `#[test]` 和 `#[test_only]` 注解的代码只会在测试模式下被编译。

其中 `#[test]` 和 `#[expected_failure]` 只能用在函数上，且 `#[expected_failure]` 必须要和 `#[test]` 一起出现。

```rust
#[test]
#[expected_failure]
fun test_hello() {
	...
}
```

`#[test]` 和 `#[expected_failure]` 有带参数和不带参数情况。`#[test]` 只能使用 `signer` 类型参数，`#[expected_failure]` 表示测试的结果可以为 `abort`，并可以指定 `abort_code`，当 `abort_code` 与实际的 code 不相等时或者抛出 `non-abort error` 时测试才会失败。

```rust
#[test, expected_failure(abort_code = 1)]
fun test_abort() {
	abort 1;
}
```

`#[test_only]` 可以用在 function、module、use、struct 上，使用 `#[test_only]` 注解的标识的对象如果在非测试情况下使用会抛出错误。

### test_scenario

使用 `test_scenario` 测试 [Sui Move By Example 2.6. Transfer](https://examples.sui.io/basics/transfer.html)

```rust
#[test_only]
use sui::test_scenario as ts;
#[test_only]
use std::debug;
    
#[test]
fun test_create_profile() {
    let ctx1 = tx_context::dummy();
    let ctx2 = tx_context::dummy();
    let addr1 = tx_context::sender(&ctx1);
    let addr2 = tx_context::sender(&ctx2);
    let test_scenario = ts::begin(addr1);
    let ts = &mut test_scenario;
    {
        create_profile(b"xunle",b"xunle.github.io", &mut ctx2);
    };
    ts::next_tx(ts, addr2);
    {
        let wrapper: wrapper::Wrapper<ProfileInfo> = ts::take_from_sender(ts);
        debug::print(&wrapper);
        ts::return_to_sender(ts, wrapper);
    };
    ts::end(test_scenario);
    }
```

根据对象的类型，test_scenario 有许多可以获取对象的方法：

- `take_from_address`, `return_to_address`, `take_from_sender`, `return_to_sender`：地址所有对象
- `take_shared`, `return_shared`：共享对象
- `take_immutable`, `return_immutable`：不可变对象

需要注意像创建对象、转移对象这类操作只有在事务完成后才能可见，比如上面代码片段中在 `create_profile` 后，只有提交了事务后在下一个事务中  `take_from_sender` 才能有效。