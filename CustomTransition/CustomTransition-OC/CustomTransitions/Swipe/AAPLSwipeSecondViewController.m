/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 The presented view controller for the Swipe demo.
 */

#import "AAPLSwipeSecondViewController.h"
#import "AAPLSwipeTransitionDelegate.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface AAPLSwipeSecondViewController ()<UIScrollViewDelegate>
@end


@implementation AAPLSwipeSecondViewController

//| ----------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // This gesture recognizer could be defined in the storyboard but is
    // instead created in code for clarity.
    UIScreenEdgePanGestureRecognizer *interactiveTransitionRecognizer;
    interactiveTransitionRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(interactiveTransitionRecognizerAction:)];
    interactiveTransitionRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:interactiveTransitionRecognizer];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(ScreenWidth, ScreenHeight*2);
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight*2)];
    [scrollView addSubview:view];
    view.backgroundColor = [UIColor blueColor];
    
}


//| ----------------------------------------------------------------------------
//! Action method for the interactiveTransitionRecognizer.
//
- (IBAction)interactiveTransitionRecognizerAction:(UIScreenEdgePanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        // "BackToFirstViewController" is the identifier of the unwind segue
        // back to AAPLSwipeFirstViewController.  Triggering it will dismiss
        // this view controller.
        [self performSegueWithIdentifier:@"BackToFirstViewController" sender:sender];
    }
}


//| ----------------------------------------------------------------------------
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"BackToFirstViewController"])
    {
        // Check if we were presented with our custom transition delegate.
        // If we were, update the configuration of the
        // AAPLSwipeTransitionDelegate with the gesture recognizer and
        // targetEdge for this view controller.
        if ([self.transitioningDelegate isKindOfClass:AAPLSwipeTransitionDelegate.class])
        {
            AAPLSwipeTransitionDelegate *transitionDelegate = self.transitioningDelegate;
            
            // If this will be an interactive presentation, pass the gesture
            // recognizer along to our AAPLSwipeTransitionDelegate instance
            // so it can return the necessary
            // <UIViewControllerInteractiveTransitioning> for the presentation.
            if ([sender isKindOfClass:UIGestureRecognizer.class])
                transitionDelegate.gestureRecognizer = sender;
            else
                transitionDelegate.gestureRecognizer = nil;
            
            // Set the edge of the screen to dismiss this view controller
            // from.  This will match the edge we configured the
            // UIScreenEdgePanGestureRecognizer with previously.
            //
            // NOTE: We can not retrieve the value of our gesture recognizer's
            //       configured edges because prior to iOS 8.3
            //       UIScreenEdgePanGestureRecognizer would always return
            //       UIRectEdgeNone when querying its edges property.
            transitionDelegate.targetEdge = UIRectEdgeLeft;
        }
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%.2f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y<=0) {
        AAPLSwipeTransitionDelegate *transitionDelegate = self.transitioningDelegate;
        
        if ([scrollView isKindOfClass:UIGestureRecognizer.class])
            transitionDelegate.gestureRecognizer = scrollView;
        else
            transitionDelegate.gestureRecognizer = nil;
        
        transitionDelegate.targetEdge = UIRectEdgeTop;
    }
}
@end
