//
//  Utility.m
//  StudyProject
//
//  Created by BrotherWei on 15/1/1.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+(UIColor *) hexStringToColor: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+ (UIImage *)drawBrokenLine:(CGRect)rect brokenSpace:(CGFloat)space color:(UIColor *)color
{
    UIImage *image = [[UIImage alloc] init];
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapButt);
    
    CGFloat lengths[] = {2 * space , space};
    CGContextRef line = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(line, color.CGColor);
    
    CGContextSetLineDash(line, 0, lengths, 2);
    CGContextMoveToPoint(line, 0.0, 0.0);
    CGContextAddLineToPoint(line, rect.size.width, rect.size.height);
    CGContextStrokePath(line);
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    return image;
}

+ (UITableViewCell *)createDefaultTableCell:(UITableView *)tableView cellId:(NSString *)cellId
{
    if(cellId == nil)
        return nil;
    
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.backgroundColor = [UIColor clearColor];
    
    if([cell.contentView.subviews count] != 0)
    {
        for(id temp in [cell.contentView subviews])
        {
            [temp removeFromSuperview];
        }
    }
    return cell;
}

+ (CGRect)changeViewFrameHeight:(CGRect)rectBefore newHeight:(CGFloat)newHeight
{
    CGRect newRect = rectBefore;
    newRect.size.height = newHeight;
    return  newRect;
}

+ (CGRect)changeViewFrameWidth:(CGRect)rectBefore newWidth:(CGFloat)newWidth
{
    CGRect newRect = rectBefore;
    newRect.size.width = newWidth;
    return  newRect;
}

+ (void)showLikeAlertViewAnimationViewToMainWindow:(UIView *)showView
{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"alertTransform"];
    animation.duration = 1.0;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    //[values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    //[values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [showView.layer addAnimation:animation forKey:nil];
    [[[UIApplication sharedApplication].delegate window] addSubview:showView];
}

+ (NSMutableAttributedString *)setTextAttributedStringWithText:(NSString *)contentStr textHeightGap:(CGFloat)gapHeight
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:contentStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:gapHeight];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [contentStr length])];
    return attributedString;
}

+ (UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

+ (void)showBDKNotifyHUD:(NSString *)messageStr inView:(UIView *)showView;
{
    BDKNotifyHUD *hud = [BDKNotifyHUD notifyHUDWithImage:nil text:messageStr];
    hud.center = CGPointMake(showView.center.x, showView.center.y);
    [showView addSubview:hud];
    [hud presentWithDuration:1.0f speed:0.5f inView:showView completion:^{
        [hud removeFromSuperview];
    }];
}

+ (void)showBDKNotifyHUD:(NSString *)messageStr
{
    UIView *view = [[UIApplication sharedApplication].delegate window];
    
    BDKNotifyHUD *hud = [BDKNotifyHUD notifyHUDWithImage:nil text:messageStr];
    hud.center = CGPointMake(view.center.x, view.center.y);
    [view addSubview:hud];
    [hud presentWithDuration:1.0f speed:0.5f inView:view completion:^{
        [hud removeFromSuperview];
    }];
}

+ (CGFloat)getTextHeightWithText:(NSString *)text width:(CGFloat)width font:(CGFloat)fontsize
{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontsize] forKey:NSFontAttributeName] context:nil];
    
    return rect.size.height;
#else
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontsize] constrainedToSize:CGSizeMake(width, 10000)];
    return size.height;
#endif
    
}

@end
