//
//  Helper.m
//  快递兔测试版
//
//  Created by kuaiditu on 14-11-10.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+(NSString *)dateStringFromNumberString:(NSString *)str{
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:[str doubleValue]];
    NSDateFormatter *fm=[[NSDateFormatter alloc]init];
    fm.dateFormat=@"yyyy-MM-dd HH:mm:ss";
    return [fm stringFromDate:date];
}

+(CGFloat)textHeightFromString:(NSString *)textStr width:(CGFloat)width fontsize:(CGFloat)Size{
    //最好判断一下SDK 的版本
    //下面的方法是ios7 的
    /**
     *  根据字符串的内容 和固定的宽度来求高度
     @param size 给一个预设的大小 宽度写成固定的 高度写成float 的最大值
     @param option 第二哥参数用于设置 是否以段为基准 不以base line 为准
     第三个参数对文字进行设置
     @return 真实的大小
     */
    float dev=[[[UIDevice currentDevice]systemVersion]floatValue];
    if (dev>=7.0) {
        NSDictionary *dict=@{
                             NSFontAttributeName: [UIFont systemFontOfSize:Size]
                             };
        
        CGRect frame=[textStr boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil];
        return frame.size.height;
        
    }else{
        CGSize size=[textStr sizeWithFont:[UIFont systemFontOfSize:Size] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];
        return size.height;
    }
    
}


@end
