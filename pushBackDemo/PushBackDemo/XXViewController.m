//
//  XXViewController.m
//  PushBackDemo
//
//  Created by xiazer on 14-4-16.
//  Copyright (c) 2014年 夏至. All rights reserved.
//

#import "XXViewController.h"
#import "UIColor+Hex.h"

@interface XXViewController ()

@end

@implementation XXViewController
@synthesize backType;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIColor createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    //导航条阴影
    [self.navigationController.navigationBar setShadowImage:[UIColor createImageWithColor:[UIColor redColor]]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
