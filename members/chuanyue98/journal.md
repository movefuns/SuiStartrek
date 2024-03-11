# 学习日志

## 部署第一个智能合约

- 创建一个文件夹

- 运行命令

  ```
  sui move new hello_world
  ```

- 进入文件夹

  ```
  cd hello_world
  ```

- 在sources文件夹下，创建文件hello.move

  ![3a099f3abab9088830501c23a371b4cd](E:\LearningRepository\move\SuiStartrek\members\chuanyue98\imgs\3a099f3abab9088830501c23a371b4cd.png)

- 编写合约

  ```move
  module hello_world::Hello {
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
          transfer::transfer(object, tx_context::sender(ctx));
      }
  }
  ```

- 编译合约

  ```
  sui move build
  ```

  编译成功

  ![1019be6e8bd0f5a168173c6c03b3c467](E:\LearningRepository\move\SuiStartrek\members\chuanyue98\imgs\1019be6e8bd0f5a168173c6c03b3c467.png)

- 发布合约到测试网

  ```
  sui client publish  --gas-budget 100000000
  ```

- 找到PackageID

  ```
   Published Objects:                                                                   
  │	PackageID: 0x2ad5d60100a690dfe6f29a55e3bfa3a7174ba5d75584a73d200da31f1526e4ae                │
  │	Version: 1                                                                                    │
  │	Digest: 6FvnGgDpXPpScBLPbazxkZPsxT858y9QQdcBmkGWoF98                                          │
  │	Modules: Hello                                            
  ```

- 在https://suiexplorer.com/中查看

  ![ccd47adf40c11a516ee3b2dabb590708](E:\LearningRepository\move\SuiStartrek\members\chuanyue98\imgs\ccd47adf40c11a516ee3b2dabb590708.png)

  

## 完成NFT发布

NFT代码

```move
module myNFT::NFT {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// 一个允许任何人铸造NFT的示例
    /// An example NFT that can be minted by anybody
    struct DevNetNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
        // TODO: allow custom attributes 
    }

    // ===== Events ===== 事件

    struct NFTMinted has copy, drop {
        // The Object ID of the NFT 新铸造的NFT的ID
        object_id: ID,
        // The creator of the NFT 新铸造的NFT的创造者
        creator: address,
        // The name of the NFT 新铸造的NFT的名
        name: string::String,
    }

    // ===== Public view functions ===== 公共视图函数

    /// 获取NFT的名称
    /// Get the NFT's `name` 
    public fun name(nft: &DevNetNFT): &string::String {
        &nft.name
    }

    /// 获取NFT的介绍
    /// Get the NFT's `description`
    public fun description(nft: &DevNetNFT): &string::String {
        &nft.description
    }

    /// 获取NFT的链接
    /// Get the NFT's `url`
    public fun url(nft: &DevNetNFT): &Url {
        &nft.url
    }

    // ===== Entrypoints ===== 入口函数

    /// 创建新的NFT
    /// Create a new devnet_nft
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = DevNetNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// 转移NFT给新的所有者
    /// Transfer `nft` to `recipient`
    public entry fun transfer(
        nft: DevNetNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// 更新NFT的介绍
    /// Update the `description` of `nft` to `new_description`
    public entry fun update_description(
        nft: &mut DevNetNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// 永久删除NFT
    /// Permanently delete `nft`
    public entry fun burn(nft: DevNetNFT, _: &mut TxContext) {
        let DevNetNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }
}
```

对合约进行编译和发布

```
sui move build
sui client publish  --gas-budget 100000000
```

PackageID

```
0xe9bce493b009fe3aa61f3c49699fa54d25a609dc12956e679616fdb2900e01f1
```

mint nft 

![0e9cca4249ed8f4a9a85b6960e62d8d4](E:\LearningRepository\move\SuiStartrek\members\chuanyue98\imgs\0e9cca4249ed8f4a9a85b6960e62d8d4.png)

nft id 

```
0x7bb8ea57bc3d0e68451865e39fa9e681526d58b44d999b9dfaa4c01243e00c64
```

https://suiexplorer.com/object/0x7bb8ea57bc3d0e68451865e39fa9e681526d58b44d999b9dfaa4c01243e00c64?network=testnet

简单小游戏

```

// 定义一个简单的剪刀石头布游戏合约
module game::RockPaperScissors {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    // 创建一个公共函数来进行游戏

    struct Result has key, store {
            id: UID,
            text: string::String
    }


    public fun generate_random_number(seed: string::String): u64 {
        // todo 获取随机数来作为
        let len = string::length(&seed);
        return len % 3
    }


    public entry fun play_game(seed: string::String,player_choice: u64,ctx: &mut TxContext) {
        // 生成一个随机数来模拟计算机的选择
        let computer_choice = generate_random_number(seed); // 0: 石头, 1: 剪刀, 2: 布

        // 判断游戏结果
        if (player_choice == computer_choice) {
            // 平局
            let object = Result {
            id: object::new(ctx),
            text: string::utf8(b"TIE")
            };
            transfer::transfer(object, tx_context::sender(ctx));
        } else if (player_choice == 0 && computer_choice == 1 ||
                  player_choice == 1 && computer_choice == 2 ||
                  player_choice == 2 && computer_choice == 0) {
            // 玩家获胜
            let object = Result {
            id: object::new(ctx),
            text: string::utf8(b"WIN!!")
            };
            transfer::transfer(object, tx_context::sender(ctx));
        } else {
            // 玩家失败
            let object = Result {
            id: object::new(ctx),
            text: string::utf8(b"LOSE!")
            };
            transfer::transfer(object, tx_context::sender(ctx));
        }
    }
}

```

PackageID

```
0x75dec78bae331fbf1acdd837826ca72c763db1f9f1eacfab905782e8df70320e
```



调用合约试玩

```
sui client call --package 0x75dec78bae331fbf1acdd837826ca72c763db1f9f1eacfab905782e8df70320e --module RockPaperScissors --function play_game --args try 0 --gas-budget 10000000
```

![0c870696e4aef4b48ea9c4169ce70ab6](E:\LearningRepository\move\SuiStartrek\members\chuanyue98\imgs\0c870696e4aef4b48ea9c4169ce70ab6.png)

## 学习参考

NFT [Sui NFT发布 (qq.com)](https://mp.weixin.qq.com/s?__biz=MzkzMTY0MjY2OA==&mid=2247483776&idx=1&sn=35ca8ad746bbda2eed793b687a256ca2&chksm=c266adc3f51124d5c3e662249805453140dff4b9c60d79a73c50555f3a5e8e3c2aedb2da12ed&mpshare=1&scene=23&srcid=0216z6o6fiBc6f7BcD35S7bO&sharer_shareinfo=7285ed4cfae60aa485abc934f38f72a1&sharer_shareinfo_first=7285ed4cfae60aa485abc934f38f72a1#rd)

[星航计划第一阶段完成攻略 | 登链社区 | 区块链技术社区 (learnblockchain.cn)](https://learnblockchain.cn/article/7389)

