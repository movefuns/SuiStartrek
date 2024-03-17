# 学习日志

#### 第一个合约

#### 代码

```move
module myAccount::first_heyue {
  struct Coin has key {
    value: u64
  }

  public fun mint(account: signer, value: u64) {
    move_to(&account, Coin { value })
  }
}
```

#### 结果

![image-20240309195753916](assets/image-20240309195753916.png)

#### 合约地址

```
  "sender": "d27fc7a5d14c1280c5ebfa0afb46a55ac9d61525a024a6b9350b240d67926344",
```

#### 
