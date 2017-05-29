//
//  NPMainPageViewController.m
//  PushBackDemo
//
//  Created by lyons on 2017/3/29.
//  Copyright © 2017年 夏至. All rights reserved.
//

#import "NPMainPageViewController.h"
#import "AJKMainViewController.h"
#import "PushBackNavigationController.h"
#import "TabBarController.h"
#import "NPHomeViewController.h"


@interface NPMainPageViewController ()
{
    TabBarController *_tab;
}
@end

@implementation NPMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(openViewController) withObject:nil afterDelay:0.5];
}
-(void)openViewController{
    NPHomeViewController *vc = [[NPHomeViewController alloc]initWithNibName:@"NPHomeViewController" bundle:nil];
    
    PushBackNavigationController *navi = [[PushBackNavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:navi animated:NO completion:^{
        
    }];
}
-(void)openTabViewController
{
    if(!_tab)
        _tab=[[TabBarController alloc]init];
    [self presentViewController:_tab animated:YES completion:^{
        ;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
