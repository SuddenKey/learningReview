//
//  RunloopViewController.m
//  LearningReview
//
//  Created by 万浩 on 2018/12/3.
//  Copyright © 2018 haohao. All rights reserved.
//

#import "RunloopViewController.h"

#import <Foundation/Foundation.h>


@interface RunloopViewController ()

@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setRunloop];
}

- (void)setRunloop {
    //获取当前runloop对象
//    NSLog(@"currentRunLoop === %@", [NSRunLoop currentRunLoop]);
//    NSLog(@"mainRunLoop === %@", [NSRunLoop mainRunLoop]);
    NSRunLoop *mainloop = [NSRunLoop currentRunLoop];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"点击了屏幕");
}

@end
