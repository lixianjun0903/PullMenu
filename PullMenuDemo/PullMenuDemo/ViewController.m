//
//  ViewController.m
//  PullMenuDemo
//
//  Created by linaicai on 15/1/4.
//  Copyright (c) 2015年 linaicai. All rights reserved.
//

#import "ViewController.h"
#import "PullMenu.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PullMenu *menu=[[PullMenu alloc]initWithFrame:CGRectMake(10, 100, 200, 35) Data:@[@"广州",@"东莞",@"深圳"]];
    [self.view addSubview:menu];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
