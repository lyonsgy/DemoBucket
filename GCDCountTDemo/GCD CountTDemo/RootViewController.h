//
//  RootViewController.h
//  GCD CountTDemo
//
//  Created by jerry_zhao on 15-4-30.
//  Copyright (c) 2015年 gq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
- (IBAction)startClick:(id)sender;
- (IBAction)pauseClick:(id)sender;
- (IBAction)stopClick:(id)sender;
- (IBAction)syncBtnClick:(id)sender;
- (IBAction)asyncBtnClick:(id)sender;

@end
