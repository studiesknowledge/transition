//
//  ZDPlayViewController.m
//  transition
//
//  Created by 赵东亮 on 16/9/3.
//  Copyright © 2016年 赵东亮. All rights reserved.
//

#import "ZDPlayViewController.h"

@interface ZDPlayViewController ()

@end

@implementation ZDPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor redColor];
    
    // 添加按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"back" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 50, 30);
    [btn setBackgroundColor:[UIColor yellowColor]];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}


///  按钮点击事件
- (void)btnClick {

    [UIView animateWithDuration:0.5 animations:^{
    
        self.view.transform = CGAffineTransformMakeRotation(M_PI_4);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
