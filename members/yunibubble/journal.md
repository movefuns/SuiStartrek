# 学习日志
## 1. 学习配置Sui环境

### 主网和测试网的设置
- 学习了如何在Sui生态中灵活切换mainnet和testnet。

### RPC的配置
- 深入了解了Sui中private endpoint的配置，包括端口号的设置，连接不同节点、调整请求参数等，以实现与Sui网络的有效通信。

### 钱包的生成以及切换
- 学习了如何生成以及切换Sui生态中的钱包，以及发现开发过程中不同类型钱包生成地址不一样，

### 私钥的导出与导入
- 深入了解了私钥的导出和导入过程，确保对账户的安全管理以及后续的使用

## 2. Package Publish

- 深入理解Gas的概念，理解storgae fee and computation fee ，并进行相关测试， 确保package的成功发布
- 理解 mist在sui上的含义以及sui coin的相关信息
- 理解module/object/package等在sui上的定义

## 3. 浏览器的使用
- 如何使用浏览器查看发布的合约/代币/链上交易

## 3. Coin ERC20

### 3.1 定义Mint函数
深入研究了在Coin ERC20合约中如何定义Mint函数，实现代币的铸造，以满足动态供应的需求。

### 3.2 设置Coin's Metadata
学习了如何设置Coin的Metadata，包括名称、符号以及储存在ipfs上等信息，以便更好地展示和标识该代币。

### 3.3 学习TreasuryCap和CreateCurrency的内置函数
领悟了TreasuryCap和CreateCurrency等内置功能的实质，掌握了在Coin ERC20智能合约中灵活运用它们的技巧。