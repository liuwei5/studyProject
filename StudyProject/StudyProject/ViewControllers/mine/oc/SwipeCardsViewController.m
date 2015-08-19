//
//  SwipeCardsViewController.m
//  StudyProject
//
//  Created by BrotherWei on 15/2/10.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "SwipeCardsViewController.h"

@interface SwipeCardsViewController ()

@end

@implementation SwipeCardsViewController
@synthesize zlsSwipeableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBaseUiPropertiesForView];
}

- (void)setupBaseUiPropertiesForView
{
    self.title = @"卡贴";
    
    UIBarButtonItem *btnNavBack = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickNavBackBtn)];
    btnNavBack.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = btnNavBack;

    zlsSwipeableView.delegate = self;
    zlsSwipeableView.dataSource = self;
}

- (void)clickNavBackBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addSwipeView
{
    
}

/**********
 代码控制切换：
 /// Discard all swipeable views on the screen.
 - (void)discardAllSwipeableViews;
 
 /// Load up to 3 swipeable views.
 - (void)loadNextSwipeableViewsIfNeeded;
 
 /// Swipe top view to the left programmatically
 - (void)swipeTopViewToLeft;
 
 /// Swipe top view to the right programmatically
 - (void)swipeTopViewToRight;
 
 /// Swipe top view to the up programmatically
 - (void)swipeTopViewToUp;
 
 /// Swipe top view to the down programmatically
 - (void)swipeTopViewToDown;
 */

#pragma mark - ZLSwipeableViewDelegate
- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeView:(UIView *)view
          inDirection:(ZLSwipeableViewDirection)direction {
    //NSLog(@"did swipe in direction: %zd", direction);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
       didCancelSwipe:(UIView *)view {
    //NSLog(@"did cancel swipe");
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
  didStartSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
    //NSLog(@"did start swiping at location: x %f, y %f", location.x, location.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
          swipingView:(UIView *)view
           atLocation:(CGPoint)location
          translation:(CGPoint)translation {
 // NSLog(@"swiping at location: x %f, y %f, translation: x %f, y %f",location.x, location.y, translation.x, translation.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
    didEndSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
 //   NSLog(@"did end swiping at location: x %f, y %f", location.x, location.y);
}

#pragma mark - ZLSwipeableViewDataSource
- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView
{
    UIView *cardView = [[UIView alloc] initWithFrame:swipeableView.frame];
    
    cardView.backgroundColor = [Utility randomColor];
    cardView.layer.shadowColor = [UIColor blackColor].CGColor;
    cardView.layer.shadowOpacity = 0.33;
    cardView.layer.shadowOffset = CGSizeMake(0, 1.5);
    cardView.layer.shadowRadius = 4.0;
    cardView.layer.shouldRasterize = YES;
    cardView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    cardView.layer.cornerRadius = 10.0;
    
    return cardView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
