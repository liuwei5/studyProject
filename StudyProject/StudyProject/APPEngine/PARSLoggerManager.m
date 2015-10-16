//
//  PARSLogger.m
//  StudyProject
//
//  Created by BrotherWei on 15/9/1.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "PARSLoggerManager.h"

@implementation PARSLoggerManager

+ (void)setup
{
    [DDLog addLogger:[DDASLLogger sharedInstance]];//发送日志语句到苹果的日志系统
    [DDLog addLogger:[DDTTYLogger sharedInstance]];//发送日志语句到Xcode控制台
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
}

@end
