//
//  Header.h
//  快递兔测试版
//
//  Created by kuaiditu on 14-11-10.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#ifndef _______Header_h
#define _______Header_h

//获取屏幕高度
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
//获取当前系统版本
#define SYSTEMVERSION [[UIDevice currentDevice]systemVersion]

//三极色
#define SANJISE [UIColor colorWithRed:(arc4random()%256/255.0) green:(arc4random()%256/255.0) blue:(arc4random()%256/255.0) alpha:1]
//收键盘
#define SHOUJIANPAN -(BOOL)textFieldShouldReturn:(UITextField *)textField{\
\
[textField resignFirstResponder];\
\
return YES;\
\
}\



//常用控件
#import "MyControl.h"
//获取自动高和时间转化的帮助类
#import "Helper.h"
//第三方下载类
#import "AFNetworking.h"




#endif
