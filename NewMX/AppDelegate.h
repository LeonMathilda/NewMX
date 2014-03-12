//
//  AppDelegate.h
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
//#import "LeveyTabBarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate>
{
//    LeveyTabBarController *leveyTabBarController;
    UIWindow *window;
    NSString *currentLanguage;
}
- (NSString*)getPreferredLanguage;
-(BOOL)checkNetConnect;
@property (nonatomic,retain) NSString *currentLanguage;
@property (strong, nonatomic) UIWindow *window;
//@property (nonatomic,retain)  LeveyTabBarController *leveyTabBarController;
@end
