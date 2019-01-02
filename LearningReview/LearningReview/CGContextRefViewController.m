//
//  CGContextRefViewController.m
//  LearningReview
//
//  Created by 万浩 on 2018/11/28.
//  Copyright © 2018 haohao. All rights reserved.
//

#import "CGContextRefViewController.h"
#import "CGContextView.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

#import "Struct.h"
@interface CGContextRefViewController ()

@end

@implementation CGContextRefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubView];
}

- (void)setupSubView{
    CGContextView *tttttview = [[CGContextView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 64)];
    [self.view addSubview:tttttview];
    
    NSLog(@"%zd",class_getInstanceSize([UIImage class]));
    NSLog(@"%zd",malloc_size((__bridge const void *)tttttview));
    
    Struct *s= [[Struct alloc] init];
    NSLog(@"%zd",class_getInstanceSize([Struct class]));
    NSLog(@"%zd",malloc_size((__bridge const void *)s));
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

@end
