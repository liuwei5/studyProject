//
//  HomePresentViewController.m
//  StudyProject
//
//  Created by BrotherWei on 14/12/31.
//  Copyright (c) 2014年 paDev. All rights reserved.
//

#import "HomePresentViewController.h"

@interface HomePresentViewController ()

@end

@implementation HomePresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBaseUiPropertiesForView];
}

- (void)setupBaseUiPropertiesForView
{
    self.title = @"首页Pre";
    
    UIBarButtonItem *btnNavBack = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(clickNavBackBtn)];
    btnNavBack.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = btnNavBack;
}

- (void)clickNavBackBtn
{
   [self dismissViewControllerAnimated:YES completion:^{
       
   }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
