//
//  TFRegistViewController.m
//  TouFou
//
//  Created by KID on 15/10/22.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFRegistViewController.h"
#import "TFAgreementViewController.h"
#import "UITextField+Shake.h"

@interface TFRegistViewController ()

@end

@implementation TFRegistViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"注册"];
    [self setTitleCustom:@"注册页面"];
    
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
    _viewAccount.layer.cornerRadius = _viewAccount.height / 2;
    _viewAccount.layer.masksToBounds = true;
    
    _viewPassword1.layer.cornerRadius = _viewPassword1.height / 2;
    _viewPassword1.layer.masksToBounds = true;
    
    _viewPassword2.layer.cornerRadius = _viewPassword2.height / 2;
    _viewPassword2.layer.masksToBounds = true;
}

#pragma mark -
#pragma mark Action
- (IBAction)resignFirstResponder:(id)sender
{
    [_textAccount resignFirstResponder];
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

- (IBAction)actionAgree:(id)sender
{
    TFAgreementViewController *vc = [[TFAgreementViewController alloc] initWithNibName:@"TFAgreementViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)actionConfirm:(id)sender
{
    if (_textAccount.text.length == 0) {
        [TFProgressHUD showErrorWithStatus:@"请输入用户名"];
        [_textAccount becomeFirstResponder];
        [_textAccount shake];
        return;
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
    if (textField == _textAccount) {
        if (string.length > 0) {
            if (_textPassword1.text.length > 0 &&
                _textPassword2.text.length > 0) {
                _btnConfirm.enabled = YES;
            }
        }
        else {
            if (_textAccount.text.length == 1 ||
                _textPassword1.text.length == 0 ||
                _textPassword2.text.length == 0) {
                _btnConfirm.enabled = NO;
            }
        }
    }
    else if (textField == _textPassword1) {
        if (string.length > 0) {
            if (_textPassword2.text.length > 0 &&
                _textAccount.text.length > 0) {
                _btnConfirm.enabled = YES;
            }
        }
        else {
            if (_textPassword1.text.length == 1 ||
                _textPassword2.text.length == 0 ||
                _textAccount.text.length == 0) {
                _btnConfirm.enabled = NO;
            }
        }
    }
    else if (textField == _textPassword2) {
        if (string.length > 0) {
            if (_textPassword1.text.length > 0 &&
                _textAccount.text.length > 0) {
                _btnConfirm.enabled = YES;
            }
        }
        else {
            if (_textPassword2.text.length == 1 ||
                _textPassword1.text.length == 0 ||
                _textAccount.text.length == 0) {
                _btnConfirm.enabled = NO;
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
