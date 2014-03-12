//
//  detailViewController.h
//  NewMX
//
//  Created by 李昂 on 13-9-11.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface detailViewController : UIViewController<MBProgressHUDDelegate>
{
    CGSize _calcSize;
    UIImage *m_image;
    NSMutableArray *m_info;
    NSMutableData *receivedData;
    MBProgressHUD *HUD;
    UIImageView *_imageView;
    size_t m_imageHeight;
    size_t m_imageWidth;
    UIImageView* title_imageView;
    UIView *m_photoView;
    int m_width;
    int m_height;
    NSMutableArray *m_imageArray;
    UIScrollView *m_scrollerView;
    CGSize m_calcSize;
    float m_infoHeight;
    UILabel *m_timeLable;
    UILabel *m_titleLabel;
    UIView *detailView;
    UILabel *_infoLabel;
    float detaily;
}
@property(nonatomic,strong)NSArray *urls;
@property(nonatomic,retain)NSMutableArray *m_info;
@property(nonatomic,retain)NSString *m_oldpic;
@property(nonatomic,retain)NSString *m_timeInfo;
@property(nonatomic,retain)NSString *m_titleInfo;
@end
