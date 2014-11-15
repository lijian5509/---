//
//  GetBackPasswordViewController.m
//  快递兔-终
//
//  Created by kuaiditu on 14-11-15.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import "GetBackPasswordViewController.h"


@interface GetBackPasswordViewController ()

@end

@implementation GetBackPasswordViewController

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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"登录_01"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
    self.navigationItem.leftBarButtonItem=nil;
    UIButton *btn=(UIButton *)[self.view viewWithTag:102];
   btn.userInteractionEnabled=NO;
}

#pragma mark -收键盘
SHOUJIANPAN;
INPUTACCESSVIEW

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (IBAction)btnClicked:(UIButton *)sender {
    switch (sender.tag) {
        case 101://登陆
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case 103://获取验证码
        {
           
        }
            break;
        case 104://找回密码，确定
        {
            
        }
            break;
            
        default:
            break;
    }
    
}
@end
