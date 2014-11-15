//
//  FillMessageViewController.m
//  快递兔-终
//
//  Created by kuaiditu on 14-11-15.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import "FillMessageViewController.h"

@interface FillMessageViewController ()

@end

@implementation FillMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showUI];
    [self getBackKeybord];
}
#pragma mark - 摆UI界面
- (void)showUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"订单详情_11"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
    self.title=@"验证网点信息";
    BACKKEYITEM;
}
-(void)getBack{
    self.hidesBottomBarWhenPushed=NO;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -收键盘
SHOUJIANPAN;
INPUTACCESSVIEW

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnClicked:(UIButton *)sender {
    
    switch (sender.tag) {
        case 101:
        {
            
        }
            break;
        case 102:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    
}

@end
