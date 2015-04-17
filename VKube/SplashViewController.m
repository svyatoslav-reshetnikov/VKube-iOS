//
//  ViewController.m
//  VKube
//
//  Created by SVYAT on 02.04.15.
//  Copyright (c) 2015 HiT2B. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self opacityAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)opacityAnimation {
    
    [CATransaction begin];
    
    //Create an animation with pulsating effect
    CABasicAnimation *opacityAnimation;
    
    //within the animation we will adjust the "opacity"
    //value of the layer
    opacityAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    //animation lasts 0.4 seconds
    opacityAnimation.duration=0.5;
    //and it repeats N counts
    opacityAnimation.repeatCount= 3;
    //we want a reverse animation
    opacityAnimation.autoreverses=YES;
    //justify the opacity as you like (1=fully visible, 0=unvisible)
    opacityAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue=[NSNumber numberWithFloat:0.2];
    
    //Assign the animation to your UIImage layer and the
    //animation will start immediately
    [self.logo.layer addAnimation:opacityAnimation forKey:@"animateOpacity"];
    
    [CATransaction setCompletionBlock:^{
        [self performSelector:@selector(logoToTopAnimation) withObject:nil afterDelay:3];
    }];
    
    [CATransaction commit];
}

- (void)logoToTopAnimation {
    
    [CATransaction begin];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 0.5;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    
    self.logo.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2 - 120);
    [self.logo.layer addAnimation:animation forKey:@"slide"];
    
    [CATransaction setCompletionBlock:^{
        [self performSelector:@selector(fadeInButtonsAndManAnimation) withObject:nil afterDelay:0.5];
    }];
    
    [CATransaction commit];
}

- (void) fadeInButtonsAndManAnimation {
    
    [CATransaction begin];
    
    //Create an animation with pulsating effect
    CABasicAnimation *opacityAnimation;
    
    //within the animation we will adjust the "opacity"
    //value of the layer
    opacityAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.removedOnCompletion = YES;
    //animation lasts 0.4 seconds
    opacityAnimation.duration=0.5;
    //justify the opacity as you like (1=fully visible, 0=unvisible)
    opacityAnimation.fromValue=[NSNumber numberWithFloat:0.0];
    opacityAnimation.toValue=[NSNumber numberWithFloat:1.0];
    
    self.man.alpha = 1.0;
    self.fbLogin.hidden = NO;
    self.vkLogin.hidden = NO;
    
    //Assign the animation to your UIImage layer and the
    //animation will start immediately
    [self.man.layer addAnimation:opacityAnimation forKey:@"animateOpacity"];
    [self.fbLogin.layer addAnimation:opacityAnimation forKey:@"animateOpacity"];
    [self.vkLogin.layer addAnimation:opacityAnimation forKey:@"animateOpacity"];
    
    [CATransaction setCompletionBlock:^{
        //[self logoToTopAnimation];
    }];
    
    [CATransaction commit];
}

@end
