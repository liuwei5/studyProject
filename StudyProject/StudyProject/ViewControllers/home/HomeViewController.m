//
//  HomeViewController.m
//  StudyProject
//
//  Created by BrotherWei on 14/12/29.
//  Copyright (c) 2014年 paDev. All rights reserved.
//

#import "HomeViewController.h"
#import "HomePushViewController.h"
#import "HomePresentViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize ViewStyleTwo;
@synthesize switchSwapGesture;
@synthesize switchUserDefAnim;

- (void)viewWillAppear:(BOOL)animated
{
    [ApplicationDelegate appShowMainTabBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBaseUiPropertiesForView];
    
    [self useMarsonAutoLayout];
}

- (void)setupBaseUiPropertiesForView
{
    self.title = @"首页";
    
    if(ENVIRENTMENT == 0)
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"左边" style:UIBarButtonItemStylePlain target:self action:@selector(left)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右边" style:UIBarButtonItemStylePlain target:self action:@selector(right)];
        
        ViewStyleTwo.hidden = YES;
    }
    else
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"左边1" style:UIBarButtonItemStylePlain target:self action:@selector(leftStyle2)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右边1" style:UIBarButtonItemStylePlain target:self action:@selector(rightStyle2)];
    }

    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)left
{
    [self.drawerController toggleDrawerSide:XHDrawerSideLeft animated:YES completion:NULL];
}

- (void)right
{
    [self.drawerController toggleDrawerSide:XHDrawerSideRight animated:YES completion:^(BOOL finished) {
        
    }];
}

- (void)leftStyle2
{
    YRSideViewController *sideViewController = ApplicationDelegate.yrSldeController;
    [sideViewController showLeftViewController:true];
}

- (void)rightStyle2
{
    YRSideViewController *sideViewController = ApplicationDelegate.yrSldeController;
    [sideViewController showRightViewController:true];
}


- (IBAction)clickPushBtn:(id)sender {
    [ApplicationDelegate appHiddenMainTabBar];
    HomePushViewController *homePush = [[HomePushViewController alloc] init];
    [self.navigationController pushViewController:homePush animated:YES];
}

- (IBAction)clickPresentBtn:(id)sender
{
    HomePresentViewController *homePresent = [[HomePresentViewController alloc] init];
    UINavigationController *navDismiss = [[UINavigationController alloc] initWithRootViewController:homePresent];
    [self presentViewController:navDismiss animated:YES completion:^{

    }];
}

- (IBAction)clickSwapGestureSwitch:(id)sender
{
    YRSideViewController *sideViewController = ApplicationDelegate.yrSldeController;
    [sideViewController setNeedSwipeShowMenu:switchSwapGesture.on];
}

- (IBAction)clickUserDefAnimSwitch:(id)sender
{
    YRSideViewController *sideViewController = ApplicationDelegate.yrSldeController;
    if (switchUserDefAnim.on) {
        [sideViewController setRootViewMoveBlock:^(UIView *rootView, CGRect orginFrame, CGFloat xoffset) {
            //使用简单的平移动画
            rootView.frame=CGRectMake(xoffset, orginFrame.origin.y, orginFrame.size.width, orginFrame.size.height);
        }];
    }else{
        [sideViewController setRootViewMoveBlock:nil];
    }
}

- (void)useMarsonAutoLayout
{
    WeakSelf(selView);
    
    UIView *firstView = [UIView new];
    firstView.backgroundColor = [UIColor redColor];
    [self.view addSubview:firstView];
    
    UIView *secondView = [UIView new];
    secondView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:secondView];
    
    UIView *tirdView = [UIView new];
    tirdView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:tirdView];
    
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(selView.view);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(firstView.center.y);
        make.centerX.mas_equalTo(firstView.center.x);
        make.size.mas_equalTo(CGSizeMake(250, 20));
    }];
    
    [tirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(secondView).with.insets(UIEdgeInsetsMake(2, 2, 2, 2));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
