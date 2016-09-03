//
//  ViewController.m
//  transition
//
//  Created by 赵东亮 on 16/9/3.
//  Copyright © 2016年 赵东亮. All rights reserved.
//

#import "ViewController.h"
#import "ZDPlayViewController.h"

@interface ViewController ()
@property (nonatomic,strong) ZDPlayViewController *playVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ZDPlayViewController *playVC = [[ZDPlayViewController alloc] init];
    
    playVC.view.layer.anchorPoint = CGPointMake(0.5, 2);
    playVC.view.frame = self.view.bounds;
    [self.view addSubview:playVC.view];
    [self addChildViewController:playVC];
    self.playVC = playVC;
    
    playVC.view.transform = CGAffineTransformMakeRotation(M_PI_4);
}

- (IBAction)showClick:(id)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.playVC.view.transform = CGAffineTransformIdentity;
    }];
    
}

@end
