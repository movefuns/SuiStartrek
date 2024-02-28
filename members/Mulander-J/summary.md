# 学习总结

## Meet Aptos & Sui!

|Key|Aptos|Sui|
|---|---|---|
|Website|[aptosfoundation.org](https://aptosfoundation.org/)|[sui.io](https://sui.io)|
|Ecosystem|[aptos.ecosystem](https://aptosfoundation.org/ecosystem/projects/all)|[sui.directory](https://sui.directory/)|
|Forum|[forum.aptoslabs](https://forum.aptoslabs.com/)|[forums.sui](https://forums.sui.io/)|
|Dev Doc|[aptos.dev](https://aptos.dev/)|[docs.sui](https://docs.sui.io)|
|Tutorials|['Your first' 7](https://aptos.dev/tutorials)|[Magic Guides](https://docs.sui.io/guides/developer)|
|Explorer|[explorer.aptoslabs](https://explorer.aptoslabs.com/)|[suiexplorer](https://suiexplorer.com/), [suivision](https://suivision.xyz/)|
|Top Wallets|[petra](https://petra.app/)|[Sui Wallet](https://chrome.google.com/webstore/detail/opcgpfmipidbgpenhmajoajpbobppdil), [Suiet Wallet](https://chrome.google.com/webstore/detail/suiet-sui-wallet/khpkpbbcccdmmclmpigdgddabeilkdpd), [surf](https://surf.tech), [Ethos Wallet](https://ethoswallet.xyz/)|
---
|Key|Aptos|Sui|
|---|---|---|
|Move Framework|✅[Move](https://aptos.dev/reference/move)|✅[Sui Framework](https://github.com/MystenLabs/sui/tree/main/crates/sui-framework/docs)|
|CLI|✅[aptos-core/cli](https://github.com/aptos-labs/aptos-core/releases?q=cli&expanded=true)|✅[Sui Cli](https://github.com/MystenLabs/sui)|
|CLI.Support OS|macOS/Linux/WSL/Win11|macOS/Linux/WSL/Win11|
|CLI.Install Methods|**Script**/Homebrew/Binaries/Source|Homebrew/Binaries/Source/**Docker**|
|API.Rest|✅[Rest](https://aptos.dev/apis/fullnode-rest-api)|❌|
|API.JSON-RPC|❌|✅[JSON-RPC](https://docs.sui.io/references/sui-api)|
|API.Indexed|✅[Graphql](https://aptos.dev/indexer/indexer-landing)|✅[Graphql](https://docs.sui.io/references/sui-graphql)|
|SDK.Rust|✅[aptos-core/sdk](https://github.com/aptos-labs/aptos-core/tree/main/sdk)|✅[rust](https://github.com/MystenLabs/sui/tree/main/crates/sui-sdk)|
|SDK.Python|✅[aptos-core/ecosystem/python](https://github.com/aptos-labs/aptos-core/tree/main/ecosystem/python/sdk)|❌|
|SDK.Typescript|✅[aptos-ts-sdk](https://github.com/aptos-labs/aptos-ts-sdk)|✅[typescript](https://sdk.mystenlabs.com/typescript)|
|SDK.Unity|✅[Aptos-Unity-SDK](https://github.com/aptos-labs/Aptos-Unity-SDK)|❌|

## Dev Experiences

APTOS CLI

- ✅Support: Test, Compile, Publish, Faucet...
- 🖍️Advice: 期望`aptos move init`生成的项目应该自带`.gitignore`
- 😓控制台日志提示简洁, 但是个人觉得`{"Result": "Success"}`有点丑

APTOS Packages: 

`@aptos-labs/ts-sdk`, `@aptos-labs/wallet-adapter-react`...

- ✅Support: SDK, Wallet Modal UI, Wallet Hooks, Wallet Provider Adapter...
- ❓Question: Only React? Search for vue implementation.

Sui CLI

- ✅Support: Move, Client...
- 🆙控制台日志风格更新，相对友好
- 🆙账号地址逻辑简单
- 🆙新增水龙头功能 [#15940](https://github.com/MystenLabs/sui/pull/15940): Added a new command sui client faucet to make it easier to get gas from devnet, testnet, or a local network.
- ❗CLI版本尽量选mainnet, 其他版本包含迭代bug会影响开发。

[Sui dapp-kit](https://github.com/MystenLabs/sui/tree/main/sdk/dapp-kit) : 相当于前端web3开发的瑞士军刀，集合了Hooks，Wallet-State，Wallet-Connectors...

- 🆙sdk模块更集中
- ❌教程指引比较简洁，可能对新手不友好
- ❓React版本为主，期待vue实现