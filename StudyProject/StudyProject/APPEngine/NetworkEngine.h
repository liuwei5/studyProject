//
//  NetworkEngine.h
//  StudyProject
//
//  Created by BrotherWei on 15/4/8.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "MKNetworkEngine.h"

typedef void (^CompletionResponseBlock) (BOOL success , id userInfo , NSString *error);

@interface NetworkEngine : MKNetworkEngine

+ (NetworkEngine *)defaultEngine;

@end
