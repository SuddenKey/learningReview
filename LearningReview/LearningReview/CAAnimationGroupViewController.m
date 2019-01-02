//
//  CAAnimationGroupViewController.m
//  LearningReview
//
//  Created by haohao on 2017/9/6.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import "CAAnimationGroupViewController.h"

@interface CAAnimationGroupViewController () {
    NSLock *lock;
}
@property (weak, nonatomic) IBOutlet UIImageView *titleImageVI;
@property (weak, nonatomic) IBOutlet UIView *blueLabel;
@property (weak, nonatomic) IBOutlet UIView *skyBlue;

@end

@implementation CAAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clickBtn:(id)sender {
    CABasicAnimation * posAni = [CABasicAnimation animationWithKeyPath:@"position"];
    posAni.toValue = [NSValue valueWithCGPoint:self.titleImageVI.center];
    
    CABasicAnimation * opcAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opcAni.toValue = [NSNumber numberWithFloat:1.0];
    opcAni.toValue = [NSNumber numberWithFloat:0.7];
    
    CABasicAnimation * bodAni = [CABasicAnimation animationWithKeyPath:@"bounds"];
    bodAni.toValue = [NSValue valueWithCGRect:self.titleImageVI.bounds];
    
    CAAnimationGroup * groupAni = [CAAnimationGroup animation];
    groupAni.animations = @[posAni, opcAni, bodAni]; groupAni.duration = 1.0;
    groupAni.fillMode = kCAFillModeForwards; groupAni.removedOnCompletion = NO;
    groupAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.blueLabel.layer addAnimation:groupAni forKey:@"groupAni"];
}

- (void)setGroupAnimation {
    [lock lock];
    
    
    [lock unlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
