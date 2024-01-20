# 学习日志
+ 环境部署：因为很早之前电脑里已经安装过sui及rust环境，这次做了一下update
```
rustup update stable

cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui

sui -V

sui 1.14.0-a48eee624
```

## Counter

+ pnpm create @mysten/create-dapp
```
Library/pnpm/store/v3/tmp/dlx-4862       | +108 +++++++++++
Packages are hard linked from the content-addressable store to the virtual store.
  Content-addressable store is at: /Users/wangzx/Library/pnpm/store/v3
  Virtual store is at:             Library/pnpm/store/v3/tmp/dlx-4862/node_modules/.pnpm
Library/pnpm/store/v3/tmp/dlx-4862       | Progress: resolved 108, reused 0, downloaded 108, added 108, done
✔ Which starter template would you like to use? · react-e2e-counter
✔ What is the name of your dApp? (this will be used as the directory name) · helloworld
```

+ 切换address
```
sui keytool list    //列出本地所有账户

sui client switch --address 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4
```

+ 环境
```

sui client envs //列出所有环境

sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443 //添加testnet 环境

sui client switch --env testnet // 切换dev -> test

╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443  │        │
│ testnet │ https://fullnode.testnet.sui.io:443 │ *      │
╰─────────┴─────────────────────────────────────┴────────╯

```

+ 发布 move package
```
cd move
sui client publish --gas-budget 100000000 counter

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING counter
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
E2szopQaDugSyYPaeAooeE3eXBiwn1VUBqzGgPTcfha9
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4                                                                                  │
│ Gas Owner: 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4                                                                               │
│ Gas Budget: 100000000                                                                                                                                       │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0xd7da6fbbf84819c18050186d88a3eff2e9fe49bb95b41225f1002e021f35f187                                                                                   │
│  │ Version: 516863                                                                                                                                          │
│  │ Digest: 37ZEVkMK485Lbtpsj2cdhD117hiqXSWjud8ALhoeyirB                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    zoHRJBxX6mgWiFGd2VMkyIe+eawDWpC9CGCS7cRGWUidDm6ZmRM15ZH4OZvi1O/rvqNx/8wUQsM4AGnazurMDg==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: E2szopQaDugSyYPaeAooeE3eXBiwn1VUBqzGgPTcfha9                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 193                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbca9c9ad9367eb2b832c360a4983426ba01bb9c534ca5057b21b945cf1103ee9                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 7SsKq3WKkuFrQ9upZiiphxRv5Md3kCwxmiMYTg1F7CUz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbdfca6479db5a46fdeb53fadfe5c507c24fdc826f3a43fb84dbed987f3cf316a                         │
│  │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )  │
│  │ Version: 516864                                                                                │
│  │ Digest: pkBi4gb2QWPr6Fo4jduZTabQbMk8gxgAynKHZp3zb97                                            │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xd7da6fbbf84819c18050186d88a3eff2e9fe49bb95b41225f1002e021f35f187                         │
│  │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )  │
│  │ Version: 516864                                                                                │
│  │ Digest: EC1JJdVyJkqaAb1mv8izPES1pipBK92GuBJBMqwDTKYA                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xd7da6fbbf84819c18050186d88a3eff2e9fe49bb95b41225f1002e021f35f187                         │
│  │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )  │
│  │ Version: 516864                                                                                │
│  │ Digest: EC1JJdVyJkqaAb1mv8izPES1pipBK92GuBJBMqwDTKYA                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8747600                                                                          │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3pcBpJcaTZJstk5Ssu13zXjSaNQX2Xw1U2F66C9dajq5                                                   │
│    Bkvb1fhqAgtZFiV16EweRNXFgutju5LV87tVA8W6c7za                                                   │
│    EVLXicCTgT6Ww28ja28pfzevt7Y7qQTijQF5iiTbHExa                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects:
 ┌──
 │ ObjectID: 0xbdfca6479db5a46fdeb53fadfe5c507c24fdc826f3a43fb84dbed987f3cf316a
 │ Sender: 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4
 │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )
 │ ObjectType: 0x2::package::UpgradeCap
 │ Version: 516864
 │ Digest: pkBi4gb2QWPr6Fo4jduZTabQbMk8gxgAynKHZp3zb97
 └──

Mutated Objects:
 ┌──
 │ ObjectID: 0xd7da6fbbf84819c18050186d88a3eff2e9fe49bb95b41225f1002e021f35f187
 │ Sender: 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4
 │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>
 │ Version: 516864
 │ Digest: EC1JJdVyJkqaAb1mv8izPES1pipBK92GuBJBMqwDTKYA
 └──

Published Objects:
 ┌──
 │ PackageID: 0xbca9c9ad9367eb2b832c360a4983426ba01bb9c534ca5057b21b945cf1103ee9
 │ Version: 1
 │ Digest: 7SsKq3WKkuFrQ9upZiiphxRv5Md3kCwxmiMYTg1F7CUz
 | Modules: counter
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )
 │ CoinType: 0x2::sui::SUI
 │ Amount: -8769480
 └──
```

