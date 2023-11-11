# 学习日志

## 2023-11-10
安装SUI钱包浏览器插件, EDGE浏览器的插件中心里, SUI插件版本存在落后, 需要在Chrome的插件中心安装, 链接为https://chrome.google.com/webstore/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil/related

可以使用Google账号登录, 获取钱包地址

## 2023-11-11

### 1. windows搭建环境
#### 1) 在https://github.com/MystenLabs/sui/releases中下载windows工具包

![](./imgs/20231111/1.PNG)

#### 2) 解压后配置环境变量, 路径按实际路径配置

`D:\sui-mainnet-v1.13.0-windows-x86_64\external-crates\move\target\release`

`D:\sui-mainnet-v1.13.0-windows-x86_64\target\release`

![](./imgs/20231111/2.PNG)

#### 3) 简化命令
把exe文件名称中`-windows-x86_64`删除
![](./imgs/20231111/4.PNG)

#### 4) 测试命令
![](./imgs/20231111/3.PNG)


### 2. 浏览器插件连接Sui开发链
#### 1) 在Sui浏览器插件中切换到开发链
![](./imgs/20231111/7.PNG)

#### 2) 直接点击按钮即可获取token
![](./imgs/20231111/12.PNG)

### 3. 命令行工具连接Sui开发链
#### 1) 连接
```bash
sui client envs
```

默认则是连接到开发链, 会创建钱包地址和恢复码
```
addr: [0x1f0663c112ee1f1a75566039d849557a972293d99f71e45e9b9b72caed9b71a2]
Secret Recovery Phrase: [grant indicate avocado rail state minimum defense balcony pupil very attend sentence]
```

![](./imgs/20231111/8.PNG)

#### 2) 在浏览器插件里尝试导入
输入前面生成的恢复码
![](./imgs/20231111/9.PNG)

输入密码
![](./imgs/20231111/10.PNG)

可以看到成功导入
![](./imgs/20231111/11.PNG)

#### 3) 请求测试用的tokens
```
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "钱包地址"
    }
}'
```

请求一次会获取`10 SUI`
![](./imgs/20231111/6.PNG)
![](./imgs/20231111/5.PNG)