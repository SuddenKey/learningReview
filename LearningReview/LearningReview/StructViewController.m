//
//  StructViewController.m
//  LearningReview
//
//  Created by 万浩 on 2018/11/29.
//  Copyright © 2018 haohao. All rights reserved.
//

#import "StructViewController.h"
#import "Struct.h"

typedef struct {
    NSInteger a;
    NSArray *aaaaadata;
    Struct *st;
} atype;

@interface StructViewController ()

@end

@implementation StructViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Struct *a = [[Struct alloc] init];
    atype c;
    c.a = 20;
    c.aaaaadata = @[@1, @2];
    c.st = [[Struct alloc] init];
}

@end
