/*
6f3b9cb60f7b4d260e275a660d7a5654e1e5d2d9785f266732cd108ee545f93c
Public Key:
8158564df454c05e724bdb89e75cf98fc03350970b0e5fc61e5846cc7624b7f9613757ddf95322c372f01914c25c52f3
house data id 0xaa99c1cc66e83096accd04c7b7419dbff04ebd015d60c7f23a98810396ca2845
*/
module satoshi_flip::house_data {

    use sui::object::{Self, UID};
    use sui::balance::{Self, Balance};
    use sui::sui::SUI;
    use sui::coin::{Self, Coin};
    use sui::package::{Self};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer::{Self};

    // 定义错误代码
    const ECallerNotHouse: u64 = 0;
    const EInsufficientBalance: u64 = 1;

    // 为其他模块授予权限
    friend satoshi_flip::single_player_satoshi;


    // house结构
    struct HouseData has key {
        id: UID,
        balance: Balance<SUI>,
        house: address,
        public_key: vector<u8>,
        max_stake: u64,
        min_stake: u64,
        fees: Balance<SUI>,
        base_fee_in_bp: u16
    }

    // 权限凭证，用来初始化house
    struct HouseCap has key {
        id: UID
    }

    // 一次性见证
    struct HOUSE_DATA has drop {}

    // 初始化函数，用于创建房屋容量对象并将其所有权转移到调用者
    fun init(otw: HOUSE_DATA, ctx: &mut TxContext) {
        package::claim_and_keep(otw, ctx);

        let house_cap = HouseCap {
            id: object::new(ctx)
        };

        transfer::transfer(house_cap, tx_context::sender(ctx));
    }

    // 初始化房屋数据，接受房屋容量、资金（Coin）、公钥和上下文
    public fun initialize_house_data(house_cap: HouseCap, coin: Coin<SUI>, public_key: vector<u8>, ctx: &mut TxContext) {
        // 确保传入的资金大于 0
        assert!(coin::value(&coin) > 0, EInsufficientBalance);

        // 创建 HouseData 结构并设置各项属性
        let house_data = HouseData {
            id: object::new(ctx),
            balance: coin::into_balance(coin),
            house: tx_context::sender(ctx),
            public_key,
            max_stake: 50_000_000_000,
            min_stake: 1_000_000,
            fees: balance::zero(),
            base_fee_in_bp: 100 
        };

        // 释放HouseCap
        let HouseCap { id } = house_cap;
        object::delete(id);

        // 共享房屋数据对象
        transfer::share_object(house_data);
    }

    //用于向房屋数据添加资金
    public fun top_up(house_data: &mut HouseData, coin: Coin<SUI>, _: &mut TxContext) {
        coin::put(&mut house_data.balance, coin)
    }

    //用于从房屋数据中提取资金
    public fun withdraw(house_data: &mut HouseData, ctx: &mut TxContext) {
        //初始化house的人可以调用
        assert!(tx_context::sender(ctx) == house(house_data), ECallerNotHouse);
        let total_balance = balance(house_data);
        let coin = coin::take(&mut house_data.balance, total_balance, ctx);
        transfer::public_transfer(coin, house(house_data));
    }

    // 用于从房屋数据中提取费用
    public fun claim_fees(house_data: &mut HouseData, ctx: &mut TxContext) {
        //初始化house的人可以调用
        assert!(tx_context::sender(ctx) == house(house_data), ECallerNotHouse);
        let total_fees = fees(house_data);
        let coin = coin::take(&mut house_data.fees, total_fees, ctx);
        transfer::public_transfer(coin, house(house_data));
    }

    // 更新最大投注额函数
    public fun update_max_stake(house_data: &mut HouseData, max_stake: u64, ctx: &mut TxContext) {
        //初始化house的人可以调用
        assert!(tx_context::sender(ctx) == house(house_data), ECallerNotHouse);
        house_data.max_stake = max_stake;
    }

