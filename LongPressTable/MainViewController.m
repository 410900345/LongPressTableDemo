//
//  MainViewController.m
//  LongPressTable
//
//  Created by jiuhao-yangshuo on 16/3/18.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, 50, 30);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClick
{
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
