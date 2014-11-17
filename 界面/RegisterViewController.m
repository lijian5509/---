//
//  RegisterViewController.m
//  快递兔-终
//
//  Created by kuaiditu on 14-11-15.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import "RegisterViewController.h"
#import "FillMessageViewController.h"
#import "LogInViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    self.testTextField.delegate=self;
    self.phoneTextField.delegate=self;
    self.passwordTextField.delegate=self;
    self.tPasswordField.delegate=self;
}
#pragma mark - 摆UI界面
- (void)showUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"登录_01"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
    UIButton *btn=(UIButton *)[self.view viewWithTag:102];
    btn.userInteractionEnabled=NO;
}
#pragma mark -收键盘
SHOUJIANPAN;
INPUTACCESSVIEW

#pragma mark - 实现协议的内容
//结束输入 - 判断每个输入是否合理
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    switch (textField.tag) {
        case 201:
        {
            if ([textField.text length] == 0) {
                
                [self showAlertViewWithMaessage:@"请输入手机号"];
                return NO;
                
            }
            BOOL isMatch = [Helper validateMobile: textField.text];
            if (!isMatch) {
                [self showAlertViewWithMaessage:@"请输入正确的手机号码"];
                return NO;
            }
        }
        case 202:
        {
            if ([textField.text length] == 0) {
                [self showAlertViewWithMaessage:@"请输入验证码"];
                return NO;

            }
            BOOL isMatch = [Helper validatePassword: textField.text];
            if (!isMatch) {
                [self showAlertViewWithMaessage:@"验证码输入有误"];
                return NO;
            }
        }
        case 203:
        {
            if ([textField.text length] == 0) {
                [self showAlertViewWithMaessage:@"请输入密码"];
                return NO;
                
            }
            BOOL isMatch = [Helper validatePassword: textField.text];
            if (!isMatch) {
                [self showAlertViewWithMaessage:@"密码格式有误"];
                return NO;
            }
        }
        case 204:
        {
            if ([textField.text length] == 0) {
                [self showAlertViewWithMaessage:@"请确认密码"];
                return NO;
                
            }
            if (![self.passwordTextField.text isEqualToString:self.tPasswordField.text]) {
                [self showAlertViewWithMaessage:@"密码输入有误"];
                return NO;
            }
        }
            break;
        default:
            break;
    }
    return YES;
}
//输入时设置每个输入框的限制
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    switch (textField.tag) {
        case 201:
        {
            if (textField.text.length+string.length>11) {
            return NO;
            }
        }
        case 202:
        {
            if (textField.text.length+string.length>4) {
                return NO;
            }
        }
        
            break;
            
        default:
            break;
    }
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
//检测数据是否为空
- (BOOL) testTextFieldData{
    if (self.phoneTextField.text.length==0) {
        
        return NO;
        
    }
    return YES;
}

- (IBAction)btnClicked:(UIButton *)sender {
    //先检测数据是否为空
    [self testTextFieldData];
    AFHTTPClient *aClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@""]];

    switch (sender.tag) {
        case 101:
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case 103://获取验证码
        {
            NSDictionary *dic=@{@"mobile": self.phoneTextField.text};
            NSString *urlPath=[NSString stringWithFormat:CESHIZONG,SHIFOUZHUCE];
            //初始化为空 方便下面统一赋值
            [aClient postPath:urlPath parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSDictionary *dataDict=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                BOOL n=[(NSNumber *)dataDict[@"success"] boolValue];
                if (!n) {
                    NSString *postPath=[NSString stringWithFormat:CESHIZONG,FASONGYANZHENG];
                    [aClient postPath:postPath parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
                        [self showAlertViewWithMaessage:@"验证码已发送，请注意查收"];
                        [self startTimer];

                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                        NSLog(@"%@",error);
                    }];
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"%@",error);
            }];

        }
            break;
        case 104://注册
        {
            NSDictionary *dict=@{@"mobile": self.phoneTextField.text,@"random":self.testTextField.text};
            FillMessageViewController *fil=[[FillMessageViewController alloc]init];
            [self.navigationController pushViewController:fil animated:YES];
        }
            break;
            
        default:
            break;
    }

}

//开启定时器
-(void)startTimer{
    
}

//显示警告框
- (void) showAlertViewWithMaessage:(NSString *)title{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:title delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


@end
