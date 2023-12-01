# 学习日志

## Unit-1

### setup
```
# pre
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup update stable
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
# install sui
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
sui --version
sui 1.15.0-5849f6845
```
### Publish package

```
# gas
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \\n--header 'Content-Type: application/json' \\n--data-raw '{"FixedAmountRequest":{"recipient":"0xb8c65e256b8b03b91144307a2544bf9b3b2481f9be9a1a02448f76bec543328d"}}'
# build
sui client publish --gas-budget 100000000
# fix the version mismatch
sui client publish --gas-budget 100000000 --skip-dependency-verification
# call the module
export PACKAGE_ID=0x1aeb4a8bbead1f00486df49b5f59aef4d205516c12b31c02b869bdc8a13ea345
sui client call --function mint --module hello_world --package $PACKAGE_ID --gas-budget 100000000
```