//
//  UIViewCoreAnimationViewController.m
//  LearningReview
//
//  Created by haohao on 2017/9/6.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import "UIViewCoreAnimationViewController.h"

@interface UIViewCoreAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *purpleLabel;

@property (weak, nonatomic) IBOutlet UIView *blueLabel;
@property (weak, nonatomic) IBOutlet UIView *skyBlueLabel;

@end

@implementation UIViewCoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(blockChangeView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)blockChangeView {
    [UIView transitionFromView:self.view toView:self.view duration:2.0 options:UIViewAnimationOptionTransitionFlipFromLeft  completion:^(BOOL finished) {
        self.view.backgroundColor = [UIColor redColor];
    }];
}

- (IBAction)clickBtn:(id)sender {
    [self setUIViewCoreAnimation];
}

- (void)setUIViewCoreAnimation {
    [UIView beginAnimations:@"frame" context:nil];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    self.blueLabel.frame = self.purpleLabel.frame;
    [UIView commitAnimations];
}

//转场动画
- (void)blockAnimation {
    //从就是图转到新视图的动画效果
//    [UIView transitionFromView:<#(nonnull UIView *)#> toView:<#(nonnull UIView *)#> duration:<#(NSTimeInterval)#> options:(UIViewAnimationOptions) completion:^(BOOL finished) {
//        
//    }]
    //单个视图的过度效果
//    [UIView transitionWithView:<#(nonnull UIView *)#> duration:<#(NSTimeInterval)#> options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:^(BOOL finished) {
//        
//    }]
    //
}

@end
