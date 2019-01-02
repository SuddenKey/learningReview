//
//  InvoPeople.h
//  LearningReview
//
//  Created by 万浩 on 2018/11/27.
//  Copyright © 2018 haohao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InvoPeople : NSObject


- (void)messageSend:(NSString *)message;

- (void)invoMessageSend:(NSString *)message two:(NSString *)two three:(NSString *)three four:(NSInteger)four;

@end

NS_ASSUME_NONNULL_END
