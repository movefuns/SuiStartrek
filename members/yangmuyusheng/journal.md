# 学习日志

- 创建一个文件夹

- 运行命令

  ```
  sui move new hello
  ```

- 进入文件夹

  ```
  cd hello 
  ```

- 在桌面的hello文件夹下的source文件夹里面，创建文件hello.move

  ![image-20240318232334407](E:\sui\SuiStartrek\members\source\images\journal\image-20240318232334407.png)

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

  ```
  UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
  INCLUDING DEPENDENCY Sui
  INCLUDING DEPENDENCY MoveStdlib
  BUILDING hello
  
  ```

  

- 发布合约到测试网

  ```
  sui client publish  --gas-budget 100000000 --skip-fetch-latest-git-deps
  ```

- 找到PackageID

  ```
    Published Objects:                                                                               │
  │  ┌──                                                                                             │
  │  │ PackageID: 0x8dd1f72c587a0efd07efdbaddbdb69f79ef051136345edbd4fe580f459ba53f1                 │
  │  │ Version: 1                                                                                    │
  │  │ Digest: FExBgGvkwd6fdjjwBV11VzvvuXx2CkJRygBizypXpmQd                                          │
  │  │ Modules: hello                                                                                │
  │  └──                                                                     
  ```

- 在https://suiexplorer.com/中查看

  ![image-20240318232531621](E:\sui\SuiStartrek\members\source\images\journal\image-20240318232531621.png)
