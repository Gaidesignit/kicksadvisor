//
//  TutorialViewController.m
//  KicksAdvisor
//
//  Created by Gai, Fabio on 18/04/15.
//  Copyright (c) 2015 Gai, Fabio. All rights reserved.
//

#import "TutorialViewController.h"
#import "TutorialItem.h"
#import "Database.h"
#import "UICollectionViewCell+Content.h"

#define CELLID @"TutorialCell"

@interface TutorialViewController ()

@end

@implementation TutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    self.dataArray = [Database getTutorialArray];
    [self setupCollectionView];
}

-(void)setupCollectionView {
    
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    [self.collectionView setPagingEnabled:YES];
    [self.collectionView setCollectionViewLayout:flowLayout];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.containerView setClipsToBounds:YES];
    [self.containerView.layer setCornerRadius:4.0];
    
    // Init Page Control
    self.pageControl.numberOfPages = [self.dataArray count];
    self.pageControl.currentPage = 0;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.dataArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TutorialItem *item= (TutorialItem *)[collectionView dequeueReusableCellWithReuseIdentifier:CELLID forIndexPath:indexPath];
    [item setContent:self.dataArray[indexPath.row]];
    self.pageControl.currentPage = indexPath.row;
    return item;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.frame.size;
}


@end
