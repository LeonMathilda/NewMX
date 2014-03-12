//
//  IntroduceViewController.h
//  NewMX
//
//  Created by 李昂 on 13-9-11.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
@interface IntroduceViewController : UIViewController<MBProgressHUDDelegate>
{
    UIImage *m_image;
    NSString *m_info;
    NSMutableData *receivedData;
    NSString *read_path;
    NSString *m_longtime;
    NSString *m_results;
    NSMutableDictionary *m_dic;
    NSString *m_contentpath;
    NSMutableArray *content_Array;
    UIImageView *_introduceImg;
    MBProgressHUD *HUD;
}

@end
