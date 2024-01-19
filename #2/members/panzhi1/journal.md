# 学习日志

1. 根据教程成功配置sui环境。

   使用release zip包在mac上运行时发现会有报错，而且个人感觉源码编译更舒服，就使用源码进行编译。下载相关资源速度太慢，要等很久，mac下需要下载xcode。
   
   
   
2. 成功完成hello world项目

3. 在原有count目录基础上，拷贝一份出来，修改成erc20代码，然后按照counter流程成功发布coin



问题总结：

发布hello world 时报错

**Failed to publish the Move module(s), reason: [warning] Multiple source verification errors found:**



**- On-chain version of dependency Sui::token was not found.**

**- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::zklogin_verified_id**

**- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::transfer_policy**

**- Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::zklogin_verified_issuer**



**This may indicate that the on-chain version(s) of your package's dependencies may behave differently than the source version(s) your package was built against.**



**Fix this by rebuilding your packages with source versions matching on-chain versions of dependencies, or ignore this warning by re-running with the --skip-dependency-verification flag.**



解决方案：本地clone的分支错误，cli切换的分支是dev,clone下来的是main，所以需要切换对应dev分支即可

切换命令:git checkout devnet-v1.14.0. 

