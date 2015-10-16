//
//  PARSLoggerFormatter.h
//  StudyProject
//
//  Created by BrotherWei on 15/9/1.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PARSLoggerFormatter : NSObject <DDLogFormatter>
{
    int atomicLoggerCount;
    
    NSDateFormatter *threadUnsafeDateFormatter;
}

@end
