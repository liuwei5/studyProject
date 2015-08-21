//
//  Globle.h
//  StudyProject
//
//  Created by BrotherWei on 14/12/22.
//  Copyright (c) 2014年 paDev. All rights reserved.
//

#ifndef StudyProject_Globle_h
#define StudyProject_Globle_h

#define WeakSelf(weakSelf) __weak __typeof(& *self)weakSelf = self;

#define HOST_DEFAULT_IP @"www.baidu.com"

// 0  -  侧滑效果1     1 - 侧滑效果2
#define ENVIRENTMENT 0

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define IS_IPHONE5           (([[UIScreen mainScreen] bounds].size.height - 568)?NO:YES)
#define IS_3_5_INCH          ([[UIScreen mainScreen] bounds].size.width == 320 && [[UIScreen mainScreen] bounds].size.height == 480 ? YES:NO)
#define IS_4_0_INCH          ([[UIScreen mainScreen] bounds].size.width == 320 && [[UIScreen mainScreen] bounds].size.height == 568 ? YES:NO)
#define IS_4_7_INCH          ([[UIScreen mainScreen] bounds].size.width == 375 && [[UIScreen mainScreen] bounds].size.height == 667 ? YES:NO)
#define IS_5_5_INCH          ([[UIScreen mainScreen] bounds].size.width == 414 && [[UIScreen mainScreen] bounds].size.height == 736 ? YES:NO)

#define IS_IOS_7_OR_BEFORE   ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
#define IS_IOS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_IOS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_IOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)



#endif
