//
//  CAKeyframeAnimationViewController.m
//  LearningReview
//
//  Created by haohao on 2017/9/5.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import "CAKeyframeAnimationViewController.h"

@interface CAKeyframeAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *purpleLabel;
@property (weak, nonatomic) IBOutlet UIView *blueLabel;
@property (weak, nonatomic) IBOutlet UIView *skyBlueLabel;

@end

@implementation CAKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)cliclkBtn:(id)sender {
//    [self setCAKeyframeAnimation];
    [self runWithround];
}
//直线移动
- (void)setCAKeyframeAnimation {
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    ani.duration = 4.0;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(self.purpleLabel.center.x + 50, self.purpleLabel.center.y)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(self.purpleLabel.center.x + 50, self.purpleLabel.center.y + 50)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(self.purpleLabel.center.x - 100, self.purpleLabel.center.y + 50)];
    
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(self.purpleLabel.center.x, self.purpleLabel.center.y + 50)];
    NSValue *v5 = [NSValue valueWithCGPoint:CGPointMake(self.purpleLabel.center.x , self.purpleLabel.center.y)];
    ani.values = @[v1, v2, v3, v4, v5];
    [self.purpleLabel.layer addAnimation:ani forKey:@"CAKeyframeAnimation"];
}
//圆形移动
- (void)runWithround {
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(130, 200, 100, 100));
    ani.path = path;
    CGPathRelease(path);
    ani.duration = 4.0;
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    [self.purpleLabel.layer addAnimation:ani forKey:@"PostionKeyframePathAni"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
