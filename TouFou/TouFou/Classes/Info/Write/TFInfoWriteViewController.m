//
//  TFInfoWriteViewController.m
//  TouFou
//
//  Created by KID on 15/10/13.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoWriteViewController.h"
#import "UITextView+PlaceHolder.h"

@interface TFInfoWriteViewController ()

@end

@implementation TFInfoWriteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"撰写点评"];
    [self setTitleCustom:@"撰写点评"];
    
    [self createReturnButton];
    [self createCustomButton:@"发布" target:self action:@selector(actionSubmit)];
    
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self an_subscribeKeyboardWithAnimations:^(CGRect keyboardRect, NSTimeInterval duration, BOOL isShowing) {
        if (!isShowing) {
            _textContent.height = self.view.height - 270;
        }
        else {
            _textContent.height = self.view.height - 40 - keyboardRect.size.height;
        }
    }
                                  completion:^(BOOL finished) {
                                      
                                  }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self an_unsubscribeKeyboard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)initView
{
    [_textContent setPlaceholder:@"撰写分析内容"];
}

#pragma mark -
#pragma mark Action
- (void)actionSubmit
{
    
}

- (IBAction)actionResign:(id)sender
{
    [_textContent resignFirstResponder];
}

- (IBAction)actionAgree:(id)sender
{
    [_viewAgree setHidden:YES];
}

- (IBAction)actionDisagree:(id)sender
{
    [self actionReturn];
}

@end
