# 学习成果

## Roadmap 1 FT Contract

包括 3 个合约：

* Counter: 官方 dapp 的 Counter [github](https://github.com/dgu0323/sui_homework/tree/main/hello)
* Managed Coin: 指定权限人才可以 mint [github](https://github.com/dgu0323/sui_homework/tree/main/managed_coin)
* Shared Coin: 所有人都可以 mint [github](https://github.com/dgu0323/sui_homework/tree/main/shared_coin)

### Counter

```
packageId: 0x4a3e8ebeb9bfdceeaac1d3126061e1af56b0be852352fe37c50dab4fccbea1f6
```

![](https://james-01-1256894360.cos.ap-beijing.myqcloud.com/2024-02-14-033939.png)

![](https://james-01-1256894360.cos.ap-beijing.myqcloud.com/2024-02-14-034106.png)

### Managed Coin

````
deployer address: 0xe69934571665b5a3f750559c40c54a1e35678910a563e436404d0461a31f39e3
deploy trx: AEBf5SEQVj1BGvGsXLpuA99i8TpVPifs8rc2xtdpjmrR
packageId: 0xd7926f3e1ae7edfd310f91d28ff6f240d22dd6986dd0e9cbb01371f3d67129fe
````

![](https://james-01-1256894360.cos.ap-beijing.myqcloud.com/2024-02-16-122636.png)

操作测试

```
# deployer mint 3000 to him
sui client call --gas-budget=100000000 \
--package=0xeea9191a6167d10b4e851f764e61e334f920060e9e34fa3056c4b7a1e74f2632 \
--module=btc --function=mint \
--args 0xe2098d0d1d6f9745aff209fb38a4c50bf179a43bdbd320143292dd277674ae5a 3000000000

# deployer mint 1000 to somebody
sui client call --gas-budget=100000000 \
--package=0xeea9191a6167d10b4e851f764e61e334f920060e9e34fa3056c4b7a1e74f2632 \
--module=btc --function=mint_to \
--args 0xe2098d0d1d6f9745aff209fb38a4c50bf179a43bdbd320143292dd277674ae5a 1000000000 0x5f260c8eec8cf438717a3d9e78e51b69fe34deaa6820c27d28c9618f8140751f
```

### Shared Coin

```
deployer address: 0xe69934571665b5a3f750559c40c54a1e35678910a563e436404d0461a31f39e3
deploy trx: Cb8Hr8WvWHSiUHXLSV6Ya2W2kcVHbQpFfgPNfmseBDqx
packageId: 0xcb42e2beefeae3cfc8d066e8148e17827fad5790237962a6068c2900e8f5e4fb
```

![](https://james-01-1256894360.cos.ap-beijing.myqcloud.com/2024-02-16-131731.png)

操作测试

```
# deployer mint 3000 to him
sui client call --gas-budget=100000000 \
--package=0xcb42e2beefeae3cfc8d066e8148e17827fad5790237962a6068c2900e8f5e4fb \
--module=ETH --function=mint \
--args 0x6fb3193de8c7d5ab8ce7143832cd7212325a67cddf6597ab3c60a74df6ec6643 3000000000

# swith to someone
sui client switch --address 0x5f260c8eec8cf438717a3d9e78e51b69fe34deaa6820c27d28c9618f8140751f

# someone mint 2000 to him
sui client call --gas-budget=100000000 \
--package=0xcb42e2beefeae3cfc8d066e8148e17827fad5790237962a6068c2900e8f5e4fb \
--module=ETH --function=mint \
--args 0x6fb3193de8c7d5ab8ce7143832cd7212325a67cddf6597ab3c60a74df6ec6643 3000000000
```

