//
//  AutoLayloutViewController.h
//  StudyProject
//
//  Created by BrotherWei on 15/3/3.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AutoLayloutViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locManager;
}

@property (weak, nonatomic) IBOutlet UILabel *autoLabel;

@end
