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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"保单";    
    NSString *requestStr = @"http://photo.energytrust.com.cn/batch.php/Home/Mobile/index.html";
    [webVeiwPolicy loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:requestStr]]];
    
    //    NSURL *url = [NSURL URLWithString:@"http://test-elis-cms.pa18.com:43128/cmsinfo/upload/advert/(4)-_-_-1445418332476.jpg"];
    //    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImageView *image  = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    image.image = [UIImage imageNamed:@"(4)-_-_-1445418332476"];
    [self.view addSubview:image];
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
