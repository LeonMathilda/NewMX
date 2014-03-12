//
//  indexCell.h
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>
#import "AppDelegate.h"
@protocol indexDelegate;
typedef  struct{
    int id;
    UIButton *_imgBtn;
}imageBtn;
@interface indexCell : UITableViewCell
{
    NSMutableArray *m_picArray;
    imageBtn *m_imgBtn;
    UIImage *m_indexPicture;
    CGRect m_rect;
    CGRect m_infoFrame;
    size_t m_pic_height;
    CGSize m_calcSize;
    UIButton *_showImg;
    id<indexDelegate> _delegate;
    UIImage *_curImg;
    NSMutableArray *m_imageArray;
    UIView *m_imageView;
    int m_width;
    int m_height;
    UIButton *_shareBtn;
    UILabel *_infoView;
    UIView *m_spView;
    float m_infoHeight;
    NSString *mtime;
    UILabel *timeLabel;
    float m_imageHeight;
    float firstImageHeight;
    AppDelegate *myDelegate;
    NSMutableData *receivedData;
//    UIImageView *imageView;
}
@property(nonatomic,retain)NSString *mtime;
@property(nonatomic,strong)NSString *minfo;
@property(nonatomic,strong)NSArray *urls;
@property(nonatomic,retain)NSMutableArray *m_picArray;
@property(nonatomic,retain)id<indexDelegate> _delegate;
@property(nonatomic,retain)UIImage *m_indexPicture;
@property(nonatomic,retain)NSString *m_info;
@property(nonatomic)CGRect m_rect;
- (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;
-(void)showNewLable:(BOOL)is;
@end
@protocol indexDelegate <NSObject>
-(void)showImage:(NSString*)Image;
@end

