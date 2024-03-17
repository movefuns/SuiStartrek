# 学习日志

## 开发环境（WSL+vscode远程）
### WSL
WSL1 + ubuntu20.04

### ENV
```bash
# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Update cargo
rustup update stable

# Additional prerequisites by operating system
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

### SUI
```bash
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
sui --version
```

## hello-world
参考教程[hello-workd](https://github.com/qipan2333)


## TODO 学习move\了解区块链相关概念