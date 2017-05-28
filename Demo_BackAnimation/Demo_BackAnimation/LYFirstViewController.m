//
//  LYFirstViewController.m
//  Demo_BackAnimation
//
//  Created by lyons on 2017/5/24.
//  Copyright © 2017年 NewZhiWei. All rights reserved.
//

#import "LYFirstViewController.h"
#import "LYSecondViewController.h"
#import "LCSpreadTransitionAnimation.h"

@interface LYFirstViewController ()
@property (nonatomic, strong) LCSpreadTransitionAnimation *animation;

@end

@implementation LYFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popBtnClick:(id)sender {
    //popToViewController
    LYSecondViewController *vc = [[LYSecondViewController alloc]initWithNibName:@"LYSecondViewController" bundle:nil];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    self.animation = [[LCSpreadTransitionAnimation alloc] initWithModalViewController:vc];
    self.animation.bounces = NO;
    self.animation.dragable = YES;
    self.animation.behindViewAlpha = 0.8f;
    self.animation.behindViewScale = 0.95;
    self.animation.topMargin = 0.0f;
//    [self.animation setContentScrollView:vc.view];
    vc.transitioningDelegate = self.animation;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
