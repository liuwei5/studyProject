//
//  StoryBoardViewController.m
//  StudyProject
//
//  Created by BrotherWei on 15/6/2.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "StoryBoardViewController.h"
#import "StoryTextOnlyTableViewCell.h"

@interface StoryBoardViewController ()<UITableViewDataSource , UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *storyTableView;

@end

@implementation StoryBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.storyTableView.delegate = self;
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

#pragma mark UITableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoryTextOnlyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoryTextOnlyTableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第第第第第第第第第第第第第第第第第第第第第第第第第第第第%i行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行" , indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}

@end
