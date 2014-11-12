//
//  ShouYeViewController.m
//  快递兔-终
//
//  Created by kuaiditu on 14-11-10.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import "ShouYeViewController.h"
#import "TabBarViewController.h"

@interface ShouYeViewController ()

@end

@implementation ShouYeViewController

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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"首页图片_02"] forBarMetrics:UIBarMetricsDefault];
    UIButton *btn=[MyControl creatButtonWithFrame:CGRectMake(0, 0, 320, 40) target:self sel:@selector(btnClicked:) tag:101 image:@"首页图片_03" title:nil];
    [self.view addSubview:btn];
    UIButton *Dbtn=[MyControl creatButtonWithFrame:CGRectMake(20, 80, 280, 90) target:self sel:@selector(btnClicked:) tag:102 image:@"首页图片_06" title:nil];
    Dbtn.layer.cornerRadius=100;
    
    UIButton *Xbtn=[MyControl creatButtonWithFrame:CGRectMake(20, 200, 280, 90) target:self sel:@selector(btnClicked:) tag:103 image:@"首页图片_09" title:nil];
    Xbtn.layer.cornerRadius=10;
    
    [self.view addSubview:Dbtn];
    [self.view addSubview:Xbtn];
}
#pragma mark -btn被点击
-(void)btnClicked:(UIButton *)sender{
    TabBarViewController *tab=[TabBarViewController shareTabBar];
    switch (sender.tag) {
        case 101:
        {
            
        }
            break;
        case 102:
        {
            tab.selectedIndex=1;
        }
            break;
        case 103:
        {
            tab.selectedIndex=2;
        }
            break;

            
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
