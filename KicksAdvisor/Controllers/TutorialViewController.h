//
//  TutorialViewController.h
//  KicksAdvisor
//
//  Created by Gai, Fabio on 18/04/15.
//  Copyright (c) 2015 Gai, Fabio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property NSArray *dataArray;
@end
