//
//  WovenStar.h
//  WovenStar
//
//  Created by Sandy Lee on 10/16/14.
//  Copyright (c) 2014 iaomw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WovenStar : UIView

@property (getter=isPaused, nonatomic) BOOL paused;

@property (assign, nonatomic) CGFloat duration;

@property (assign, nonatomic) CGFloat eleLength;
@property (assign, nonatomic) CGFloat eleWidth;

@property (assign, nonatomic) BOOL debug;

- (void)setForeColor:(UIColor *)foreColor andBackColor:(UIColor*)backColor;

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
