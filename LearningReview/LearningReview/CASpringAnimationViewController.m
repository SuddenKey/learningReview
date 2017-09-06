//
//  CASpringAnimationViewController.m
//  LearningReview
//
//  Created by haohao on 2017/9/5.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import "CASpringAnimationViewController.h"

@interface CASpringAnimationViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UIView *blueLabel;
@property (weak, nonatomic) IBOutlet UIView *skyBlueLabel;

@end

@implementation CASpringAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)buttonClick:(id)sender {
    [self setCASpringAnimation];
}

- (void)setCASpringAnimation {
    CASpringAnimation *spring = [CASpringAnimation animationWithKeyPath:@"bounds"];
    spring.delegate = self;
    
    spring.mass = 10.0;
    spring.stiffness = 5000;
    spring.damping = 100.0;
    spring.initialVelocity = 5.0f;
    spring.duration = spring.settlingDuration;
    spring.toValue = [NSValue valueWithCGRect:self.titleImage.bounds];
    spring.removedOnCompletion = NO;
    spring.fillMode = kCAFillModeForwards;
    spring.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.blueLabel.layer addAnimation:spring forKey:@"spring"];
}
#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}

@end
