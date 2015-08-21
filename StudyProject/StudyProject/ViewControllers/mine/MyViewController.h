//
//  MyViewController.h
//  StudyProject
//
//  Created by BrotherWei on 14/12/29.
//  Copyright (c) 2014年 paDev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SuccessBlock) (NSString *result);

@interface MyViewController : UIViewController<UITableViewDataSource , UITableViewDelegate , UIGestureRecognizerDelegate>

@property (nonatomic , weak) IBOutlet UITableView *tableViewOfMine;

@property (nonatomic , strong) NSMutableArray *arrData;

@end
