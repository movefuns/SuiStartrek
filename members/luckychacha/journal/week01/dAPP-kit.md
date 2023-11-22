## 1.node 安装/更新至最新版本

### 1.1 使用 brew 进行更新

```
brew upgrade node
brew link --overwrite node
brew postinstall node
```

## 2. 安装依赖并创建项目

### 2.1 安装 dapp-kit

```
pnpm add @mysten/dapp-kit @mysten/sui.js @tanstack/react-query

pnpm create @mysten/create-dapp
```

### 2.2 安装项目依赖

```
cd my-first-sui-dapp && pnpm install
```

### 2.3 启动项目

```
pnpm dev
```

## 运行结果

### 1.连接钱包

### 2.显示信息

[钱包下的账户和 Objects](resources/lesson1-dapp-kit-hello-world.png)

## 3. 项目源码

[my-first-sui-dapp](https://github.com/luckychacha/my-first-sui-dapp)