# 学习日志

## 在测试网部署简单的合约

1. 使用 sui cli 工具来生成钱包 `sli client new-address ed25519`, 需要自己保存好助记词和私钥
2. 本地开发可以选择使用测试网，开放网，本地网，这里为了网络链接效率和能够放心使用gas选择使用localnet 开发。大部分faucet每天都有限额 
    - 本地网validator 搭建可以参考 https://docs.sui.io/guides/developer/getting-started/local-network
3. 编写好合约之后，可以使用 `sui move build` 来测试合约的正确性，这里只能保证语法方面的正确性，语义或者业务逻辑正确性
需要测试等其他方式来保证。
4. 可以使用 `sui client publish --gas-budget 100000000` 来部署合约(在sui 里，应该是包更加准确)
5. 待测试完毕之后需要将，环境切换到测试网，使用 `sui client switch --env testnet`, 确保你之前添加过相应的 alias。https://docs.sui.io/guides/developer/getting-started/local-network#connect-the-sui-client-cli-to-your-local-network
6. 再次使用 `sui client publish --gas-budget 100000000` 来发布合约

### 学后心得
- 学习了move语言，sui合约编写，如何使用 cli 调用远程合约。
- 学习了sui 钱包，sui explorer 的使用。

## NFT部署
一个简单的NFT 其实就是创建带有属性的对象(Object), 一般来说会带有媒体属性(例如图片链接，音频链接，视频链接)。

- 部署地址: https://suiexplorer.com/txblock/BJPcUUQaySoSf8kSusLxsPQg4iNb86cSdKL4RM5KvbvL?network=testnet
- mint: `sui client call --package 0xf159b534888f530104f72c5de0db912acbf8e92702eaedd94e3534782104732a --module puppy --function mint --args 0x7615d911f256d1691e3f9818dc0ad2
3406d879a658222609ed52f45fbeb1996e "bethatguyad" "https://avatars.githubusercontent.com/u/160697994?s=400&u=d802beaccf8a2c2066a6c81729a850a3ca972927&v=4"  --gas-budget 10000000`





## 石头剪刀步游戏

### 玩法
0. 石头克制剪刀， 剪刀克制布，布克制石头
1. 游戏发布后需要，项目方充值初始的奖金池。
2. 该游戏模式为PVE，玩家选择想要出的手势, 发送一个合约调用，合约会生成一个伪随机数，根据这个数生成对应的手势，根据规则0, 生成结果，如果
玩家获胜，则从奖金池中提取一定额度奖金奖励玩家。

### 步骤
- 部署地址: https://suiexplorer.com/txblock/AJbjdsYqAgpMAPb7nM3qKigK4TDuo416RgPoRzt5PQjp?network=testnet
- play: `sui client call --package 0xa1649d81c4eb80aa4d6e31df1797446a80b0f8097d1b0292950f9bea6c2c3a7b --module game --function play --args 0xe95d96d96f8ac758e45f83fbb8d7951
f9b02a19131bf274121bda8158fcad822 0  --gas-budget 10000000`
- 添加池子: 由于涉及到，coin 的split和授权，我这里使用的使用 TS SDK 来完成该操作： 
https://github.com/bethatguyad/sui-learn/blob/master/my_first_package/src/index.mjs

### 学后心得
- 学习了随机数的生成, Event的使用
- 学习了 `ShareObject` 的使用，依赖该特性实现了奖金池，以及随机数状态的存储

