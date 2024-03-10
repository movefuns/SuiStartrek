# 学习日志

# SUI学习笔记
## 学习资料
https://movefuns.notion.site/Web3-9835c8dea4fd424bbe61e4fa599689ad

[sui官网](https://docs.sui.io/)

[安装Sui](https://docs.sui.io/guides/developer/getting-started/sui-install)



# 基础命令
sui --help

sui client --help

sui move --help

sui --version

move-analyzer --version

sui client addresses

sui client gas

sui client  faucet #领取测试币

sui client envs #查看环境

sui  client new-env  --alias testnet --rpc https://fullnode.testnet.sui.io:443 #自定义RPC节点

# 创建项目
sui move new HelloWorld

# 发布项目
sui client publish --gas-budget 10000000

# DEMO
[HelloWorld](https://github.com/0xachong/project_sui/blob/master/hello_world/sources/hello_world.move)

packageID(智能合约)：0x716d611e19aa3ea6853a4777ac5e12490e50bb784722d44b51b19821d825eeac

