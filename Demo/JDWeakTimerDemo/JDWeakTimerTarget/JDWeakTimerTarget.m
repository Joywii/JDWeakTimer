//
//  JDWeakTimerTarget.m
//  JDWeakTimerDemo
//
//  Created by joywii on 15/7/8.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "JDWeakTimerTarget.h"

@interface JDWeakTimerTarget ()

@property (nonatomic, weak)   id       target;
@property (nonatomic, assign) SEL      selector;
@property (nonatomic, weak)   NSTimer  *timer;

@end

@implementation JDWeakTimerTarget

- (void) fire:(NSTimer *)timer {
    if(self.target) {
        [self.target performSelector:self.selector withObject:timer.userInfo];
    } else {
        [self.timer invalidate];
    }
}
+ (NSTimer *) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats
{
    JDWeakTimerTarget* timerTarget = [[JDWeakTimerTarget alloc] init];
    timerTarget.target = aTarget;
    timerTarget.selector = aSelector;
    timerTarget.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                         target:timerTarget
                                                       selector:@selector(fire:)
                                                       userInfo:userInfo
                                                        repeats:repeats];
    return timerTarget.timer;
}

+ (void)timerBlockInvoke:(NSArray*)userInfo
{
    if (userInfo) {
        if (userInfo.count == 1) {
            JDWeakTimerBlock block = userInfo[0];
            if (block) {
                block(nil);
            }
        } else if (userInfo.count == 2) {
            JDWeakTimerBlock block = userInfo[0];
            id info = userInfo[1];
            if (block) {
                block(info);
            }
        }
    }
}
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(JDWeakTimerBlock)block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats
{
    NSMutableArray *userArray = [NSMutableArray array];
    if (block) {
        [userArray addObject:block];
    }
    if (userInfo) {
        [userArray addObject:userInfo];
    }
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(timerBlockInvoke:)
                                       userInfo:userArray
                                        repeats:repeats];
}
@end
