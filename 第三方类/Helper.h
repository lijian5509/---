//
//  Helper.h
//  快递兔测试版
//
//  Created by kuaiditu on 14-11-10.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject

//把一个时间字符串转化为date格式的字符串
+(NSString *)dateStringFromNumberString:(NSString *)str;
//根据字符串内容 获取lable的真实的高度
+(CGFloat)textHeightFromString:(NSString *)textStr width:(CGFloat)width fontsize:(CGFloat)Size;

@end