    // 更新最小投注额函数
    public fun update_min_stake(house_data: &mut HouseData, min_stake: u64, ctx: &mut TxContext) {
        //初始化house的人可以调用
        assert!(tx_context::sender(ctx) == house(house_data), ECallerNotHouse);
        house_data.min_stake = min_stake;
    }

    //用于获取 HouseData 结构中的 balance 字段的可变引用
    public(friend) fun borrow_balance_mut(house_data: &mut HouseData): &mut Balance<SUI> {
        &mut house_data.balance
    }

    //用于获取 HouseData 结构中的 fees 字段的可变引用
    public(friend) fun borrow_fees_mut(house_data: &mut HouseData): &mut Balance<SUI> {
        &mut house_data.fees
    }

    //用于获取 HouseData 结构中的 id 字段的可变引用
    public(friend) fun borrow_mut(house_data: &mut HouseData): &mut UID {
        &mut house_data.id
    }

    //用于获取 HouseData 结构中的 id 字段的引用
    public(friend) fun borrow(house_data: &HouseData): &UID {
        &house_data.id
    }

    // 获取房屋数据的余额
    public fun balance(house_data: &HouseData): u64 {
        balance::value(&house_data.balance)
    }

    // 获取房屋数据的初始化者
    public fun house(house_data: &HouseData): address {
        house_data.house
    }

    // 获取房屋数据的公钥
    public fun public_key(house_data: &HouseData): vector<u8> {
        house_data.public_key
    }

    // 获取房屋数据的最大投注额
    public fun max_stake(house_data: &HouseData): u64 {
        house_data.max_stake
    }

    // 获取房屋数据的最小投注额
    public fun min_stake(house_data: &HouseData): u64 {
        house_data.min_stake
    }

    // 获取房屋数据的费用
    public fun fees(house_data: &HouseData): u64 {
        balance::value(&house_data.fees)
    }

    // 获取房屋数据的基础费用比例
    public fun base_fee_in_bp(house_data: &HouseData): u16 {
        house_data.base_fee_in_bp
    }

