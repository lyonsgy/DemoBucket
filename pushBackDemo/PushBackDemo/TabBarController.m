//
//  TabBarController.m
//  test
//
//  Created by smok on 16/10/24.
//  Copyright © 2016年 smok. All rights reserved.
//

#import "TabBarController.h"
#import "PushBackNavigationController.h"
#import "AJKMainViewController.h"
#import "AJKSecondViewController.h"

@interface TabBarController ()<UITabBarControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavigationController];
    self.delegate = self;
}

- (void)addNavigationController {
    
    AJKMainViewController *controller = [[AJKMainViewController alloc] init];
    controller.title = @"Scale";
    PushBackNavigationController *navController = [[PushBackNavigationController alloc]
                                             initWithRootViewController:controller];
    navController.view.backgroundColor = [UIColor whiteColor];
    navController.pushBackType = PushBackWithScale;
    [self addChildViewController:navController];
    
    
    AJKSecondViewController *shopController = [[AJKSecondViewController alloc] init];
    shopController.title = @"Normal";
    PushBackNavigationController *navController1 = [[PushBackNavigationController alloc] initWithRootViewController:shopController];
     navController1.view.backgroundColor = [UIColor whiteColor];
    navController1.pushBackType = PushBackWithScale;
    [self addChildViewController:navController1];
    
    
//    AJKMainViewController *reviewController = [[AJKMainViewController alloc] init];
//    reviewController.title = @"Translation";
//    PushBackNavigationController *navController2 = [[PushBackNavigationController alloc]
//                                              initWithRootViewController:reviewController];
//     navController2.view.backgroundColor = [UIColor whiteColor];
//    navController2.pushBackType = PushBackWithScale;
//    [self addChildViewController:navController2];
    
}

#pragma mark - tabBarDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    UIViewController *selectController = tabBarController.selectedViewController;
    if ([viewController isEqual:selectController]) {
        //refresh data
        return NO;
    }
    return YES;
}

@end
