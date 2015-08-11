//
//  JDWeakTimerTarget.h
//  JDWeakTimerDemo
//
//  Created by joywii on 15/7/8.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JDWeakTimerBlock)(id userInfo);

@interface JDWeakTimerTarget : NSObject

+ (NSTimer *) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(JDWeakTimerBlock)block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats;

@end
