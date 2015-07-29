//
//  CollectionViewController.h
//  StudyProject
//
//  Created by BrotherWei on 15/1/4.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout>

@property (nonatomic , weak) IBOutlet UICollectionView *colectionView;

@end
