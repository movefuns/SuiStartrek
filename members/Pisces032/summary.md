# 学习成果

## Roadmap 1
- MoveCTF2024 checkin WP
查看智能合约文件<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705040112972-bceb5477-6aac-4d5e-9ede-b344d4c7ccaa.png#averageHue=%23f6f7f8&clientId=u7cc37a92-8627-4&from=paste&height=152&id=u29fe7f88&originHeight=228&originWidth=420&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=12859&status=done&style=none&taskId=uf10baf6d-6533-4627-b017-a520bec205a&title=&width=280)<br />![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1705040137534-1cbf6e9f-ab2a-4b23-bc7f-b2fb8c88c7d4.png#averageHue=%23fefefe&clientId=u7cc37a92-8627-4&from=paste&height=385&id=u07286e4d&originHeight=578&originWidth=829&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=37731&status=done&style=none&taskId=u900716ff-6e83-4869-87e6-51b339d694c&title=&width=552.6666666666666)<br />可以看到需要调用的函数`get_flag`只有在输入字符串为“MoveBitCTF”时才能成功运行<br />`sui client call --function get_flag --module checkin --package 你的packageid --args "MoveBitCTF" --gas-budget 10000000`<br />将得到的`Transaction Digest`输入即可获得flag

- 安装Sui Move环境
- 安装web3钱包（Sui Wallet）

## Milestone 1： 完成简单的智能合约并成功部署到测试网络
一个简单的智能合约
```
module hello::hello{
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    
        ///include any string object
    struct HelloWorldObject has key, store {
        id: UID,
        /// strings included by object 
        text: string::String
    }
    
    public entry fun mint(text: vector<u8>,ctx: &mut TxContext){
        let object = HelloWorldObject{
            id: object::new(ctx),
            text: string::utf8(text)
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1708934765293-e7983da0-2087-4dd4-893c-66bcd038cff8.png#averageHue=%23262235&clientId=u5683ae90-3473-4&from=paste&height=621&id=u67038f45&originHeight=932&originWidth=1457&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=155141&status=done&style=none&taskId=ud1ae6be0-cea5-4a5a-a428-e3cfca7a132&title=&width=971.3333333333334)
部署智能合约
`sui client publish --path <absolute local path to the Sui Move package> --gas-budget 100000000`（要是提示gas不够就多加几个0）

- 获取测试币

Win：（Powershell中执行）
```powershell
$body = @{
    FixedAmountRequest = @{
        recipient = '钱包地址'
    }
} | ConvertTo-Json

Invoke-WebRequest -Uri 'https://faucet.devnet.sui.io/gas' -Method POST -Body $body -Headers @{
    'Content-Type' = 'application/json'
}
```
Linux：
```powershell
curl --location --request POST 'https://faucet.devnet.sui.io/gas' --header 'Content-Type: application/json' --data-raw '{ "FixedAmountRequest": { "recipient": "替换为你的钱包地址" } }'
```

- 跳过版本检查：`--skip-fetch-latest-git-deps`
- 跳过依赖性检查：`--skip-dependency-verification`

![image.png](https://cdn.nlark.com/yuque/0/2024/png/40787854/1704942838747-27f8f761-b7cf-42cb-a960-aef6a84b6216.png#averageHue=%23111111&clientId=ub317da65-8c34-4&from=paste&height=727&id=u4f7e99dd&originHeight=1090&originWidth=2244&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=122339&status=done&style=none&taskId=u6e7de1e8-bf58-4562-9f4d-495323eb331&title=&width=1496)
