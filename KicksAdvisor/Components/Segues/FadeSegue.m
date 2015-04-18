//
//  FadeSegue.m
//  KicksAdvisor
//
//  Created by Gai, Fabio on 18/04/15.
//  Copyright (c) 2015 Gai, Fabio. All rights reserved.
//

#import "FadeSegue.h"

@implementation FadeSegue
- (void) perform
{
    CATransition* transition = [CATransition animation];
    
    transition.duration = 1.3;
    transition.type = kCATransitionFade;
    
    [[self.sourceViewController navigationController].view.layer addAnimation:transition forKey:kCATransition];
    [[self.sourceViewController navigationController] pushViewController:[self destinationViewController] animated:NO];
}
@end
