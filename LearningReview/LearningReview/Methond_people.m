//
//  Methond_people.m
//  LearningReview
//
//  Created by 万浩 on 2018/12/14.
//  Copyright © 2018 haohao. All rights reserved.
//

#import "Methond_people.h"

#import <objc/runtime.h>


@implementation Methond_people

void next (id self, SEL _cmd) {
    NSLog(@"get a new select");
}

//类方法调用
+ (BOOL) resolveClassMethod:(SEL)sel {
    NSLog(@"sel ==== %@", NSStringFromSelector(sel));
    return [super resolveClassMethod:sel];
}

#pragma mark - 对象方法
//1,查询手否有新增的方法
+ (BOOL) resolveInstanceMethod:(SEL)sel {
    NSLog(@"sel ==== %@", NSStringFromSelector(sel));
//    //动态添加新方法
//    if (sel == @selector(next)) {
//        class_addMethod([self class], sel, (IMP)next, "v@:");
//    }
    return [super resolveInstanceMethod:sel];
}
//2,查询是否可以处理的对象
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%@", NSStringFromSelector(aSelector));
    
    return [super forwardingTargetForSelector:aSelector];
}

//3,
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
}

//4,最后的cash处理
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"%@", NSStringFromSelector(aSelector));
}



@end
