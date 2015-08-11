//
//  TimerViewController.m
//  JDWeakTimerDemo
//
//  Created by joywii on 15/7/8.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "TimerViewController.h"
#import "JDWeakTimerTarget.h"


@interface TimerViewController ()

@property (nonatomic,strong) NSTimer *timer;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.timer = [JDWeakTimerTarget scheduledTimerWithTimeInterval:2.0
                                                            target:self
                                                          selector:@selector(timeFir:)
                                                          userInfo:@"hello"
                                                           repeats:YES];
    [self.timer fire];
}
- (void)timeFir:(id)userInfo
{
    NSLog(@"%@",userInfo);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
