//
//  UINavigationController+Additions.m
//  domo
//
//  Created by mac on 13-4-25.
//
//

#import "UINavigationController+Additions.h"

@implementation UINavigationController(Additions)


- (void)pushViewController: (UIViewController*)controller
             animTransType: (int)type {
    
    [self pushViewController:controller animated:NO];
    
    CATransition* myTransition = [CATransition animation];
    myTransition.duration = 2;
    myTransition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    if (type == 0) {
        myTransition.type = kCATransitionPush;
        myTransition.subtype = kCATransitionFromTop;
        
    } else if(type == 1) {
        myTransition.type = kCATransitionMoveIn;
        myTransition.subtype = kCATransitionFromTop;
        
    } else if(type == 2) {
        myTransition.type = kCATransitionFade;
        myTransition.subtype = kCATransitionFromTop;
        
    } else if(type == 3) {
        myTransition.type = kCATransitionReveal;
        myTransition.subtype = kCATransitionFromTop;
        
    }
//    else if(type == 4) {
//        myTransition.type = @"rippleEffect";
//        
//    } else if(type == 5) {
//        myTransition.type = @"suckEffect";
//        
//    } else if(type == 6) {
//        myTransition.type = @"pageCurl";
//        
//    } else if(type == 7) {
//        myTransition.type = @"pageUnCurl";
//        
//    } else if(type == 8) {
//        myTransition.type = @"oglFlip";
//        myTransition.subtype = kCATransitionFromTop;
//        
//    } else if(type == 9) {
//        myTransition.type = @"cube";
//        myTransition.subtype = kCATransitionFromRight;
//    }
    
    myTransition.delegate = self;
    [self.view.layer addAnimation:myTransition forKey:nil];
    [self.view addSubview:controller.view];
//    [self performSelector:@selector(showstatue) withObject:nil afterDelay:10.0f];
   
}
-(void)showstatue
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    
}


- (UIViewController*)popViewControllerWithAnimTransType: (int)type {

    UIViewController* poppedController = [self popViewControllerAnimated:NO];
    
    CATransition *myTransition = [CATransition animation];
    myTransition.duration = 0.5;
    myTransition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    if (type == 0) {
        myTransition.type = kCATransitionPush;
        myTransition.subtype = kCATransitionFromBottom;
        
    } else if(type == 1) {
        myTransition.type = kCATransitionMoveIn;
        myTransition.subtype = kCATransitionFromBottom;
        
    } else if(type == 2) {
        myTransition.type = kCATransitionFade;
        myTransition.subtype = kCATransitionFromBottom;
        
    } else if(type == 3) {
        myTransition.type = kCATransitionReveal;
        myTransition.subtype = kCATransitionFromBottom;
        
    }
//    else if(type == 4) {
//        myTransition.type = @"rippleEffect";
//        
//    } else if(type == 5) {
//        myTransition.type = @"suckEffect";
//        
//    } else if(type == 6) {
//        myTransition.type = @"pageCurl";
//        
//    } else if(type == 7) {
//        myTransition.type = @"pageUnCurl";
//        
//    } else if(type == 8) {
//        myTransition.type = @"oglFlip";
//         myTransition.subtype = kCATransitionFromBottom;
//        
//    } else if(type == 9) {
//        myTransition.type = @"cube";
//         myTransition.subtype = kCATransitionFromRight;
//    }
    
    myTransition.delegate = self;
    [self.view.superview.layer addAnimation:myTransition forKey:nil];
    return poppedController;
}

-(NSArray *)popToViewController:(UIViewController *)viewController animTransType:(int)type
{
    NSArray *controllers = [self popToViewController:viewController animated:NO];
    
    CATransition *myTransition = [CATransition animation];
    myTransition.duration = 0.5;
    myTransition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    if (type == 0) {
        myTransition.type = kCATransitionPush;
        myTransition.subtype = kCATransitionFromBottom;
        
    } else if(type == 1) {
        myTransition.type = kCATransitionMoveIn;
        myTransition.subtype = kCATransitionFromBottom;
        
    } else if(type == 2) {
        myTransition.type = kCATransitionFade;
        myTransition.subtype = kCATransitionFromBottom;
        
    } else if(type == 3) {
        myTransition.type = kCATransitionReveal;
        myTransition.subtype = kCATransitionFromBottom;
        
    }
    //    else if(type == 4) {
    //        myTransition.type = @"rippleEffect";
    //
    //    } else if(type == 5) {
    //        myTransition.type = @"suckEffect";
    //
    //    } else if(type == 6) {
    //        myTransition.type = @"pageCurl";
    //
    //    } else if(type == 7) {
    //        myTransition.type = @"pageUnCurl";
    //
    //    } else if(type == 8) {
    //        myTransition.type = @"oglFlip";
    //         myTransition.subtype = kCATransitionFromBottom;
    //
    //    } else if(type == 9) {
    //        myTransition.type = @"cube";
    //         myTransition.subtype = kCATransitionFromRight;
    //    }
    
    myTransition.delegate = self;
    [self.view.superview.layer addAnimation:myTransition forKey:nil];
    return controllers;
}


@end