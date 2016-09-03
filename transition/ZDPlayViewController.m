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
    
    
    
    // 通过拖拽按钮实现转场动画
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(changeViewFrame:)];
    [self.view addGestureRecognizer:panGesture];
}


///  转场动画方法实现
- (void)changeViewFrame:(UIPanGestureRecognizer *)pan {

    // 拖拽的距离
    CGPoint point = [pan translationInView:pan.view];
    // 旋转的角度
    CGFloat scale = point.x / [UIScreen mainScreen].bounds.size.width;
    NSLog(@"%f", scale);
    
    self.view.transform = CGAffineTransformMakeRotation(scale * M_PI_4 / 2);
    
    // 判断状态
    // 当手势停止，或者手势取消时
    if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled) {
        
        [UIView animateWithDuration:0.125 animations:^{
           
            if (ABS(self.view.transform.b) < 0.16) {
                
                self.view.transform = CGAffineTransformIdentity;
            }else {
            
                if (self.view.transform.b < 0) {
                    
                    self.view.transform = CGAffineTransformMakeRotation(-M_PI_2);
                }else {
                
                    self.view.transform = CGAffineTransformMakeRotation(M_PI_2);
                }
            
            }
            
            
        }];
    }
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
