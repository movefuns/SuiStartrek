# 学习日志

# SUI学习笔记
## 学习资料
[sui官网](https://docs.sui.io/)
https://intro-zh.sui-book.com/

# 代码仓库
https://github.com/hwwang2/web3-sui-study

# 01初体验，第一个合约
[sui move01](https://a6jorfgvgf.feishu.cn/docx/IqnTd6KulokqlbxGpEKci7QInzb)

主要包括一下内容：
* 环境安装
* sui命令行
* 第一个合约

合约地址：0x53c51e58165a3990355f27e20d838b7dda6b02d6c7a2960f441ad325f2a7abd0

# 发行代币

[代币合约](https://github.com/hwwang2/web3-sui-study/blob/main/hwcoin/sources/HwCoin.move)

执行发布：
`sui client publish --gas-budget 500000000 --skip-fetch-latest-git-deps --skip-dependency-verification`

注意要把结果中coid地址和生成的TREASURY-CAP-ID都保存下来

发布的coin:
0xae9c67ac82c3bdbf15cd3ad55f358983092e16ddb63b32d14ab043764d60e58e

生成的TREASURY-CAP-ID：0xd3fe40fab0e19834a5f5450f68bb11d069ba9c44e3d15401d0db969b5665fda3

https://suiexplorer.com/object/0xae9c67ac82c3bdbf15cd3ad55f358983092e16ddb63b32d14ab043764d60e58e?network=devnet

调用函数铸造代币，发送给另外的账号
`sui client call --function mint --module htcoin --package 0xae9c67ac82c3bdbf15cd3ad55f358983092e16ddb63b32d14ab043764d60e58e --args 0xd3fe40fab0e19834a5f5450f68bb11d069ba9c44e3d15401d0db969b5665fda3 10000 0x340ff414f778eb4ad4189770a1009ab3d980c1a6cc40832ceb00bf1faa43ad97 --gas-budget 100000000`

可以在sui wallet中看下发送的效果，这种合约类似ERC20，可以直接把账户的coin再发送给另外的账户

# mint NFT

[NFT合约](https://github.com/hwwang2/web3-sui-study/blob/main/nft/sources/hwnft.move)
编译项目
`sui move build`
发布项目
`sui client publish --gas-budget 10000000`

生成的合约地址： 0x7e0f3f115876f358f2c56d38093593d35565ad5f0c6fc77636cf670732638c4b 

https://suiexplorer.com/object/0x7e0f3f115876f358f2c56d38093593d35565ad5f0c6fc77636cf670732638c4b?network=devnet

调用函数铸造nft
`sui client call --function mint --module hwnft --package 0x7e0f3f115876f358f2c56d38093593d35565ad5f0c6fc77636cf670732638c4b --args hwnft my_avatar_nft https://avatars.githubusercontent.com/u/8943925 --gas-budget 10000000`

铸造链上地址：https://suiexplorer.com/txblock/VJDWeTTNHZVtxKU9aapzf6Ngu2Eb5sXqfxSEY6XipzR?network=devnet

# 游戏合约

[游戏合约](https://github.com/hwwang2/web3-sui-study/blob/main/game2/sources/game2.move)

逻辑：play输入0/1/2,合约使用时钟%3来作为输入，比谁赢

0xb1d4d6e25ec4aa06e2262d350bdae94777b62023fd7aca1156d2ca06559fe8f3
`https://suiexplorer.com/object/0xb1d4d6e25ec4aa06e2262d350bdae94777b62023fd7aca1156d2ca06559fe8f3?network=devnet`

### 调用play函数
`sui client call --gas-budget 10000000 --module finger_guessing --function play --args 0 '0x6' --package 0xb1d4d6e25ec4aa06e2262d350bdae94777b62023fd7aca1156d2ca06559fe8f3`