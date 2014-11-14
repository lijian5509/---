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
//返回键

//设置背景图片
#define TABLEVIEWBACKVIEW self.tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"灰色背景 "]]

#define BACKVIEW self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"灰色背景"]]

//设定常用颜色
#define GRAYCOLOR [UIColor colorWithPatternImage:[UIImage imageNamed:@"灰色背景"]]



//常用控件
#import "MyControl.h"
//获取自动高和时间转化的帮助类
#import "Helper.h"
//第三方下载类
#import "AFNetworking.h"


//CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//CGColorRef borderColorRef = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
#define BACKKEYITEM UIButton *btn=[MyControl creatButtonWithFrame:CGRectMake(0, 0,60, 40) target:self sel:@selector(getBack) tag:101 image:nil title:@"<返回"];\
\
btn.titleLabel.font=[UIFont boldSystemFontOfSize:17];\
\
[btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];\
\
UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:btn];\
\
self.navigationItem.leftBarButtonItem=item;\

#endif
