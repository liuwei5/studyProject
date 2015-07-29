//
//  NetworkEngine.m
//  StudyProject
//
//  Created by BrotherWei on 15/4/8.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "NetworkEngine.h"

static NetworkEngine *defaultEngine = nil;

@implementation NetworkEngine

+ (NetworkEngine *)defaultEngine
{
   if(defaultEngine == nil)
   {
       defaultEngine = [[super alloc] initWithHostName:HOST_DEFAULT_IP];
   }
   return defaultEngine;
}

@end
