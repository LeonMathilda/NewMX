//
//  AppDelegate.m
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import "AppDelegate.h"
#import "LeveyTabBarController.h"
#import "IndexViewController.h"
#import "ProductViewController.h"
#import "ClassificationViewController.h"
#import "AboutViewController.h"
#import <ShareSDK/ShareSDK.h>
#import "welcomeViewController.h"

@implementation AppDelegate
//@synthesize leveyTabBarController;
@synthesize window;
@synthesize currentLanguage;
- (void)dealloc
{
//    [leveyTabBarController release];
    [window release];
    [super dealloc];
}
-(BOOL)checkNetConnect
{
    Reachability *reacha = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([reacha currentReachabilityStatus]) {
        case NotReachable:
        {
            UIAlertView *alert  = [[UIAlertView alloc] initWithTitle:@"注意" message:@"没有连接到网络" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
            return NO;
        }
        case ReachableViaWWAN:
        {
            NSLog(@"使用3G网络");
      
            return YES;}
            
        case ReachableViaWiFi:
        {
            NSLog(@"使用WiFi网络");
            return YES;
        }
    }
    return YES;
}

/**
 *得到本机现在用的语言
 * en:英文  zh-Hans:简体中文   zh-Hant:繁体中文    ja:日本  ......
 */
- (NSString*)getPreferredLanguage
{
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];
    NSString* preferredLang = [languages objectAtIndex:0];
    NSLog(@"Preferred Language:%@", preferredLang);
    if ([preferredLang isEqualToString:@"en"]) {
        currentLanguage = @"english";
    }
    else if ([preferredLang isEqualToString:@"zh-Hans"]) {
        currentLanguage = @"chinese";
    }
    else
    {
        currentLanguage = @"english";
    }
    
    return preferredLang;
}
- (BOOL)application:(UIApplication *)application  handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:self];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];

  
    [ShareSDK registerApp:@"113091337aa0"];
    //添加新浪微博应用
    [ShareSDK connectSinaWeiboWithAppKey:@"575808798"
                               appSecret:@"956080d445964fed5fb77f94ad07eec8"
                             redirectUri:@"http://appgo.cn"];
    
           //添加人人网应用
    [ShareSDK connectRenRenWithAppKey:@"4be3453e6b254afdbac9d41e4016b42a"
                            appSecret:@"e426e474262c46f1a738316da7f6f4c4"];
    

    //添加Facebook应用
    [ShareSDK connectFacebookWithAppKey:@"595339943849209"
                              appSecret:@"10739ba1001f50c81c66a17fd56a8180"];
    

    //添加微信应用
    [ShareSDK connectWeChatWithAppId:@"wx6ca01494aff9935b"        //此参数为申请的微信AppID
                           wechatCls:nil];
//  
//    IndexViewController *indexVC = [[IndexViewController alloc]init];
//    ProductViewController *productVC = [[ProductViewController alloc]init];
//    ClassificationViewController *classVC = [[ClassificationViewController alloc]init];
//    AboutViewController *aboutVC = [[AboutViewController alloc]init];
    [self getPreferredLanguage];

    welcomeViewController *welVC = [[welcomeViewController alloc] init];

    UINavigationController *navgtC = [[UINavigationController alloc] initWithRootViewController:welVC];
    navgtC.navigationBarHidden = YES;
   //	[leveyTabBarController setTabBarTransparent:YES];
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = navgtC;
//    [self.window addSubview:navgtC.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
