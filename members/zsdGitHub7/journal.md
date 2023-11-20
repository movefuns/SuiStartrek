# 学习日志（基于os Sonomal4.1）

### 下载sui后运行sui命令得到错误

![image-20231120144222930](https://im.ge/i/ACzQqa) 

这错误是指找不到`libc＋＋.1.dylib`的库，链接错误，我们需要为sui的连接库重新引导下让他能够找到这个文件，运行

```
sudo find /-name"libc++.1.dylib" 2>/dev/null 
```

可以找到｀Libc＋＋．1．dylib＇的文件，你会得到很多个，如图

![image-20231120144643960](https://im.ge/i/ACzTPJ)

你可以随便选择一个我选择的是第二个后面是`／quit／lib／libc＋＋．1．dylib`的那个，然后使用你选好的那个文件路径运行，记得将路径`／path／to／libc＋＋.1.dylib`替换成你选择好的那个文件（图一当中的那个打了码的）,`/path/to/your/executable`则用你选择好的那个文件地址替换。

```
sudo install_name_tool-change @rpath/libc++.1.dylib /path/to/libc++.1.dylib /path/to/your/executable
```

 这样以后我解决了报错，成功运行起了sui。

### erc20

Erc20的任务运行得到`Error exeicuting transaction： Failure {＇error:＂InsufficientGas＂，`} `只需要将 ——gas—budged 后面的gas提高，因为报这个错误是你支付的gas费用不够，所以你只要无脑加gas就行.
