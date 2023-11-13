# 学习日志

## Week1（2023/11/13 - 2023/11-19）
### 安装环境
主要follow [B站视频](https://www.bilibili.com/video/BV1RY411v7YU)和[官方文档](https://docs.sui.io/guides/developer/getting-started/sui-install)，但arm architecture用brew/cargo install from source可能会遇到如下问题

![](https://p.ipic.vip/3lrspu.png)

所以还是直接按照官方文档install from binaries，但是经群里大佬提醒在第5步不要双击，而是要在terminal里面运行，为了达到能够直接输出`sui --version`的效果，还需设置一下环境变量，具体步骤如下：

- `nano ~/.bashrc  ` or `nano ~/.zshrc` 进入文档编辑
- 添加`export PATH="/Users/...../sui mainnet-v1.13.0 macos-arm64/target/release:$PATH"`在文档里，按照界面提示保存退出
- `source ~/.bashrc` or `source ~/.bashrc `重新加载配置文件
- `echo $PATH` 查看环境变量里是否包含以上路径
- `sui –version` 就不会报错了



