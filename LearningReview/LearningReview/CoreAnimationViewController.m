//
//  CoreAnimationViewController.m
//  LearningReview
//
//  Created by haohao on 2017/9/5.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import "CoreAnimationViewController.h"

@interface CoreAnimationViewController ()<CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIView *purpleLabel;
@property (weak, nonatomic) IBOutlet UIView *blueLabel;
@property (weak, nonatomic) IBOutlet UIView *skyblueLabel;

@property (nonatomic, strong) CALayer *layer;

@end

@implementation CoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clickBtn:(id)sender {
    [self changePosition];
}

- (void)changePosition {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"opacity"];
    ani.delegate = self;
    ani.toValue = [NSValue valueWithCGPoint:_purpleLabel.center];
//    ani.byValue = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
//    ani.fromValue = [NSValue valueWithCGPoint:_skyblueLabel.center];
    ani.duration = 10;
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//动画节奏
    [self.blueLabel.layer addAnimation:ani forKey:@"PostionAni"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}


@end