    // 测试用初始化函数
    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext) {
        init(HOUSE_DATA {}, ctx);
    }
}
/*
Transaction Digest: EFfnWWEppRUL61rMqswLrD84nDjL8rJ64bN8FjSdEUJZ
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6                                                                                  │
│ Gas Owner: 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6                                                                               │
│ Gas Budget: 200000000 MIST                                                                                                                                  │
│ Gas Price: 1000 MIST                                                                                                                                        │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0x94994ea6ed58e5a3f439a90a6d27670430ab43a5997b6aa9b43edffc9a4dca1f                                                                                   │
│  │ Version: 1085232                                                                                                                                         │
│  │ Digest: HFTQn66BXDCcFtGimkFdAzcLEb2X7UpxpnFJZ7DztiJu                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    hp+iNog7pvaTfXGDETUltghBEdo9hCml/sFxOdAzip/3z68rnAYiOFRCcBqtT/Sj+DIKQaUYrOt/AYTH7g+gAA==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EFfnWWEppRUL61rMqswLrD84nDjL8rJ64bN8FjSdEUJZ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 266                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0e1fc4384d277b9eaa0052269beafb0274affd19246bc1cffe84ca32e69b6d28                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: B4L2YL5GCxQppR2jX99QCQPWzmf7dyeXsYPoCQL8dt9M                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6cd237990d771452186dd5f47ec75a47033c5219c1840f6d6cfe66d359fefe4e                         │
│  │ Owner: Account Address ( 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6 )  │
│  │ Version: 1085233                                                                               │
│  │ Digest: A8mPbeL1pP3XTYmkBg2Jksbq4pQTKwUyPmraedC2Wb6s                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb72a97716f9d1154b44a41239ced984553e54236a82e175ed00bb1abcafe5905                         │
│  │ Owner: Account Address ( 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6 )  │
│  │ Version: 1085233                                                                               │
│  │ Digest: GEkMJXrBLS3HAjUDytt5sHs86w3aVqQkXSncY1FN3R2s                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xba3443c4b94e938c000925a37f46559c2c23be84437d0a1ea0753dcaacffe7e4                         │
│  │ Owner: Account Address ( 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6 )  │
│  │ Version: 1085233                                                                               │
│  │ Digest: DePEHYEx4PpGgiZN6AS5xsYqfFCbPf1BY5QpHGWthy9i                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x94994ea6ed58e5a3f439a90a6d27670430ab43a5997b6aa9b43edffc9a4dca1f                         │
│  │ Owner: Account Address ( 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6 )  │
│  │ Version: 1085233                                                                               │
│  │ Digest: DZMGSxWv8aP8rNwXZ48sanGVbvcUG62DgtV2JaSsNDAE                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x94994ea6ed58e5a3f439a90a6d27670430ab43a5997b6aa9b43edffc9a4dca1f                         │
│  │ Owner: Account Address ( 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6 )  │
│  │ Version: 1085233                                                                               │
│  │ Digest: DZMGSxWv8aP8rNwXZ48sanGVbvcUG62DgtV2JaSsNDAE                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 45486000                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3rXGwqgteTQcddFvRnCTzdfVwprC183QQyYWSdX7brvR                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                         │
│ Created Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x6cd237990d771452186dd5f47ec75a47033c5219c1840f6d6cfe66d359fefe4e                         │
│  │ Sender: 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6                           │
│  │ Owner: Account Address ( 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6 )        │
│  │ ObjectType: 0x2::package::Publisher                                                                  │
│  │ Version: 1085233                                                                                     │
│  │ Digest: A8mPbeL1pP3XTYmkBg2Jksbq4pQTKwUyPmraedC2Wb6s                                                 │
│  └──                                                                                                    │
│  ┌──                                                                                                    │
│  │ ObjectID: 0xb72a97716f9d1154b44a41239ced984553e54236a82e175ed00bb1abcafe5905                         │
│  │ Sender: 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6                           │
│  │ Owner: Account Address ( 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6 )        │
│  │ ObjectType: 0xe1fc4384d277b9eaa0052269beafb0274affd19246bc1cffe84ca32e69b6d28::house_data::HouseCap  │
│  │ Version: 1085233                                                                                     │
│  │ Digest: GEkMJXrBLS3HAjUDytt5sHs86w3aVqQkXSncY1FN3R2s                                                 │
│  └──                                                                                                    │
│  ┌──                                                                                                    │
│  │ ObjectID: 0xba3443c4b94e938c000925a37f46559c2c23be84437d0a1ea0753dcaacffe7e4                         │
│  │ Sender: 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6                           │
│  │ Owner: Account Address ( 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6 )        │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                 │
│  │ Version: 1085233                                                                                     │
│  │ Digest: DePEHYEx4PpGgiZN6AS5xsYqfFCbPf1BY5QpHGWthy9i                                                 │
│  └──                                                                                                    │
│                                                                                                         │
│ Mutated Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x94994ea6ed58e5a3f439a90a6d27670430ab43a5997b6aa9b43edffc9a4dca1f                         │
│  │ Sender: 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6                           │
│  │ Owner: Account Address ( 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6 )        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                           │
│  │ Version: 1085233                                                                                     │
│  │ Digest: DZMGSxWv8aP8rNwXZ48sanGVbvcUG62DgtV2JaSsNDAE                                                 │
│  └──                                                                                                    │
│                                                                                                         │
│ Published Objects:                                                                                      │
│  ┌──                                                                                                    │
│  │ PackageID: 0x0e1fc4384d277b9eaa0052269beafb0274affd19246bc1cffe84ca32e69b6d28                        │
│  │ Version: 1                                                                                           │
│  │ Digest: B4L2YL5GCxQppR2jX99QCQPWzmf7dyeXsYPoCQL8dt9M                                                 │
│  │ Modules: counter_nft, house_data, single_player_satoshi                                              │
│  └──                                                                                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x2fcdfe7c92fe670d267474fbd7aa89baef55c5f93b1953a9e82614c9abb7abc6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -45507880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
*/