//
//  StoryTextOnlyTableViewCell.m
//  StudyProject
//
//  Created by BrotherWei on 15/8/17.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "StoryTextOnlyTableViewCell.h"

@implementation StoryTextOnlyTableViewCell
@synthesize textLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setLabelText:(NSString *)string
{
    textLabel.text = string;
}

@end