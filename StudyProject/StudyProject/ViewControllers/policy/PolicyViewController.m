//
//  PolicyViewController.m
//  StudyProject
//
//  Created by BrotherWei on 14/12/29.
//  Copyright (c) 2014年 paDev. All rights reserved.
//

#import "PolicyViewController.h"

@interface PolicyViewController ()

@end

@implementation PolicyViewController
@synthesize webVeiwPolicy;

- (void)viewWillAppear:(BOOL)animated
{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"保单";
    
    self.hidesBottomBarWhenPushed = YES;
    
    NSString *requestStr = @"http://photo.energytrust.com.cn/batch.php/Home/Mobile/index.html";
    [webVeiwPolicy loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:requestStr]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-------------------------  UIWebView Delegate   ------------------------------*/
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{

}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if([error code] == NSURLErrorCancelled)
    {
        return;
    }
    NSLog(@"%@\n" , error);
    
    NSLog(@"domain :  %@" , error.domain);
    NSLog(@"code :  %ld" , error.code);
}

@end
