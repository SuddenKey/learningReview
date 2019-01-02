//
//  InvoPeople.m
//  LearningReview
//
//  Created by 万浩 on 2018/11/27.
//  Copyright © 2018 haohao. All rights reserved.
//

#import "InvoPeople.h"

@implementation InvoPeople

- (void)messageSend:(NSString *)message {
    NSLog(@"%@", message);
}

- (void)invoMessageSend:(NSString *)message two:(NSString *)two three:(NSString *)three four:(NSInteger)four {
    NSLog(@"%@%@%@ %ld", message, two, three, four);
}

- (void)send {
    
}

@end
