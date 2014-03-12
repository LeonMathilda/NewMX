//
//  IndexViewController.h
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "indexCell.h"
#import "MBProgressHUD.h"
#import "EGORefreshTableHeaderView.h"
@interface IndexViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate,EGORefreshTableHeaderDelegate,UIGestureRecognizerDelegate>
{
    int detla;
    UITableView* m_infoTableView;
    UIImageView *_imageView;
    NSMutableData *receivedData;
    NSString *read_path;
    NSString *m_longtime;
    NSString *m_results;
    NSMutableDictionary *m_dic;
    NSString *m_contentpath;
    NSMutableArray *content_Array;
    NSMutableArray *image_Array;
    NSArray * _urls;
    MBProgressHUD *HUD;
     NSString *_urlString;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    NSString *_info;
    NSMutableArray *_infoAry;
    NSArray* _ary;
    NSMutableArray *passAry;
    NSMutableArray *passaryary;
    int height;
    int point;
//    int add;
    NSMutableArray *m_timeArray;
    float currentPositiion;
    float add2;
    float min;
    float table;
    NSMutableArray *m_rectArray;
    NSURLConnection *conn1;
}

-(void)reloadTableViewDataSource;
-(void)doneLoadingTableViewData;
@end
