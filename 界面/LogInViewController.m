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
#import "AFHTTPClient.h"
#import "TabBarViewController.h"
#import "AppDelegate.h"


@interface LogInViewController ()
{
    AFHTTPClient *aClient;
}
@end

@implementation LogInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        aClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@""]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showUI];
    [self getBackKeybord];//设置二级键盘
    self.phoneTextField.delegate=self;
    self.passwordText.delegate=self;
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

#pragma mark - 实现输入框的协议

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.tag==201) {
        if (textField.text.length+string.length>11) {
            return NO;
        }
    }else{
        if (textField.text.length+string.length>16) {
            return NO;
        }
    }
       return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (textField.tag==201) {
        if ([textField.text length] == 0) {
            [self showAlertViewWithMaessage:@"号码不能为空"];
            return YES;
        }
        
        //1[0-9]{10}
        
        //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
        
        //    NSString *regex = @"[0-9]{11}";
        
        BOOL isMatch = [Helper validateMobile: textField.text];
        if (!isMatch) {
            [self showAlertViewWithMaessage:@"请输入正确的手机号码"];
        }
    }else{
        if ([textField.text length] == 0) {
            [self showAlertViewWithMaessage:@"密码不能为空"];
            return YES;
        }
        BOOL isMatch = [Helper validatePassword: textField.text];
        if (!isMatch) {
            [self showAlertViewWithMaessage:@"密码输入有误"];
        }
    }
    return YES;
}
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
        case 102://注册
        {
            RegisterViewController *reg=[[RegisterViewController alloc]init];
            UINavigationController *nac=[[UINavigationController alloc]initWithRootViewController:reg];
            reg.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
            [self presentViewController:nac animated:YES completion:nil];
        }
            break;
        case 103://忘记密码
        {
            GetBackPasswordViewController *get=[[GetBackPasswordViewController alloc]init];
            UINavigationController *nac=[[UINavigationController alloc]initWithRootViewController:get];
            get.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
            [self presentViewController:nac animated:YES completion:nil];
        }
            break;
        case 104://确定登录
        {
            [self requestUrl];
        }
            break;
            
        default:
            break;
    }
}
#pragma mark -用户请求
-(void)requestUrl{
   
    if (self.phoneTextField.text.length==0) {
        [self showAlertViewWithMaessage:@"账号不能为空"];
        return;
    }
    if (self.passwordText.text.length==0) {
        [self showAlertViewWithMaessage:@"密码不能为空"];
        return;
    }
    NSDictionary *dic=@{@"mobile": self.phoneTextField.text};
    NSString *urlPath=[NSString stringWithFormat:CESHIZONG,SHIFOUZHUCE];
    //初始化为空 方便下面统一赋值
    [aClient postPath:urlPath parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dataDict=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
         BOOL n=[(NSNumber *)dataDict[@"success"] boolValue];
        if (!n) {
            [self showAlertViewWithMaessage:@"该账户未注册，请先注册"];
            return ;
        }else{
            //post请求
            NSDictionary *dict = @{@"mobile":self.phoneTextField.text,@"password":self.passwordText.text};
            NSString *postPath = [NSString stringWithFormat:CESHIZONG,DENGLU];
            [aClient postPath:postPath parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [self downLoadSuccess:responseObject];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"%@",error);
            }];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
#pragma mark - 解析数据
-(void)downLoadSuccess:(id)responseObject{
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
    BOOL n=[(NSNumber *)dict[@"success"] boolValue];
    
    NSNumber *checkStatus=dict[@"checkStatus"];
    NSNumber *userId=dict[@"id"];
    NSNumber *verSion=dict[@"version"];
    
    if (!n) {
        [self showAlertViewWithMaessage:@"密码或者账号输入有误"];
        return;
    }else{
        NSString *filePatn=[NSHomeDirectory() stringByAppendingPathComponent:@"userInfo.plist"];
        NSMutableDictionary *dictPlist=[NSMutableDictionary dictionaryWithContentsOfFile:filePatn];
        [dictPlist setValue:@"1" forKey:@"isLog"];
        [dict setValue:[checkStatus stringValue] forKey:@"checkStatus"];
        [dict setValue:[userId stringValue] forKey:@"id"];
        [dict setValue:[verSion stringValue] forKey:@"version"];
        [dictPlist writeToFile:filePatn atomically:YES];
        UIApplication *app=[UIApplication sharedApplication];
        AppDelegate *app2=app.delegate;
        app2.window.rootViewController=[TabBarViewController shareTabBar];
    }
}
//显示警告框
- (void) showAlertViewWithMaessage:(NSString *)title{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:title delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


@end
