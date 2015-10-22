//
//  TFLoginViewController.m
//  TouFou
//
//  Created by KID on 15/10/19.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFLoginViewController.h"
#import "TFVerifyViewController.h"

@interface TFLoginViewController ()

@end

@implementation TFLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"登录"];
    [self setTitleCustom:@"登录页面"];
    
    [self createReturnButton];
    [self createCustomButton:@"忘记密码" target:self action:@selector(actionForget:)];
    
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
    
    _viewPassword.layer.cornerRadius = _viewPassword.height / 2;
    _viewPassword.layer.masksToBounds = true;
}

#pragma mark -
#pragma mark Action
- (IBAction)resignFirstResponder:(id)sender
{
    [_textAccount  resignFirstResponder];
    [_textPassword resignFirstResponder];
}

- (IBAction)actionNext:(id)sender
{
    [_textPassword becomeFirstResponder];
}

- (IBAction)actionDone:(id)sender
{
    [_textPassword resignFirstResponder];
}

- (IBAction)actionConfirm:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)actionCancel:(id)sender
{
    [self actionReturn];
}

- (IBAction)actionForget:(id)sender
{
    TFVerifyViewController *vc = [[TFVerifyViewController alloc] initWithNibName:@"TFVerifyViewController" bundle:nil];
    vc.type = TFVerifyTypeForget;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark TextField
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == _textAccount) {
        if (string.length > 0) {
            if (_textPassword.text.length > 0) {
                _btnConfirm.enabled = YES;
            }
        }
        else {
            if (_textAccount.text.length == 1 ||
                _textPassword.text.length == 0) {
                _btnConfirm.enabled = NO;
            }
        }
    }
    else if (textField == _textPassword) {
        if (string.length > 0) {
            if (_textAccount.text.length > 0) {
                _btnConfirm.enabled = YES;
            }
        }
        else {
            if (_textPassword.text.length == 1 ||
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
