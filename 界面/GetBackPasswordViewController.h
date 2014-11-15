//
//  GetBackPasswordViewController.h
//  快递兔-终
//
//  Created by kuaiditu on 14-11-15.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetBackPasswordViewController : UIViewController<UITextFieldDelegate>

- (IBAction)btnClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *testTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *tPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@end
