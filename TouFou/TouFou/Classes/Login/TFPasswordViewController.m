//
//  TFPasswordViewController.m
//  TouFou
//
//  Created by KID on 15/10/22.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFPasswordViewController.h"
#import "UITextField+Shake.h"

#define CodeLength  (4)

@interface TFPasswordViewController ()

@end

@implementation TFPasswordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"修改密码"];
    [self setTitleCustom:@"修改密码"];
    
    [self createReturnButton];
    
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self an_subscribeKeyboardWithAnimations:^(CGRect keyboardRect, NSTimeInterval duration, BOOL isShowing) {
        if (isShowing) {
            CGRect frame = _viewAction.frame;
            frame.origin.y = self.view.frame.size.height - frame.size.height - keyboardRect.size.height;
            _viewAction.frame = frame;
        }
        else {
            CGRect frame = _viewAction.frame;
            frame.origin.y = self.view.frame.size.height - frame.size.height;
            _viewAction.frame = frame;
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self resignFirstResponder:nil];
    [self an_unsubscribeKeyboard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Initialization
- (void)initView
{
    if (_type == TFPasswordTypeForget) {
        _textCode.placeholder = @"验证码";
    }
    else if (_type == TFPasswordTypeEdit) {
        _textCode.placeholder = @"旧密码";
    }
    
    _viewCode.layer.cornerRadius = _viewCode.height / 2;
    _viewCode.layer.masksToBounds = true;
    
    _viewPassword1.layer.cornerRadius = _viewPassword1.height / 2;
    _viewPassword1.layer.masksToBounds = true;
    
    _viewPassword2.layer.cornerRadius = _viewPassword2.height / 2;
    _viewPassword2.layer.masksToBounds = true;
}

#pragma mark -
#pragma mark Action
- (IBAction)resignFirstResponder:(id)sender
{
    [_textCode resignFirstResponder];
    [_textPassword1 resignFirstResponder];
    [_textPassword2 resignFirstResponder];
}

- (IBAction)actionNext1:(id)sender
{
    [_textPassword1 becomeFirstResponder];
}

- (IBAction)actionNext2:(id)sender
{
    [_textPassword2 becomeFirstResponder];
}

- (IBAction)actionDone:(id)sender
{
    [_textPassword2 resignFirstResponder];
}

- (IBAction)actionConfirm:(id)sender
{
    if (_type == TFPasswordTypeForget) {
        if (_textCode.text.length != CodeLength) {
            [TFProgressHUD showErrorWithStatus:@"请输入正确的验证码"];
            [_textCode becomeFirstResponder];
            [_textCode shake];
            return;
        }
    }
    else if (_type == TFPasswordTypeEdit) {
        if (_textCode.text.length == 0) {
            [TFProgressHUD showErrorWithStatus:@"请输入旧密码"];
            [_textCode becomeFirstResponder];
            [_textCode shake];
            return;
        }
    }
    
    if (_textPassword1.text.length == 0) {
        [TFProgressHUD showErrorWithStatus:@"请输入新密码"];
        [_textPassword1 becomeFirstResponder];
        [_textPassword1 shake];
        return;
    }
    
    if (_textPassword2.text.length == 0) {
        [TFProgressHUD showErrorWithStatus:@"请确认新密码"];
        [_textPassword2 becomeFirstResponder];
        [_textPassword2 shake];
        return;
    }
    
    if (![_textPassword1.text isEqualToString:_textPassword2.text]) {
        [TFProgressHUD showErrorWithStatus:@"两次密码不一致"];
        [_textPassword2 becomeFirstResponder];
        [_textPassword2 shake];
        return;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)actionCancel:(id)sender
{
    [self actionReturn];
}

#pragma mark -
#pragma mark TextField
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (_type == TFPasswordTypeForget) {
        if (textField == _textCode) {
            NSScanner      *scanner = [NSScanner scannerWithString:string];
            NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            NSString *buffer;
            if (![scanner scanCharactersFromSet:numbers intoString:&buffer] && (string.length != 0)) {
                return NO;
            }
            if (string.length > 0) {
                if (_textCode.text.length == CodeLength) {
                    return NO;
                }
                else if (_textCode.text.length == CodeLength - 1 &&
                         _textPassword1.text.length > 0 &&
                         _textPassword2.text.length > 0) {
                    _btnConfirm.enabled = YES;
                }
            }
            else {
                _btnConfirm.enabled = NO;
            }
        }
        else if (textField == _textPassword1) {
            if (string.length > 0) {
                if (_textPassword2.text.length > 0 &&
                    _textCode.text.length == CodeLength) {
                    _btnConfirm.enabled = YES;
                }
            }
            else {
                if (_textPassword1.text.length == 1 ||
                    _textPassword2.text.length == 0 ||
                    _textCode.text.length != CodeLength) {
                    _btnConfirm.enabled = NO;
                }
            }
        }
        else if (textField == _textPassword2) {
            if (string.length > 0) {
                if (_textPassword1.text.length > 0 &&
                    _textCode.text.length == CodeLength) {
                    _btnConfirm.enabled = YES;
                }
            }
            else {
                if (_textPassword2.text.length == 1 ||
                    _textPassword1.text.length == 0 ||
                    _textCode.text.length != CodeLength) {
                    _btnConfirm.enabled = NO;
                }
            }
        }
    }
    else if (_type == TFPasswordTypeEdit) {
        if (textField == _textCode) {
            if (string.length > 0) {
                if (_textPassword1.text.length > 0 &&
                    _textPassword2.text.length > 0) {
                    _btnConfirm.enabled = YES;
                }
            }
            else {
                if (_textCode.text.length == 1 ||
                    _textPassword1.text.length == 0 ||
                    _textPassword2.text.length == 0) {
                    _btnConfirm.enabled = NO;
                }
            }
        }
        else if (textField == _textPassword1) {
            if (string.length > 0) {
                if (_textPassword2.text.length > 0 &&
                    _textCode.text.length > 0) {
                    _btnConfirm.enabled = YES;
                }
            }
            else {
                if (_textPassword1.text.length == 1 ||
                    _textPassword2.text.length == 0 ||
                    _textCode.text.length == 0) {
                    _btnConfirm.enabled = NO;
                }
            }
        }
        else if (textField == _textPassword2) {
            if (string.length > 0) {
                if (_textPassword1.text.length > 0 &&
                    _textCode.text.length > 0) {
                    _btnConfirm.enabled = YES;
                }
            }
            else {
                if (_textPassword2.text.length == 1 ||
                    _textPassword1.text.length == 0 ||
                    _textCode.text.length == 0) {
                    _btnConfirm.enabled = NO;
                }
            }
        }
    }
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    _btnConfirm.enabled = NO;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

@end
