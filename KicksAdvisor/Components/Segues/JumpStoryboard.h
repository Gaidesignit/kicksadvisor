//
//  JumpStoryboard.h
//  KicksAdvisor
//
//  Created by Gai, Fabio on 18/04/15.
//  Copyright (c) 2015 Gai, Fabio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JumpStoryboard : UIStoryboardSegue
+ (UIViewController *)sceneNamed:(NSString *)identifier;
@end
