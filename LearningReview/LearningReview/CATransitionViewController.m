//
//  CATransitionViewController.m
//  LearningReview
//
//  Created by haohao on 2017/9/5.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import "CATransitionViewController.h"

@interface CATransitionViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *purpleImage;

@property (weak, nonatomic) IBOutlet UIView *blueLabel;

@property (weak, nonatomic) IBOutlet UIView *skyBlueLabel;
@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)clickBtn:(id)sender {
    [self setCATransition];
}

- (void)setCATransition {
    CATransition *cat = [CATransition animation];
    cat.type = kCATransitionFade;
    cat.subtype = kCATransitionFromLeft;
    cat.duration = 5;
    self.purpleImage.image = [UIImage imageNamed:@"watermark"];
    [self.purpleImage.layer addAnimation:cat forKey:@"setCATransition"];
}

@end
