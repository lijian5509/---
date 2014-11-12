//
//  DuanXinViewCell.m
//  快递兔-终
//
//  Created by kuaiditu on 14-11-11.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import "DuanXinViewCell.h"

@implementation DuanXinViewCell

- (void)awakeFromNib
{
    self.textField.delegate=self;
    self.textField.keyboardType=UIKeyboardTypeTwitter;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.textField resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - 限定输入内容
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.text.length >=12) {
        if ([self.textDelegate respondsToSelector:@selector(addTextField:)]) {
            [self.textDelegate performSelector:@selector(addTextField:) withObject:self];
        return NO;
        }
    }
    return YES;
}

- (IBAction)btnClicked:(UIButton *)sender {
    
    if ([self.textDelegate respondsToSelector:@selector(removeTextViewWith:)]) {
        [self.textDelegate performSelector:@selector(removeTextViewWith:) withObject:self];
    }
}
@end
    
