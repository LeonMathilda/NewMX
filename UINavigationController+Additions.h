//
//  UINavigationController+Additions.h
//  domo
//
//  Created by mac on 13-4-25.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SFHFKeychainUtils.h"
@interface UINavigationController(Additions)
// 跳转
- (void)pushViewController:(UIViewController*)controller
             animTransType: (int)type;
// 返回
- (UIViewController*) popViewControllerWithAnimTransType:(int)type;

-(NSArray *)popToViewController:(UIViewController *)viewController animTransType:(int)type;

@end
