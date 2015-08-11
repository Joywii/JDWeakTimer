//
//  ViewController.m
//  JDWeakTimerDemo
//
//  Created by joywii on 15/7/8.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "ViewController.h"
#import "TimerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, 100, 50);
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
}
- (void)buttonClick:(id)sender
{
    TimerViewController *vc = [TimerViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
