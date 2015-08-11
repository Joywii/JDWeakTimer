//
//  KZTimer.h
//  iOSAnalyze
//
//  Created by joywii on 15/4/1.
//  Copyright (c) 2015年 sohu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDTimer : NSObject

/*
 * 单位 : 纳秒
 * interval : 多少间隔调用一次
 * leeway : 容忍
 */
+ (JDTimer *)timerWithInterval:(uint64_t)interval
                        leeway:(uint64_t)leeway
                         queue:(dispatch_queue_t)queue
                         block:(dispatch_block_t)block;

/*
 * start : start纳秒后执行
 * leeway : 容忍
 */
+ (JDTimer *)timerWithStart:(uint64_t)start
                     leeway:(uint64_t)leeway
                      queue:(dispatch_queue_t)queue
                      block:(dispatch_block_t)block;

- (id)initWithInterval:(uint64_t)interval
                leeway:(uint64_t)leeway
                 queue:(dispatch_queue_t)queue
                 block:(dispatch_block_t)block;

- (id)initWithStart:(uint64_t)start
             leeway:(uint64_t)leeway
              queue:(dispatch_queue_t)queue
              block:(dispatch_block_t)block;

- (void)resume;
- (void)suspend;
- (void)cancel;

@end
