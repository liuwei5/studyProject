//
//  MainTabViewController.m
//  StudyProject
//
//  Created by BrotherWei on 14/12/29.
//  Copyright (c) 2014年 paDev. All rights reserved.
//

#import "MainTabViewController.h"
#import "HomeViewController.h"
#import "PolicyViewController.h"
#import "MyViewController.h"

@interface MainTabViewController ()

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBaseTabViewControllers];
}

- (void)initBaseTabViewControllers
{
    HomeViewController *homeTabView = [[HomeViewController alloc] init];
    homeTabView.tabBarItem.title = @"首页";
    homeTabView.tabBarItem.image = [UIImage imageNamed:@"testtttt.png"];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeTabView];

    PolicyViewController *policyTabView = [[PolicyViewController alloc] init];
    policyTabView.tabBarItem.title = @"保单";
    policyTabView.tabBarItem.image = [UIImage imageNamed:@"testtttt.png"];
    UINavigationController *policyNav = [[UINavigationController alloc] initWithRootViewController:policyTabView];
    
    MyViewController *myTabView = [[MyViewController alloc] init];
    myTabView.tabBarItem.title = @"我";
    myTabView.tabBarItem.image = [UIImage imageNamed:@"testtttt.png"];
    UINavigationController *myNav = [[UINavigationController alloc] initWithRootViewController:myTabView];

    self.viewControllers = @[homeNav,policyNav,myNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
