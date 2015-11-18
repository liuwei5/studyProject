//
//  MyViewController.m
//  StudyProject
//
//  Created by BrotherWei on 14/12/29.
//  Copyright (c) 2014年 paDev. All rights reserved.
//

#import "MyViewController.h"
#import "CountStepViewController.h"
#import "CollectionViewController.h"
#import "SwipeCardsViewController.h"
#import "InterestingAnimViewController.h"
#import "AutoLayloutViewController.h"
#import "SwaipViewController.h"
#import "StoryBoardViewController.h"
#import "MasonryViewController.h"
#import "StudyProject-swift.h"

@interface MyViewController ()

@end

@implementation MyViewController
@synthesize tableViewOfMine;
@synthesize arrData;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    [self setupBaseDataPropertiesForView];
    [self setupBaseUiPropertiesForView];
}

- (void)setupBaseDataPropertiesForView
{
    arrData = [[NSMutableArray alloc] initWithCapacity:5];
    [arrData addObjectsFromArray:[NSArray arrayWithObjects:@"计步器",@"CollectionView",@"卡片随意拨",@"发呆动画",@"自动布局",@"push侧滑",@"storyBoard",@"Masonry", @"MainSwift", nil]];
}

- (void)setupBaseUiPropertiesForView
{
    self.title = @"我";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - public

-(void)clickCellName:(SuccessBlock)block clickCellName:(NSString *)str
{
    block(str);
}

#pragma mark - UIGestureRecognizer Delegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
   if(self.navigationController.viewControllers.count == 0)
   {
       return NO;
   }
   else
   {
       return YES;
   }
}

#pragma mark ---------------------------------   tableView delegate  ------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableCellIdentifierId = @"MyViewTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableCellIdentifierId];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableCellIdentifierId];
    }
    
    cell.textLabel.text = [arrData objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *titleStr = cell.textLabel.text;
    
    DDLogInfo(@"DDLogInfo     %@" , titleStr);
    DDLogDebug(@"DDLogDebug     %@" , titleStr);
    DDLogWarn(@"DDLogWarn     %@" , titleStr);
    DDLogError(@"DDLogError     %@" , titleStr);
    DDLogVerbose(@"DDLogVerbose     %@" , titleStr);
    
    [self clickCellName:^(NSString *result) {
        NSLog(@"点击了 :%@  cell" , result);
    } clickCellName:titleStr];
    
    if([titleStr isEqualToString:@"计步器"])
    {
        CountStepViewController *stepVC = [[CountStepViewController alloc] init];
        [self.navigationController pushViewController:stepVC animated:YES];
    }
    else if ([titleStr isEqualToString:@"CollectionView"])
    {
        CollectionViewController *collVC = [[CollectionViewController alloc] init];
        [self.navigationController pushViewController:collVC animated:YES];
    }
    else if ([titleStr isEqualToString:@"卡片随意拨"])
    {
        SwipeCardsViewController *swipeCardVC = [[SwipeCardsViewController alloc] init];
        [self.navigationController pushViewController:swipeCardVC animated:YES];
    }
    else if ([titleStr isEqualToString:@"发呆动画"])
    {
        InterestingAnimViewController *faDaiVC = [[InterestingAnimViewController alloc] init];
        [self.navigationController pushViewController:faDaiVC animated:YES];
    }
    else if ([titleStr isEqualToString:@"自动布局"])
    {
        AutoLayloutViewController *AutoLayoutVC = [[AutoLayloutViewController alloc] init];
        [self.navigationController pushViewController:AutoLayoutVC animated:YES];
    }
    else if ([titleStr isEqualToString:@"push侧滑"])
    {
        SwaipViewController *pushVC = [[SwaipViewController alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
    }
    else if ([titleStr isEqualToString:@"storyBoard"])
    {
        StoryBoardViewController *sbVC = [[UIStoryboard storyboardWithName:@"StoryBoardViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"storyBoardViewController"];
        [self.navigationController pushViewController:sbVC animated:YES];
    }
    else if ([titleStr isEqualToString:@"Masonry"])
    {
        MasonryViewController *masonryVC = [[MasonryViewController alloc] init];
        [self.navigationController pushViewController:masonryVC animated:YES];
    }
    else if ([titleStr isEqualToString:@"MainSwift"])
    {
        MainSwift *mainSwift = [[MainSwift alloc] init];
        [self.navigationController pushViewController:mainSwift animated:YES];
    }
}

@end
