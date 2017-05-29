//
//  NPHomeViewController.m
//  PushBackDemo
//
//  Created by lyons on 2017/3/29.
//  Copyright © 2017年 夏至. All rights reserved.
//

#import "NPHomeViewController.h"
#import "TabBarController.h"
#import "PushBackNavigationController.h"

@interface NPHomeViewController ()
{
    TabBarController *_tab;
}
@end

@implementation NPHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click:(id)sender {
    if(!_tab)
        _tab=[[TabBarController alloc]init];
    [self presentViewController:_tab animated:YES completion:^{
        ;
    }];
}


@end
