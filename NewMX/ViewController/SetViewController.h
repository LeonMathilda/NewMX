//
//  SetViewController.h
//  NewMX
//
//  Created by 李 昂 on 13-12-6.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "EGORefreshTableHeaderView.h"
@interface SetViewController : UIViewController<MBProgressHUDDelegate,UITableViewDelegate,UITableViewDataSource,EGORefreshTableHeaderDelegate>
{
    UIImageView *_imageView;
    UITableView *m_tableView;
    NSMutableArray *image_Array;
    NSMutableData *receivedData;
    NSString *read_path;
    NSString *m_longtime;
    NSString *m_results;
    NSMutableDictionary *m_dic;
    NSString *m_contentpath;
    NSMutableArray *content_Array;
    MBProgressHUD *HUD;
    NSMutableArray *m_requireArray;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    NSMutableArray *m_timeArray;
    NSMutableArray *infoArray;
 NSString *_urlString;
    
}
-(void)reloadTableViewDataSource;
-(void)doneLoadingTableViewData;@end
