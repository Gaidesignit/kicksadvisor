//
//  RightSegue.m
//  KicksAdvisor
//
//  Created by Gai, Fabio on 18/04/15.
//  Copyright (c) 2015 Gai, Fabio. All rights reserved.
//

#import "RightSegue.h"

@implementation RightSegue
- (void) perform
{
    CGRect windowFrame = [UIScreen mainScreen].bounds;
    
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    [sourceViewController.view addSubview:destinationViewController.view];
   
    destinationViewController.view.frame =CGRectMake(windowFrame.size.width, 0, windowFrame.size.width, windowFrame.size.height);
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{

                         sourceViewController.view.frame =CGRectMake(-windowFrame.size.width, 0, windowFrame.size.width, windowFrame.size.height);
                     }
                     completion:^(BOOL finished){

                         [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL];
                     }];
}
@end
