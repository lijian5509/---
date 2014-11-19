//
//  NoMoneyViewController.m
//  快递兔-终
//
//  Created by kuaiditu on 14-11-12.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import "NoMoneyViewController.h"
#import "GetBankCardViewController.h"



@interface NoMoneyViewController ()

@end

@implementation NoMoneyViewController

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
}
#pragma mark - 摆UI界面
- (void)showUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"订单详情_11"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
    self.title=@"设置";
    BACKVIEW;
    BACKKEYITEM;
}
-(void)getBack{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 收键盘
SHOUJIANPAN;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClicked:(UIButton *)sender {
    GetBankCardViewController *get=[[GetBankCardViewController alloc]init];
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:get animated:YES];
    
}
@end
