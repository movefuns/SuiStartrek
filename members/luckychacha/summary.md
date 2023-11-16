# 学习成果

## Roadmap 1
- 发布的Coin地址
  - [MYCOIN](https://suiexplorer.com/object/0x66079b022f4946d901b59a547490224e26b4977ce295075436beb6dbe626932c?network=devnet)
    - 0x66079b022f4946d901b59a547490224e26b4977ce295075436beb6dbe626932c
  - [MANAGED](https://suiexplorer.com/object/0xfdc0ade4f7ac098a1009465e6f364ffdd3fa44c69d802c9815f3a07ab740ee88?network=devnet)
    - 0xfdc0ade4f7ac098a1009465e6f364ffdd3fa44c69d802c9815f3a07ab740ee88
- 完成dapp-kit Hello world 的交互，连接钱包成功的截图: [dapp-kit Hello World](resources%2Flesson1-dapp-kit-hello-world.png)


## Sui Commands

1. show sui version

```
sui --version
```

2. sui client init

```
sui client
```

3. show network info

```
sui client envs
```

4. show sui wallet address

```
sui client active-address
```

5. show sui wallet balance

```
sui client gas
```

6. add another network

```
sui client new-env --alias=mainnet --rpc https://fullnode.mainnet.sui.io:443
```

7. switch network

```
sui client switch --env mainnet
```

8. import client cli wallet private key to sui wallet

```
sui keytool convert xxxx(store in sui.keystore)
```

## pnpm commands

```
pnpm add @mysten/dapp-kit @mysten/sui.js @tanstack/react-query
pnpm create @mysten/create-dapp
```