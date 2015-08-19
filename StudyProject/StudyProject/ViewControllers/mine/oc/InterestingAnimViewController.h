//
//  InterestingAnimViewController.h
//  StudyProject
//
//  Created by BrotherWei on 15/2/11.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WovenStar.h"

@interface InterestingAnimViewController : UIViewController
{
    WovenStar *ws;
}

@property (nonatomic , weak) IBOutlet UISwitch *liveSwitch;
@property (nonatomic , weak) IBOutlet UISlider *durationSlider;
@property (nonatomic , weak) IBOutlet UISlider *eleWidthSilder;
@property (nonatomic , weak) IBOutlet UISlider *eleLengthSilder;

@end
