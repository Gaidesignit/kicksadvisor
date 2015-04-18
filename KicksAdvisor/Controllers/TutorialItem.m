//
//  TutorialItem.m
//  KicksAdvisor
//
//  Created by Gai, Fabio on 18/04/15.
//  Copyright (c) 2015 Gai, Fabio. All rights reserved.
//

#import "TutorialItem.h"
#import "UICollectionViewCell+Content.h"

@implementation TutorialItem

- (void)awakeFromNib {
    // Initialization code
}

-(void)setContent:(id)content{
    
    [self.imageView setImage:[UIImage imageNamed:(NSString *)content]];
    [self.imageView setClipsToBounds:YES];
}

@end