PackageID: 0xbca9c9ad9367eb2b832c360a4983426ba01bb9c534ca5057b21b945cf1103ee9

+ 替换、安装依赖、运行
```
export const DEVNET_COUNTER_PACKAGE_ID = "0xbca9c9ad9367eb2b832c360a4983426ba01bb9c534ca5057b21b945cf1103ee9";
pnpm install
pnpm dev
```

## ERC20::FII

+ 创建Move项目、编译、发布
```
sui move new fii

sui move build

sui client publish --gas-budget 100000000

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING fii
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
FfjRLferjZikbUJxT94iH8wBn5Rp1escq3CReodyEAnw
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4                                                                                  │
│ Gas Owner: 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4                                                                               │
│ Gas Budget: 100000000                                                                                                                                       │
│ Gas Price: 1000                                                                                                                                             │
│ Gas Payment:                                                                                                                                                │
│  ┌──                                                                                                                                                        │
│  │ ID: 0xd7da6fbbf84819c18050186d88a3eff2e9fe49bb95b41225f1002e021f35f187                                                                                   │
│  │ Version: 516864                                                                                                                                          │
│  │ Digest: EC1JJdVyJkqaAb1mv8izPES1pipBK92GuBJBMqwDTKYA                                                                                                     │
│  └──                                                                                                                                                        │
│                                                                                                                                                             │
│ Transaction Kind : Programmable                                                                                                                             │
│ Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4" })]                     │
│ Commands: [                                                                                                                                                 │
│   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002), │
│   TransferObjects([Result(0)],Input(0)),                                                                                                                    │
│ ]                                                                                                                                                           │
│                                                                                                                                                             │
│                                                                                                                                                             │
│ Signatures:                                                                                                                                                 │
│    nySrVUk3ZF9GVipkl0XlQv+9mpv3s3OUgZTeBKLJjD692hbeiHcIvfl5y5BovA6JHLcwDLwXdzCEMgjdAJbVAg==                                                                 │
│                                                                                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: FfjRLferjZikbUJxT94iH8wBn5Rp1escq3CReodyEAnw                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 193                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x805f3a97934b1402f8ad9efd8fcd848b4613cd66405f97b423c78d4c197109de                         │
│  │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )  │
│  │ Version: 516865                                                                                │
│  │ Digest: 4BUmFwmyCHARCHCNJcY7pdabogtNcE1nXJ3GJ3JsmQAM                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd843480f1e90965586706aebe92242315c7c065d9819dde487cb3364f92cb4c5                         │
│  │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )  │
│  │ Version: 516865                                                                                │
│  │ Digest: FtSUpsc99M2sP7VihLW8VGdR6X94m1h7VPem2ErWC2se                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf010ca3c5fda8873bbaa41315a633432fe3c68c53ffa1a643fddb110afb209ce                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: yg9UbLtTDQa7Pu7TSuWZUpxKU3gJhWTJDXAxqb5Asf9                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf6f1e4470d46ffa0c6d664503989dd9b7e43147a07958fabffcae565af2b88b4                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 516865                                                                                │
│  │ Digest: zngh3ew6W17gBGBae9DL2KcaL33mEJ347RMD6m6PLkF                                            │
│  └──                                                                                              │
│                                                                                                   │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xd7da6fbbf84819c18050186d88a3eff2e9fe49bb95b41225f1002e021f35f187                         │
│  │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )  │
│  │ Version: 516865                                                                                │
│  │ Digest: 9GQrob4SA6gpZh1sGwUfvaE6mEq4kxsESXSSqiy2kcXo                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xd7da6fbbf84819c18050186d88a3eff2e9fe49bb95b41225f1002e021f35f187                         │
│  │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )  │
│  │ Version: 516865                                                                                │
│  │ Digest: 9GQrob4SA6gpZh1sGwUfvaE6mEq4kxsESXSSqiy2kcXo                                           │
│  └──                                                                                              │
│                                                                                                   │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 12167600                                                                         │
│    Computation Cost: 1000000                                                                      │
│    Storage Rebate: 978120                                                                         │
│    Non-refundable Storage Fee: 9880                                                               │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3pcBpJcaTZJstk5Ssu13zXjSaNQX2Xw1U2F66C9dajq5                                                   │
│    Bkvb1fhqAgtZFiV16EweRNXFgutju5LV87tVA8W6c7za                                                   │
│    E2szopQaDugSyYPaeAooeE3eXBiwn1VUBqzGgPTcfha9                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
----- Events ----
Array []
----- Object changes ----

Created Objects:
 ┌──
 │ ObjectID: 0x805f3a97934b1402f8ad9efd8fcd848b4613cd66405f97b423c78d4c197109de
 │ Sender: 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4
 │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )
 │ ObjectType: 0x2::package::UpgradeCap
 │ Version: 516865
 │ Digest: 4BUmFwmyCHARCHCNJcY7pdabogtNcE1nXJ3GJ3JsmQAM
 └──
 ┌──
 │ ObjectID: 0xd843480f1e90965586706aebe92242315c7c065d9819dde487cb3364f92cb4c5
 │ Sender: 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4
 │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )
 │ ObjectType: 0x2::coin::TreasuryCap<0xf010ca3c5fda8873bbaa41315a633432fe3c68c53ffa1a643fddb110afb209ce::fii::FII>
 │ Version: 516865
 │ Digest: FtSUpsc99M2sP7VihLW8VGdR6X94m1h7VPem2ErWC2se
 └──
 ┌──
 │ ObjectID: 0xf6f1e4470d46ffa0c6d664503989dd9b7e43147a07958fabffcae565af2b88b4
 │ Sender: 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4
 │ Owner: Immutable
 │ ObjectType: 0x2::coin::CoinMetadata<0xf010ca3c5fda8873bbaa41315a633432fe3c68c53ffa1a643fddb110afb209ce::fii::FII>
 │ Version: 516865
 │ Digest: zngh3ew6W17gBGBae9DL2KcaL33mEJ347RMD6m6PLkF
 └──

Mutated Objects:
 ┌──
 │ ObjectID: 0xd7da6fbbf84819c18050186d88a3eff2e9fe49bb95b41225f1002e021f35f187
 │ Sender: 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4
 │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )
 │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>
 │ Version: 516865
 │ Digest: 9GQrob4SA6gpZh1sGwUfvaE6mEq4kxsESXSSqiy2kcXo
 └──

Published Objects:
 ┌──
 │ PackageID: 0xf010ca3c5fda8873bbaa41315a633432fe3c68c53ffa1a643fddb110afb209ce
 │ Version: 1
 │ Digest: yg9UbLtTDQa7Pu7TSuWZUpxKU3gJhWTJDXAxqb5Asf9
 | Modules: fii
 └──
----- Balance changes ----
 ┌──
 │ Owner: Account Address ( 0xcc6cb4efbc21fc8f132bc8bdbf914c0e4c914abbe6c9f4a91dc5948503e039a4 )
 │ CoinType: 0x2::sui::SUI
 │ Amount: -12189480
 └──

```
