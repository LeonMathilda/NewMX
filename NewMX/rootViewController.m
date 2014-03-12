//
//  rootViewController.m
//  NewMX
//
//  Created by 李昂 on 13-12-13.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import "rootViewController.h"

@interface rootViewController ()

@end

@implementation rootViewController

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
    IndexViewController *indexVC = [[IndexViewController alloc]init];
    ProductViewController *productVC = [[ProductViewController alloc]init];
    ClassificationViewController *classVC = [[ClassificationViewController alloc]init];
    AboutViewController *aboutVC = [[AboutViewController alloc]init];
//    aboutVC.view.backgroundColor = [UIColor grayColor];
    UINavigationController *nc_indexVC = [[UINavigationController alloc]initWithRootViewController:indexVC];
    nc_indexVC.navigationBarHidden = YES;
    //    nc_indexVC.delegate = self;
    UINavigationController *nc_productVC = [[UINavigationController alloc]initWithRootViewController:productVC];
    nc_productVC.navigationBarHidden = YES;
    //    nc_productVC.delegate = self;
    UINavigationController * nc_classVC = [[UINavigationController alloc]initWithRootViewController:classVC];
    nc_classVC.navigationBarHidden = YES;
    //    nc_classVC.delegate = self;
    NSArray *ctrlArr = [NSArray arrayWithObjects:nc_indexVC,nc_productVC,nc_classVC,aboutVC,nil];
	[indexVC release];
	[productVC release];
	[nc_classVC release];
	[aboutVC release];
    NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic setObject:[UIImage imageNamed:@"blog btn up.png"] forKey:@"Default"];
	[imgDic setObject:[UIImage imageNamed:@"blog btn down.png"] forKey:@"Highlighted"];
	[imgDic setObject:[UIImage imageNamed:@"blog btn down.png"] forKey:@"Seleted"];
	NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic2 setObject:[UIImage imageNamed:@"work btn up.png"] forKey:@"Default"];
	[imgDic2 setObject:[UIImage imageNamed:@"work btn down.png"] forKey:@"Highlighted"];
	[imgDic2 setObject:[UIImage imageNamed:@"work btn down.png"] forKey:@"Seleted"];
	NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic3 setObject:[UIImage imageNamed:@"Sections btn up.png"] forKey:@"Default"];
	[imgDic3 setObject:[UIImage imageNamed:@"Sections btn down.png"] forKey:@"Highlighted"];
	[imgDic3 setObject:[UIImage imageNamed:@"Sections btn down.png"] forKey:@"Seleted"];
	NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic4 setObject:[UIImage imageNamed:@"About me btn up.png"] forKey:@"Default"];
	[imgDic4 setObject:[UIImage imageNamed:@"About me btn down.png"] forKey:@"Highlighted"];
	[imgDic4 setObject:[UIImage imageNamed:@"About me btn down.png"] forKey:@"Seleted"];
    NSArray *imgArr = [NSArray arrayWithObjects:imgDic,imgDic2,imgDic3,imgDic4,nil];
	
	leveyTabBarController = [[LeveyTabBarController alloc] initWithViewControllers:ctrlArr imageArray:imgArr];
	[leveyTabBarController.tabBar setBackgroundColor:[UIColor blackColor]];
	[leveyTabBarController setTabBarTransparent:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
