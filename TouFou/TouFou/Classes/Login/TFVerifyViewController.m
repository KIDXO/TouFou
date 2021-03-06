//
//  TFVerifyViewController.m
//  TouFou
//
//  Created by KID on 15/10/22.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFVerifyViewController.h"
#import "TFRegistViewController.h"
#import "TFPasswordViewController.h"

@interface TFVerifyViewController ()

@end

@implementation TFVerifyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_type == TFVerifyTypeRegist) {
        [self setTitle:@"手机验证"];
        [self setTitleCustom:@"手机验证"];
    }
    else if (_type == TFVerifyTypeForget) {
        [self setTitle:@"忘记密码"];
        [self setTitleCustom:@"忘记密码"];
    }
    
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
    _viewPhone.layer.cornerRadius = _viewPhone.height / 2;
    _viewPhone.layer.masksToBounds = true;
    
    _viewRound.layer.cornerRadius = _viewRound.height / 2;
    _viewRound.layer.masksToBounds = true;
}

#pragma mark -
#pragma mark Action
- (IBAction)resignFirstResponder:(id)sender
{
    [_textPhone resignFirstResponder];
}

- (IBAction)actionDone:(id)sender
{
    [_textPhone resignFirstResponder];
}

- (IBAction)actionVoice:(id)sender
{
    if (_type == TFVerifyTypeRegist) {
        TFRegistViewController *vc = [[TFRegistViewController alloc] initWithNibName:@"TFRegistViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (_type == TFVerifyTypeForget) {
        TFPasswordViewController *vc = [[TFPasswordViewController alloc] initWithNibName:@"TFPasswordViewController" bundle:nil];
        vc.type = TFPasswordTypeForget;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)actionConfirm:(id)sender
{
    if (_type == TFVerifyTypeRegist) {
        TFRegistViewController *vc = [[TFRegistViewController alloc] initWithNibName:@"TFRegistViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (_type == TFVerifyTypeForget) {
        TFPasswordViewController *vc = [[TFPasswordViewController alloc] initWithNibName:@"TFPasswordViewController" bundle:nil];
        vc.type = TFPasswordTypeForget;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)actionCancel:(id)sender
{
    [self actionReturn];
}

#pragma mark -
#pragma mark TextField
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == _textPhone) {
        NSScanner      *scanner = [NSScanner scannerWithString:string];
        NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        NSString *buffer;
        if (![scanner scanCharactersFromSet:numbers intoString:&buffer] && (string.length != 0)) {
            return NO;
        }
        if (string.length > 0) {
            if (_textPhone.text.length == 11) {
                return NO;
            }
            else if (_textPhone.text.length == 10) {
                _btnConfirm.enabled = YES;
            }
        }
        else {
            _btnConfirm.enabled = NO;
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
