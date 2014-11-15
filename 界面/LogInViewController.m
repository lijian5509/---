//
//  LogInViewController.m
//  快递兔-终
//
//  Created by kuaiditu on 14-11-15.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import "LogInViewController.h"
#import "GetBackPasswordViewController.h"
#import "RegisterViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

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
    UIButton *btn=(UIButton *)[self.view viewWithTag:101];
     btn.userInteractionEnabled=NO;
    
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
            RegisterViewController *reg=[[RegisterViewController alloc]init];
            UINavigationController *nac=[[UINavigationController alloc]initWithRootViewController:reg];
            reg.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
            [self presentViewController:nac animated:YES completion:nil];

        }
            break;
        case 103:
        {
            GetBackPasswordViewController *get=[[GetBackPasswordViewController alloc]init];
            UINavigationController *nac=[[UINavigationController alloc]initWithRootViewController:get];
            get.modalTransitionStyle=UIModalTransitionStylePartialCurl;
            [self presentViewController:nac animated:YES completion:nil];
        }
            break;
        case 104:
        {
        
        }
            break;
            
        default:
            break;
    }
}
@end
