//
//  IntroViewController.m
//  KicksAdvisor
//
//  Created by Gai, Fabio on 18/04/15.
//  Copyright (c) 2015 Gai, Fabio. All rights reserved.
//

#import "IntroViewController.h"

#define PATTERN_IMAGE [UIImage imageNamed:@"intro-img"]

@interface IntroViewController ()

@end

@implementation IntroViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    //Creo il pattern
    UIColor *Pattern = [self createPatterFromImage:PATTERN_IMAGE];
    
    //Creo il layer, gli applico il pattern e lo "aggiugo" alla vista principale.
    CALayer *ImageLayer = [self createLayerWithPattern:Pattern];
    [self.view.layer addSublayer:ImageLayer];
    
    //Creo l'animazione orizzontale e la applico al layer appena creato
    CABasicAnimation *LayerAnimation = [self createLayerAnimation];
    [ImageLayer addAnimation:LayerAnimation forKey:@"position"];
    
    
    //Aggiungo la UIWindow
    [self addWindow];
    
    //creo l'effetto fade quando viene presentato il controller
    [self animateView];
    
}

#pragma mark utility methods

-(void)animateView{
    
    self.view.alpha = 0;
    topWindow.alpha = 0;
    [UIView animateWithDuration:1.5 animations:^(void){self.view.alpha = 1; topWindow.alpha=1;}];
    
}

-(void)addWindow{
    
    topWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    topWindow.rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Intro"];
    [topWindow setWindowLevel:UIWindowLevelAlert];
    [topWindow makeKeyAndVisible];
    
}


- (UIColor *)createPatterFromImage:(UIImage *)image{
    
    return [UIColor colorWithPatternImage:image];
}

- (CALayer *)createLayerWithPattern:(UIColor *)pattern {
    
    CALayer *tmpLayer = [CALayer layer];
    tmpLayer.backgroundColor = pattern.CGColor;
    tmpLayer.transform = CATransform3DMakeScale(1, -1, 1);
    tmpLayer.anchorPoint = CGPointMake(0, 1);
    CGSize viewSize = self.view.bounds.size;
    tmpLayer.frame = CGRectMake(0, 0, PATTERN_IMAGE.size.width + viewSize.width, viewSize.height);
    return tmpLayer;

}

- (CABasicAnimation *)createLayerAnimation {
    
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointMake(-PATTERN_IMAGE.size.width, 0);
    CABasicAnimation *Animation = [CABasicAnimation animationWithKeyPath:@"position"];
    Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    Animation.fromValue = [NSValue valueWithCGPoint:startPoint];
    Animation.toValue = [NSValue valueWithCGPoint:endPoint];
    Animation.repeatCount = HUGE_VALF;
    Animation.duration = 60.0;
    return Animation;
}



@end
