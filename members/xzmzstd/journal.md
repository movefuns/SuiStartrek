# 学习日志
# Roadmap 1

1. sui 环境的搭建
linux安装，按照官方文件安装所需组件
cURL
Rust and Cargo
Git CLI
CMake
C++ build tools
LLVM compiler
按照官方的方式安装没什么问题



2. chrmoe安装sui-wallet插件并创建账户
地址：0x1eea9c120c12c42cb9b9f62a6e85f14598f73f882e77a7c7c2c3e5f9fa29e794

按照教程写了个helloworld合约
代码:
   module hello_world::hello{
	
	use std::string;
	use sui::object::{Self,UID};
	use sui::transfer;
	use sui::tx_context::{Self,TxContext};

	struct HelloWorld0bject has key ,store{
		id : UID,
		text: string::String
	}
	
	public entry fun mint(ctx: &mut TxContext){
		let object = HelloWorld0bject{
			id: object::new(ctx),
			text: string::utf8(b"Hello World!")
		};
		transfer::transfer(object,tx_context::sender(ctx));
	}
}
