//
//  CountStepViewController.m
//  StudyProject
//
//  Created by BrotherWei on 15/1/1.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "CountStepViewController.h"

@interface CountStepViewController ()

@end

@implementation CountStepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBaseUiPropertiesForView];
}

- (void)setupBaseUiPropertiesForView
{
    self.title = @"计步器";
    
    UIBarButtonItem *btnNavBack = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickNavBackBtn)];
    btnNavBack.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = btnNavBack;
}

- (void)clickNavBackBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
