# 学习日志

# Roadmap 1

- [sui-cli 安装和浏览器钱包插件安装](journal/week01/install.md)
- [基于dAPP-kit的Hello World](journal/week01/dAPP-kit.md)
- [move合约开发与部署](journal/week01/move-contract.md)





# Useful Commands
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


