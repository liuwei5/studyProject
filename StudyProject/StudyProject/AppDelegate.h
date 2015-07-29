//
//  AppDelegate.h
//  StudyProject
//
//  Created by BrotherWei on 14/12/22.
//  Copyright (c) 2014年 paDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabViewController.h"
#import "LeftTabViewController.h"
#import "YRSideViewController.h"//侧滑缩放效果2

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic , strong) NSString *currentDeviceTokenId;
@property (nonatomic , strong) YRSideViewController *yrSldeController;
@property (nonatomic , strong) MainTabViewController *mainTabViewCtr;
@property (nonatomic , strong) LeftTabViewController *leftTabCtr;

- (void)appHiddenMainTabBar;
- (void)appShowMainTabBar;

@end

