//
//  MansoryViewController.m
//  StudyProject
//
//  Created by BrotherWei on 15/8/19.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "MasonryViewController.h"

@interface MasonryViewController ()

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self useMarsonAutoLayout];
    
    [self useMarsonAutoLayoutMiddle];
    
    //[self useMarsonAutoLayoutHighier];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)useMarsonAutoLayout
{
    WeakSelf(selView);
    
    UIView *firstView = [UIView new];
    firstView.backgroundColor = [UIColor redColor];
    [self.view addSubview:firstView];
    
    UIView *secondView = [UIView new];
    secondView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:secondView];
    
    UIView *tirdView = [UIView new];
    tirdView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:tirdView];
    
    UIView *fourthView = [UIView new];
    fourthView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:fourthView];
    
    UIView *fifthView = [UIView new];
    fifthView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:fifthView];
    
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(selView.view);
        make.size.mas_equalTo(CGSizeMake(300, 200));
    }];
    
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(firstView.center.y);
        make.centerX.mas_equalTo(firstView.center.x);
        make.size.mas_equalTo(CGSizeMake(250, 20));
    }];
    
    [tirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(secondView).with.insets(UIEdgeInsetsMake(2, 2, 2, 2));
    }];
    
    [fourthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(firstView.center.y);
        make.right.mas_equalTo(fifthView.mas_left).with.offset(-20);
        make.left.mas_equalTo(firstView.mas_left).with.offset(20);
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(fifthView);
    }];
    
    [fifthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(firstView.center.y);
        make.left.mas_equalTo(fourthView.mas_right);
        make.right.mas_equalTo(firstView.mas_right).with.offset(-20);
        make.height.mas_equalTo(fourthView.mas_height);
        make.width.mas_equalTo(fourthView);
    }];
}

- (void)useMarsonAutoLayoutMiddle
{
    WeakSelf(selView);
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    scrollView.pagingEnabled = NO;
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(selView.view).with.insets(UIEdgeInsetsMake(50, 10, 90, 10));
    }];
    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView.mas_width);
    }];
    
    UIView *tmpView = nil;
    
    for(NSInteger i = 0 ; i <= 10 ; i++)
    {
        UIView *vi = [UIView new];
        vi.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                        saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                        brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                             alpha:1];
        [container addSubview:vi];
        
        [vi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(container.mas_centerX);
            make.height.mas_equalTo(55 + arc4random() % 50);
            make.width.mas_equalTo(container.mas_width);
            if(tmpView)
                make.top.mas_equalTo(tmpView.mas_bottom).offset(10);
            else
                make.top.mas_equalTo(container.mas_top);
        }];
        
        tmpView = vi;
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(tmpView.mas_bottom);
    }];
}

- (void)useMarsonAutoLayoutHighier
{
    __weak __typeof(self)selView = self;
    
    UIView *firView = [UIView new];
    firView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:firView];
    [firView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(selView.view).with.insets(UIEdgeInsetsMake(50, 10, 90, 10));
    }];
    
    
}

@end
