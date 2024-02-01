// 0x9b02ce523d8bce69ff7d3924018e6753bb4f65e153b7979e44435291c089b6c2
module satoshi_flip::counter_nft {

    use std::vector;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer::{Self};
    use sui::bcs::{Self};

    // Counter结构
    struct Counter has key {
        id: UID,
        count: u64,
    }

    // 销毁Counter
    entry fun burn(self: Counter) {
        //解构
        let Counter { id, count: _ } = self;
        //由于没有drop 删除id
        object::delete(id);
    }

    // 铸造新Counter的公共函数，返回一个新的 Counter 结构
    public fun mint(ctx: &mut TxContext): Counter {
        Counter {
            id: object::new(ctx),
            count: 0
        }
    }

    // 将Counter转移给调用者的公共函数
    public fun transfer_to_sender(counter: Counter, ctx: &mut TxContext) {
        transfer::transfer(counter, tx_context::sender(ctx));
    }
    
    // 获取 VRF 输入并增加计数的公共函数
    public fun get_vrf_input_and_increment(self: &mut Counter): vector<u8> {
        // 获取Counter的 ID 字节表示
        let vrf_input = object::id_bytes(self);
        // 将计数值转换为字节数组并追加到 VRF 输入中
        let count_to_bytes = bcs::to_bytes(&count(self));
        vector::append(&mut vrf_input, count_to_bytes);
        // 增加Counter的计数值
        increment(self);
        vrf_input
    }

    // 获取Counter的计数值的公共函数
    public fun count(self: &Counter): u64 {
        self.count
    }

    // 增加Counter的计数值的函数
    fun increment(self: &mut Counter) {
        self.count = self.count + 1;
    }

    // 测试用销毁函数
    #[test_only]
    public fun burn_for_testing(self: Counter) {
        burn(self);
    }
}
