//
//  indexCell.m
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import "indexCell.h"
#import <QuartzCore/QuartzCore.h>
#import "ImageHelper.h"
#import "UIImageView+MJWebCache.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#import "UIImageView+WebCache.h"
@implementation indexCell
@synthesize m_picArray;
@synthesize _delegate;
@synthesize m_info,m_indexPicture;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        m_imageView = [[UIView alloc] init];
        m_imageArray = [[NSMutableArray alloc] init];
        
        firstImageHeight = 0;
    }
    return self;
}

#pragma mark 最上面的图片
-(void)setUrls:(NSArray *)urls
{
    _urls = urls;
    if ([urls count]>0){
        
        UIImage *placeholder = [UIImage imageNamed:@"timeline_image_loading.png"];
        CGFloat width = 291;
        
        
        for (int i = 0; i<[_urls count]; i++) {
            CGFloat x = 0;
            
            __block float imageHeight =[[[_urls objectAtIndex:i] objectForKey:@"hight"] floatValue]/2;
            
            
            
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, firstImageHeight, 291, imageHeight)];
            [imageView setImageWithURL:[NSURL URLWithString:[@"http://115.29.148.86/Blogbg/image/oldimage/" stringByAppendingString:[[_urls objectAtIndex:i] objectForKey:@"name"]]] placeholderImage:placeholder];
            
            firstImageHeight = firstImageHeight+imageHeight+2;
            
            
            //             [NSURL URLWithString:[@"http://115.29.35.239/Blogbg/image/oldimage/" stringByAppendingString:[[_urls objectAtIndex:i] objectForKey:@"name"]]] placeholderImage:placeholder];
            
            
            [m_imageView addSubview:imageView];
            
            
            // 事件监听
            imageView.tag = i;
            imageView.userInteractionEnabled = YES;
            [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)]];
            
            // 内容模式
            imageView.clipsToBounds = YES;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            
            [m_imageArray addObject:imageView];
        }
        
        m_width = width;
        [m_imageView  setFrame:CGRectMake(-1, 0, m_width+1, firstImageHeight)];
        m_imageView.backgroundColor = [UIColor whiteColor];
        [self addSubview:m_imageView];
        UIImageView *slideImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, m_imageView.frame.size.height-6
                                                                                , self.frame.size.width, 4)];
        slideImage.image = [UIImage imageNamed:@"蓝条.png"];
        
        
        [m_imageView addSubview:slideImage];
        //        m_height = height*[_urls count]+margin*([_urls count]);
    }
    else{
        m_width = 0;
        m_height = 0;
    }
    
}
-(void)showNewLable:(BOOL)is
{
    if (is) {
        UIImage *image = [UIImage imageNamed:@"new .png"];
        
        size_t imageHeight = CGImageGetHeight(image.CGImage)/2;
        size_t imageWidth = CGImageGetWidth(image.CGImage)/2;
        
        UIImageView *new = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"new .png"]];
        [new setFrame:CGRectMake(9, 0, imageWidth, imageHeight)];
        
        [m_imageView addSubview:new];
    }
    
}
- (void)tapImage:(UITapGestureRecognizer *)tap
{
    int count = [_urls count];
    // 1.封装图片数据
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<[_urls count]; i++) {
        // 替换为中等尺寸图片
        NSString *url = [[@"http://115.29.148.86/Blogbg/image/oldimage/" stringByAppendingString:[[_urls objectAtIndex:i] objectForKey:@"name"]] stringByReplacingOccurrencesOfString:@"oldimage" withString:@"oldimage"];
        MJPhoto *photo = [[MJPhoto alloc] init];
        photo.url = [NSURL URLWithString:url]; // 图片路径
        photo.srcImageView = (UIImageView*)[self viewWithTag:i]; // 来源于哪个UIImageView
        [photos addObject:photo];
    }
    
    // 2.显示相册
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = tap.view.tag; // 弹出相册时显示的第一张图？
    browser.photos = photos; // 设置所有的图片
    [browser show];
    
}
#pragma mark 信息文字
-(void)setMinfo:(NSString *)minfo
{
    _minfo = minfo;
    m_calcSize = [_minfo sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(self.frame.size.width-42,2000)];
    m_infoHeight = m_calcSize.height;
    //    m_calcSize = [_minfo sizeWithFont:[UIFont systemFontOfSize:13.0] constrainedToSize:m_infoFrame.size];
    //    m_infoHeight = [self calculateTextHeight:[UIFont fontWithName:@"Helvetica" size:15] givenText:_minfo givenWidth:320];
    [self LoadView];
}
-(void)LoadView
{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, firstImageHeight, self.frame.size.width, m_infoHeight+15+7+5)];
    backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backView];
    _infoView = [[UILabel alloc]initWithFrame:CGRectMake(12, firstImageHeight-9, self.frame.size.width-42
                                                         , m_infoHeight+15+7+5+7)];
    [self addSubview:_infoView];
    _shareBtn = [[UIButton alloc]init];
    [_shareBtn setImage:[UIImage imageNamed:@"share btn.png"] forState:UIControlStateNormal];
    _infoView.backgroundColor = [UIColor clearColor];
    _infoView.text = _minfo;
    _infoView.lineBreakMode = UILineBreakModeWordWrap;
    _infoView.numberOfLines = 0;
    _infoView.contentMode = UIViewContentModeTop;
    //    _infoView.textAlignment = UITextAlignmentLeft;
    _infoView.font = [UIFont systemFontOfSize:14.0];
    _infoView.userInteractionEnabled = NO;
    m_rect = CGRectMake(0, 0, self.frame.size.width,m_infoHeight+22+firstImageHeight+30-7-7);
    [self setFrame:m_rect];
    m_spView = [[UIView alloc] initWithFrame:CGRectMake(0,m_infoHeight+15+firstImageHeight-7, self.frame.size.width, 30)];
    m_spView.backgroundColor = [UIColor whiteColor];
    [self addSubview:m_spView];
    
    UIButton *sha = [[UIButton alloc] initWithFrame:CGRectMake(250-2, 2, 80, 30)];
    
    [sha addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    
    [sha setBackgroundColor:[UIColor clearColor]];
    [m_spView addSubview:sha];
    [_shareBtn setFrame:CGRectMake(266, 5, 20, 20)];
    [_shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [m_spView addSubview:_shareBtn];
    UIImage *_clockImg = [UIImage imageNamed:@"clock.png"];
    size_t imageWidth1 = CGImageGetWidth(_clockImg.CGImage)/2;
    size_t imageHeight1 = CGImageGetHeight(_clockImg.CGImage)/2;
    
    UIButton *_timeBtn = [[UIButton alloc] initWithFrame:CGRectMake(170,m_imageView.frame.size.height-20, imageWidth1, imageHeight1)];
    NSLog(@"%f",m_imageView.frame.size.height -( _timeBtn.frame.origin.y + imageHeight1) );
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(186, m_imageView.frame.size.height-20, 300, imageHeight1)];
    timeLabel.font = [UIFont systemFontOfSize:12];
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.backgroundColor = [UIColor clearColor];
    [m_imageView addSubview:timeLabel];
    
    [_timeBtn setImage:_clockImg forState:UIControlStateNormal];
    [m_imageView addSubview:_timeBtn];
    
    
}
-(void)setMtime:(NSString *)time
{
    [timeLabel setText:time];
    
}
- (CGFloat) calculateTextHeight:(UIFont *)font givenText:(NSString *)text givenWidth:(NSInteger)width{
    
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(width, 9999) lineBreakMode:UILineBreakModeWordWrap];
    CGFloat delta = size.height;
    return delta;
}
//-(void)setcurrentImg:(UIImage*)curImg
//{
//    _curImg = curImg;
//}
/**
 @method 获取指定宽度情况ixa，字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param andWidth 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (void) resizeLabel:(UILabel *)theLabel shrinkViewIfLabelShrinks:(BOOL)canShrink {
    CGRect frame = [theLabel frame];
    CGFloat size = [self calculateTextHeight:theLabel.font givenText:theLabel.text givenWidth:frame.size.width];
    
    CGFloat delta = size - frame.size.height;
    frame.size.height = size;
    [theLabel setFrame:frame];
    
    CGRect contentFrame = self.frame;
    contentFrame.size.height = contentFrame.size.height + delta;
    if(canShrink || delta > 0) {
        [self setFrame:contentFrame];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)share
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];
    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:_minfo
                                       defaultContent:@""
                                                image:[ShareSDK imageWithUrl:[[@"http://115.29.148.86/Blogbg/image/oldimage/" stringByAppendingString:[[_urls objectAtIndex:0] objectForKey:@"name"]] stringByReplacingOccurrencesOfString:@"oldimage" withString:@"oldimage"]]
                                                title:@"分享内容"
                                                  url:@"http://www.sharesdk.cn"
                                          description:@""
                                            mediaType:SSPublishContentMediaTypeNews];
    
    [ShareSDK showShareActionSheet:nil
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions: nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
    
    
}
@end
