//
//  SwizzMethondViewController.m
//  LearningReview
//
//  Created by 万浩 on 2018/12/14.
//  Copyright © 2018 haohao. All rights reserved.
//

#import "SwizzMethondViewController.h"
#import "Methond_people.h"
@interface SwizzMethondViewController ()

@end

@implementation SwizzMethondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Methond_people *prople = [[Methond_people alloc] init];
    [prople performSelector:@selector(next)];
}




@end
