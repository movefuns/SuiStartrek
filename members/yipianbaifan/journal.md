# 学习日志

## 安装 sui

环境: Windows 11

过程:

1. 参照 [教程](https://intro-zh.sui-book.com/unit-one/lessons/1_%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83.html) 通过 cargo 安装 sui, 耗时 4 hour

遇到问题:

1. cargo 安装 sui 的时候，windows 报错路径太长，解决方法是，直接在 c 盘下创建 rust 目录，并修改环境变量后重新安装
2. protoc 提示不存在，解决方法是，需要手动去下载下，并加入 path 变量里。
3. 无法连接 sui localnet，解决方法是，我遇到的和防火墙有关，调整网络策略。
