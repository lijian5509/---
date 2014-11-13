//
//  KuaiDiViewCell.h
//  快递兔-终
//
//  Created by kuaiditu on 14-11-13.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KuaiDiViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *phoneView;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UIImageView *waitView;
@property (weak, nonatomic) IBOutlet UILabel *waitLabel;

@end
