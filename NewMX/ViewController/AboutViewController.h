//
//  AboutViewController.h
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AboutTableCell.h"
#import <MessageUI/MessageUI.h>
#import "MBProgressHUD.h"
@interface AboutViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MFMailComposeViewControllerDelegate,MBProgressHUDDelegate>
{
    UIImageView *_imageView;
    UITableView *m_aboutTable;
    NSMutableArray *m_iconAry;
    NSMutableArray *m_infoAry;
    UIScrollView *bkView;
    NSMutableData *receivedData;
    NSString *read_path;
    NSString *m_longtime;
    NSString *m_results;
    NSMutableDictionary *m_dic;
    NSString *m_contentpath;
    NSMutableArray *content_Array;
    MBProgressHUD *HUD;
    size_t titleHeight;
    size_t titleWidth;
    NSString* _urlString;
}

@end
