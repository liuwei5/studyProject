//
//  HomePushViewController.m
//  StudyProject
//
//  Created by BrotherWei on 14/12/29.
//  Copyright (c) 2014年 paDev. All rights reserved.
//

#import "HomePushViewController.h"

@interface HomePushViewController ()

@end

@implementation HomePushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBaseUiPropertiesForView];
}

- (void)setupBaseUiPropertiesForView
{
    self.title = @"首页level1";
    
    UIBarButtonItem *btnNavBack = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickNavBackBtn)];
    btnNavBack.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = btnNavBack;
}

- (void)clickNavBackBtn
{
    [ApplicationDelegate appShowMainTabBar];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
