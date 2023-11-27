```


《SUI MOVE中文系列课程》SUI官方认证 Move智能合约语言入门指南

获取测试token

curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
> --header 'Content-Type: application/json' \
> --data-raw '{
>     "FixedAmountRequest": {
>         "recipient": "0x22cc7748db1c0249cd6fc6c930d5a3999a5252dd9a085441ac4a1b59fd53ee70"
>     }
> }'


{"transferredGasObjects":[{"amount":10000000000,"id":"0xafbdf69d5d4c876088241d7f194aca0ec90157f7d7233ea0541c20457634b9ae","transferTxDigest":"3tyA7m4XzeTLWmcXzx93ga4V3ECGVVEyNEferxSunSdd"}],"error":null}


导入自己的钱包

sui keytool import " " ed25519

切换钱包

sui client switch --address




发布包

sui client publish --gas-budget 10000000

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Successfully verified dependencies on-chain against source.
----- Transaction Digest ----
DX4tb9EeHwnmwBawiBcjy61ZWwsdvgeNtVad6ceXB9uN


```
