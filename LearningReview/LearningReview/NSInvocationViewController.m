//
//  NSInvocationViewController.m
//  LearningReview
//
//  Created by 万浩 on 2018/11/27.
//  Copyright © 2018 haohao. All rights reserved.
//

#import "NSInvocationViewController.h"
#import "InvoPeople.h"
@interface NSInvocationViewController ()

@end

@implementation NSInvocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self perExample];
    [self invocationExample];
}

- (void)perExample {
    InvoPeople *peo = [[InvoPeople alloc] init];
    //performSelector withObject 调用方法实在运行时才进行判断的
    if ([peo respondsToSelector:@selector(messageSend:)]) {
        [peo performSelector:@selector(messageSend:) withObject:@"222"];
    }
    //建立动态函数并调用
    NSArray *objectArray = @[@{@"methodName":@"DynamicParameterString:",@"value":@"String"},@{@"methodName":@"DynamicParameterNumber:",@"value":@2}, @{@"methodName":@"messageSend:",@"value":@"messageSend:"}];
    for (NSDictionary *dic in objectArray) {
        if ([peo respondsToSelector:NSSelectorFromString([dic objectForKey:@"methodName"])]) {
            [peo performSelector:NSSelectorFromString([dic objectForKey:@"methodName"]) withObject:[dic objectForKey:@"value"]];
        }
    }
}


- (void)invocationExample {
    InvoPeople *peo = [[InvoPeople alloc] init];
    //NSInvocation
    NSMethodSignature *sign = [[peo class] instanceMethodSignatureForSelector:@selector(invoMessageSend:two:three:four:)];
    if (sign == nil) {
        return;
    }
    NSInvocation *invo = [NSInvocation invocationWithMethodSignature:sign];
    invo.target = peo;
    invo.selector = @selector(invoMessageSend:two:three:four:);
    NSString *message = @"message";
    NSString *two = @"two";
    NSString *three = @"three";
    NSInteger a = 4;
    [invo setArgument:&message atIndex:2];
    [invo setArgument:&two atIndex:3];
    
    [invo setArgument:&a atIndex:5];
    
    [invo invoke];
    
}

@end
