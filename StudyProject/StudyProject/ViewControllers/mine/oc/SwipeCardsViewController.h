//
//  SwipeCardsViewController.h
//  StudyProject
//
//  Created by BrotherWei on 15/2/10.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLSwipeableView.h"

@interface SwipeCardsViewController : UIViewController<ZLSwipeableViewDataSource , ZLSwipeableViewDelegate>

@property (nonatomic , weak) IBOutlet ZLSwipeableView *zlsSwipeableView;

@end
