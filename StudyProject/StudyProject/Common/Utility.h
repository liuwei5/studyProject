//
//  Utility.h
//  StudyProject
//
//  Created by BrotherWei on 15/1/1.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BDKNotifyHUD.h"

@interface Utility : NSObject

//16进制颜色(html颜色值)字符串转为UIColor
+ (UIColor *) hexStringToColor: (NSString *) stringToConvert;

//绘制一条间隔为space的虚线，以image返回
+ (UIImage *)drawBrokenLine:(CGRect)rect brokenSpace:(CGFloat)space color:(UIColor *)color;

//创建默认cell
+ (UITableViewCell *)createDefaultTableCell:(UITableView *)tableView cellId:(NSString *)cellId;

//修改frame大小
+ (CGRect)changeViewFrameHeight:(CGRect)rectBefore newHeight:(CGFloat)newHeight;
+ (CGRect)changeViewFrameWidth:(CGRect)rectBefore newWidth:(CGFloat)newWidth;

+ (void)showLikeAlertViewAnimationViewToMainWindow:(UIView *)showView;

//设置text段间距和行间距. eg:Label.attributedText = [CXNewYearUtility setTextAttributedStringWithText:Label.text textHeightGap:4] ; [Label sizeToFit];
+ (NSMutableAttributedString *)setTextAttributedStringWithText:(NSString *)contentStr textHeightGap:(CGFloat)gapHeight;

//随机颜色
+ (UIColor *) randomColor;

//显示友好提示
+ (void)showBDKNotifyHUD:(NSString *)messageStr inView:(UIView *)showView;
+ (void)showBDKNotifyHUD:(NSString *)messageStr;

@end
