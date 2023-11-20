# 学习日志

## 开发环境搭建
1. 如果电脑未安转 rust，先安装 rust
    ```shell
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    ```

2. 编译 sui
    ```shell
    cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
    ```

3. 检查 sui 是否安装成功
    ```shell
    sui --version
    ```

4. 初始化 sui，根据指引选择配置目录（默认）、加密算法（ed25519）
    ```shell
    sui client
    ```

    这一步会生成一个 sui.keystore 文件，内容是钱包的私钥（列表）。

    大多数情况我们不会直接使用这个钱包，因为这个钱包的私钥不是由助记词推导而来，不便于记录。

    通常做法是，在安装好钱包客户端并且生产助记词钱包以后，使用 `sui keytool import` 命令导入这个钱包

5. 安装钱包

    5.1. [Sui Wallet](https://chromewebstore.google.com/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil)

    5.2. [教程-如何开始使用Sui钱包](https://mp.weixin.qq.com/s/-_hCFUO-62hv9amPzmJdeg)

6. 查看本地 sui 钱包地址列表与默认地址
    ```shell
    sui client addresses
    sui client active-address
    ```

7. 导入助记词账号，并切换为默认钱包地址
    ```shell
    sui keytool import "<助记词/Passphrase>" ed25519
    sui client addresses
    sui client switch --address <new-address>
    ```

8.  初始化本地 主网/测试网/开发网 的配置
    ```shell
    sui client new-env --alias mainnet --rpc https://sui-mainnet.nodeinfra.com:443
    sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
    sui client new-env --alias devnet --rpc https://fullnode.devnet.sui.io:443
    ```

9. 切换 sui 使用的网络。后续学习过程中，我们多数情况下会使用 devnet 或者 testnet 网络。
    ```shell
    sui client switch --env <alias>
    ```


10. 为 devnet/testnet 钱包地址**充值**

    10.1. [获得开发网 Devnet 的 Sui Tokens](https://intro-zh.sui-book.com/unit-one/lessons/1_%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83.html#%E8%8E%B7%E5%BE%97%E5%BC%80%E5%8F%91%E7%BD%91-devnet-%E7%9A%84-sui-tokens)

    10.2. [获得测试网 Testnet 的 Sui Tokens](https://intro-zh.sui-book.com/unit-one/lessons/1_%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83.html#%E8%8E%B7%E5%BE%97%E6%B5%8B%E8%AF%95%E7%BD%91-testnet-%E7%9A%84-sui-tokens)
