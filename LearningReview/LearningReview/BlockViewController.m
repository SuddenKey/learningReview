//
//  BlockViewController.m
//  LearningReview
//
//  Created by 万浩 on 2018/11/27.
//  Copyright © 2018 haohao. All rights reserved.
//

#import "BlockViewController.h"
#import "BlockNSObject.h"


struct __main_block_desc_0 {
    size_t reserved;
    size_t block_size;
};

struct __block_impl {
    void *isa;
    int Flag;
    int Reserved;
    void *FuncPtr;
};

struct __main_block_impl_0 {
    struct __block_impl _impl;
    struct __main_block_desc_0 *_main;
    NSString *str;
};

typedef void (^Block)(void);
Block myblock()
{
    int a = 10;
    // 上文提到过，block中访问了auto变量，此时block类型应为__NSStackBlock__
    Block block = ^{
        NSLog(@"---------%d", a);
    };
    return block;
}

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self blockStrong];
}

- (void)blockType {
    auto int a = 1;
    static int b = 2;
    void (^testBlock) (NSString * str) = ^(NSString * str){
        NSLog(@"%@---%d---%ld", str, a, b);
    };
    NSLog(@"%@", [testBlock class]);
    NSLog(@"%@", [[testBlock class] superclass]);
    NSLog(@"%@", [[[testBlock class] superclass] superclass]);
    NSLog(@"%@", [[[[testBlock class] superclass] superclass] superclass]);
    
    a = 3;
    b = 4;
    
    struct __main_block_impl_0 *imp = (__bridge struct __main_block_impl_0 *)testBlock;
    
    testBlock(@"3333");
    
    
    //    BlockNSObject *obj = [[BlockNSObject alloc] init];
    //    NSInteger Aobject = 1000;
    //    NSArray *arr = @[@"a", @"b"];
    //    NSArray *barr;
    //    NSMutableArray *carr = [NSMutableArray array];
    
    //block 有三种类型
    //    __NSGlobalBlock__ （ _NSConcreteGlobalBlock ）
    //    __NSStackBlock__ （ _NSConcreteStackBlock ）
    //    __NSMallocBlock__ （ _NSConcreteMallocBlock ）
}

- (void)blockStrong {
    // block内没有访问auto变量
    Block block = ^{
        NSLog(@"block---------");
    };
    NSLog(@"%@",[block class]);
    int a = 10;
    // block内访问了auto变量，但没有赋值给__strong指针
    NSLog(@"%@",[^{
        NSLog(@"block1---------%d", a);
    } class]);
    // block赋值给__strong指针
    Block block2 = ^{
        NSLog(@"block2---------%d", a);
    };
    NSLog(@"%@",[block2 class]);
}






@end
