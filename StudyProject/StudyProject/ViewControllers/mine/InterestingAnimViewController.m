//
//  InterestingAnimViewController.m
//  StudyProject
//
//  Created by BrotherWei on 15/2/11.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "InterestingAnimViewController.h"


@interface InterestingAnimViewController ()

@end

@implementation InterestingAnimViewController
@synthesize liveSwitch;
@synthesize durationSlider;
@synthesize eleLengthSilder;
@synthesize eleWidthSilder;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBaseUiPropertiesForView];
    
    ws = [[WovenStar alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    
    [ws setForeColor:[Utility randomColor]
        andBackColor:[UIColor whiteColor]];
    
    [ws setCenter:CGPointMake(self.view.center.x, self.view.center.y - 95)];
    
    [self.view addSubview:ws];
    
    [ws setPaused:NO];
}

- (void)setupBaseUiPropertiesForView
{
    self.title = @"发呆";
    
    UIBarButtonItem *btnNavBack = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickNavBackBtn)];
    btnNavBack.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = btnNavBack;
}

- (void)clickNavBackBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)slide:(UISlider *)sender
{
    if (sender==durationSlider) {
        
        ws.duration = sender.value;
        
    } else if (sender==eleWidthSilder) {
        
        ws.eleWidth = sender.value;
        
    } else if (sender==eleLengthSilder) {
        
        ws.eleLength = sender.value;
    }
}

- (IBAction)liveSwitched:(UISwitch *)sender
{
    ws.paused = !sender.on;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
