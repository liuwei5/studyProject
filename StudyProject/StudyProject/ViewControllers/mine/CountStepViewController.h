//
//  CountStepViewController.h
//  StudyProject
//
//  Created by BrotherWei on 15/1/1.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface CountStepViewController : UIViewController

@property (nonatomic , strong) CMPedometer *stepCounter;

@end
