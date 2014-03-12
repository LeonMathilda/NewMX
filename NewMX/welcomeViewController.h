//
//  welcomeViewController.h
//  NewMX
//
//  Created by 李昂 on 13-12-13.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeveyTabBarController.h"
#import "IndexViewController.h"
#import "ProductViewController.h"
#import "ClassificationViewController.h"
#import "AboutViewController.h"
@interface welcomeViewController : UIViewController
{
LeveyTabBarController *leveyTabBarController;
}
@property (nonatomic,retain)  LeveyTabBarController *leveyTabBarController;
@end