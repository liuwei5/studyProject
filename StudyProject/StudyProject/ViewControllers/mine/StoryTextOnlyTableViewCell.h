//
//  StoryTextOnlyTableViewCell.h
//  StudyProject
//
//  Created by BrotherWei on 15/8/17.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryTextOnlyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

- (void)setLabelText:(NSString *)string;

@end
