//
//  TFAgreementViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFAgreementViewController.h"

@interface TFAgreementViewController ()

@end

@implementation TFAgreementViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"平台协议"];
    [self setTitleCustom:@"平台协议"];
    [self createReturnButton];
    
    if (!_strURL) {
         _strURL = TFAgreement;
    }
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_strURL]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark WebView
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    TFLog(@"WebView: %@",[webView stringByEvaluatingJavaScriptFromString:@"document.title"]);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
