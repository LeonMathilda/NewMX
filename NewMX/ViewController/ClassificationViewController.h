//
//  ClassificationViewController.h
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassViewCell.h"
@interface ClassificationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *m_tableView;
    NSMutableData *receivedData;
    NSString *read_path;
    NSString *m_longtime;
    NSString *m_results;
    NSMutableDictionary *m_dic;
    NSString *m_contentpath;
    NSMutableArray *content_Array;
    UIImageView *_imageView;
}

@end
