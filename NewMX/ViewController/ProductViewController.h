//
//  ProductViewController.h
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "EGORefreshTableHeaderView.h"
@interface ProductViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate,EGORefreshTableHeaderDelegate>
{
    NSMutableArray *image_Array;
    UITableView *m_tableView;
    UIImageView *_imageView;
    NSMutableData *receivedData;
    NSString *read_path;
    NSString *m_longtime;
    NSString *m_results;
    NSMutableDictionary *m_dic;
    NSString *m_contentpath;
    NSMutableArray *content_Array;
    MBProgressHUD *HUD;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    NSMutableArray *m_timeArray;
    NSMutableArray *infoArray;
     NSString *_urlString;
   
}
-(void)reloadTableViewDataSource;
-(void)doneLoadingTableViewData;


@end
