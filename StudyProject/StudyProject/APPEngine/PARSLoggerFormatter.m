//
//  PARSLoggerFormatter.m
//  StudyProject
//
//  Created by BrotherWei on 15/9/1.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "PARSLoggerFormatter.h"
#import <libkern/OSAtomic.h>


@implementation PARSLoggerFormatter

- (NSString *)stringFromDate:(NSDate *)date
{
    NSString *dateFormatterString = @"yyyy/MM/dd HH:mm:ss:SSS";
    
    int32_t loggerCount = OSAtomicAdd32(0, &atomicLoggerCount);
    
    if(loggerCount <= 1){
        //  Single - threaded mode
        
        if(threadUnsafeDateFormatter == nil){
            threadUnsafeDateFormatter = [[NSDateFormatter alloc] init];
            [threadUnsafeDateFormatter setDateFormat:dateFormatterString];
        }
        
        return [threadUnsafeDateFormatter stringFromDate:date];
    }else{
        //  multi - threaded mode
        //  NSDateFormatter is nit threaded-safe
        
        NSString *key = @"PARSLoggerFormatter_NSDateFromatter";
        
        NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
        NSDateFormatter *dateFormatter = [threadDictionary objectForKey:key];
        
        if(dateFormatter == nil){
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:dateFormatterString];
            
            [threadDictionary setObject:dateFormatter forKey:key];
        }
        
        return [dateFormatter stringFromDate:date];
    }
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *logLevel;
    
    switch (logMessage->_flag) {
        case DDLogFlagError      :  logLevel = @"E";  break;
        case DDLogFlagWarning    :  logLevel = @"W";  break;
        case DDLogFlagInfo       :  logLevel = @"I";  break;
        case DDLogFlagDebug      :  logLevel = @"D";  break;
        default                  :  logLevel = @"V";  break;
    }
    
    return [NSString stringWithFormat:@"%@  |  %@" , logLevel , logMessage->_message];
}

- (void)didAddToLogger:(id<DDLogger>)logger
{
    OSAtomicIncrement32(&atomicLoggerCount);
}

- (void)willRemoveFromLogger:(id<DDLogger>)logger
{
    OSAtomicDecrement32(&atomicLoggerCount);
}

@end
