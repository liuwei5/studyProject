//
//  AppDelegate.m
//  StudyProject
//
//  Created by BrotherWei on 14/12/22.
//  Copyright (c) 2014年 paDev. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize currentDeviceTokenId;
@synthesize yrSldeController;
@synthesize mainTabViewCtr;
@synthesize leftTabCtr;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [DDLog addLogger:[DDASLLogger sharedInstance]];//发送日志语句到苹果的日志系统
    [DDLog addLogger:[DDTTYLogger sharedInstance]];//发送日志语句到Xcode控制台
    
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"Menubar@2x.png"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    
    leftTabCtr = [[LeftTabViewController alloc] init];
    
    mainTabViewCtr = [[MainTabViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainTabViewCtr];
    nav.navigationBarHidden = YES;
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgImg"]];
    [backgroundImageView setContentMode:UIViewContentModeScaleToFill];
    
    if(ENVIRENTMENT == 1)//branch分支 测试
    {
        XHDrawerController *drawerController = [[XHDrawerController alloc] init];
        drawerController.springAnimationOn = YES;
        drawerController.leftViewController = leftTabCtr;
        drawerController.centerViewController = nav;
        drawerController.backgroundView = backgroundImageView;
        self.window.rootViewController = drawerController;
    }
    else//merge 测试
    {
        yrSldeController = [[YRSideViewController alloc] init];
        yrSldeController.rootViewController = nav;
        yrSldeController.leftViewController = leftTabCtr;
        //yrSldeController.rightViewController = rightViewController;
        yrSldeController.leftViewShowWidth = 280;
        yrSldeController.needSwipeShowMenu = true;//默认开启的可滑动展示
        self.window.rootViewController = yrSldeController;
    }

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self useUIPasteboard];
    [self setupUpThreeTouchShortCutItems];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    if ([shortcutItem.localizedTitle isEqualToString:@"首页"]) {
        
    } else if([shortcutItem.localizedTitle isEqualToString:@"保单"]) {
        self.mainTabViewCtr.selectedIndex = 1;
    }
}

- (void)useUIPasteboard
{
    UIPasteboard *plasteBoard = [UIPasteboard generalPasteboard];
    NSLog(@"plasteBoard Str :  %@" , plasteBoard.string);
    
    if([plasteBoard.string isEqualToString:@"平安人寿"])
    {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        
        UIAlertController *alertCtr = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"有匹配的内容< %@ >" , plasteBoard.string] preferredStyle:UIAlertControllerStyleAlert];
        [alertCtr addAction:action];
        [self.window.rootViewController presentViewController:alertCtr animated:YES completion:^{
            
        }];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(60 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
}

- (void)setupUpThreeTouchShortCutItems
{
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeHome];
    
    UIApplicationShortcutItem *item1 =  [[UIApplicationShortcutItem alloc] initWithType:@"首页" localizedTitle:@"首页" localizedSubtitle:@"哈哈" icon:icon2 userInfo:nil];
    UIApplicationShortcutItem *item2 =  [[UIApplicationShortcutItem alloc] initWithType:@"保单" localizedTitle:@"保单"];
    
    [[UIApplication sharedApplication] setShortcutItems:@[item1 , item2]];
}

@end
