//
//  detailViewController.m
//  NewMX
//
//  Created by 李昂 on 13-9-11.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import "detailViewController.h"
#import "AppDelegate.h"
#import "UIImageView+MJWebCache.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#import "UIImageView+WebCache.h"

@interface detailViewController ()

@end

@implementation detailViewController
@synthesize m_info,m_oldpic;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        m_info = [[NSMutableArray alloc] init];
        m_oldpic = [[NSString alloc] init];
        m_photoView = [[UIView alloc] init];
        m_titleLabel = [[UILabel alloc] init];
        m_timeLable = [[UILabel alloc] init];
        _infoLabel = [[UILabel alloc] init];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"base.png"]];
    if (iOS_7) {
        [img setFrame:CGRectMake(0, 20, img.frame.size.width/2, img.frame.size.height/2)];
    }
    else
    {
        [img setFrame:CGRectMake(0, 0, img.frame.size.width/2, img.frame.size.height/2)];
    }
    
    [self.view addSubview:img];
    [img release];
    UIImage *_titleImg = [UIImage imageNamed:@"Navigation bar 02.png"];
    size_t titleHeight = CGImageGetHeight(_titleImg.CGImage)/2;
    size_t titleWidth = CGImageGetWidth(_titleImg.CGImage)/2;
    title_imageView = [[UIImageView alloc] initWithImage:_titleImg];
    if (iOS_7) {
        title_imageView.frame = CGRectMake(0, 20, titleWidth, titleHeight);
        
    }
    else
    {
        title_imageView.frame = CGRectMake(0, 0, titleWidth, titleHeight);
    }
    if (!iPhone5&&!iOS_7) {
        title_imageView.frame = CGRectMake(0, -20, titleWidth, titleHeight);

    }
    [self.view addSubview:title_imageView];
    if (iOS_7) {
        
        m_scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(15,72, self.view.frame.size.width-30, self.view.frame.size.height-120)];
    }else
    {
        m_scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(15,52, self.view.frame.size.width-30, self.view.frame.size.height-100)];
        
    }
    if (!iPhone5&&!iOS_7) {
        m_scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(15,32, self.view.frame.size.width-30, self.view.frame.size.height-80)];

    }
    m_scrollerView.userInteractionEnabled = YES;
    
    m_scrollerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:m_scrollerView];
    
    
    UIImage *_backImage = [UIImage imageNamed:@"back.png"];
    
    size_t _backimageHeight = CGImageGetHeight(_backImage.CGImage)/1.5;
    size_t _backimageWidth = CGImageGetWidth(_backImage.CGImage)/1.5;
    UIButton *bigBtn;
    if (iOS_7) {
        bigBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 25
                                                                      , _backimageWidth*3, _backimageHeight*2)];
        [bigBtn setBackgroundColor:[UIColor clearColor]];
        
        [bigBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:bigBtn];
        
        
    }
    else
    {
        bigBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 5
                                                                      , _backimageWidth*3, _backimageHeight*2)];
        [bigBtn setBackgroundColor:[UIColor clearColor]];
        
        [bigBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:bigBtn];
        
        
    }
    if (!iPhone5&&!iOS_7) {
        [bigBtn setFrame:CGRectMake(5, -15
                                              , _backimageWidth*3, _backimageHeight*2)];
    }
    UIButton *backButton;
    if (iOS_7) {
        backButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 35, _backimageWidth,_backimageHeight)];
        [backButton setImage:_backImage forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backButton];
    }
    else
    {
        backButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 15, _backimageWidth,_backimageHeight)];
        [backButton setImage:_backImage forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backButton];
        
    }
    if (!iPhone5&&!iOS_7) {
        [backButton setFrame:CGRectMake(15, -5, _backimageWidth,_backimageHeight)];
    }
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
        [self sendRequestByGet:m_oldpic];
    
}
-(void)setdetailView:(NSString*)label :(NSURL*)url
{
    UIView* e_detailView = [[UIView alloc] init];
    
    __block size_t height;
    __block size_t width;
    UIImageView *imageView = [[UIImageView alloc] init];
    
    
    [imageView setImageWithURL:url placeholderImage:nil options:SDWebImageCacheMemoryOnly completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        height = CGImageGetHeight(image.CGImage)/2;
        width = CGImageGetWidth(image.CGImage)/2;
        [imageView setFrame:CGRectMake(0, 0, width, height)];
        // 内容模式
        //        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [e_detailView addSubview:imageView];
        CGSize infoSize = [label sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(m_scrollerView.frame.size.width,2000)];
        
        float infoheight  = infoSize.height+10;
        UILabel *_text = [[UILabel alloc] initWithFrame:CGRectMake(10, height+2, 276, infoheight)];
        _text.backgroundColor = [UIColor clearColor];
        _text.text = label;
        _text.userInteractionEnabled = NO;
        _text.lineBreakMode = UILineBreakModeWordWrap;
        //        [_text sizeToFit];
        //        _text.editable = NO;
        _text.font = [UIFont systemFontOfSize:14.0];
        _text.contentMode = UIViewContentModeTop;
        _text.textAlignment = UITextAlignmentLeft;
        _text.numberOfLines = 0;
        [e_detailView addSubview:_text];
        
        [e_detailView setFrame:CGRectMake(0, _imageView.frame.size.height+28+m_infoHeight+detaily+_calcSize.height+3
            , m_scrollerView.frame.size.width,
         height+2+infoheight+20)];
        
        detaily = detaily +infoheight+height+2;
        [m_scrollerView setContentSize:CGSizeMake(279, _imageView.frame.size.height+detaily+m_infoHeight+20+_calcSize.height+12)];
        [m_scrollerView addSubview:e_detailView];
        
        
    }];
}


-(void)setM_timeInfo:(NSString *)timeInfo
{
    [m_timeLable setText:timeInfo];
    
}
-(void)setM_titleInfo:(NSString *)titleInfo
{
    [m_titleLabel setText:titleInfo];
    
}
- (void)sendRequestByGet:(NSString*)urlString
{
    
    NSURL *url=[NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:url
                                    cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                    timeoutInterval:60];
    //设置请求方式为get
    [request setHTTPMethod:@"GET"];//POST
    //添加用户会话id
    [request addValue:@"text/html" forHTTPHeaderField:@"Content-Type"];
    //连接发送请求
    
    receivedData=[[NSMutableData alloc] initWithData:nil];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (conn != nil) {
        //创建成功
    }
    else {
        
    }
    [request release];
    
    [conn release];
    HUD = [[MBProgressHUD showHUDAddedTo:self.view animated:YES] retain];
    HUD.delegate = self;
    HUD.labelText = @"等待中...";
}
//服务器提供了足够客户程序创建NSURLResponse对象的信息时

- (void)connection:(NSURLConnection *)aConn didReceiveResponse:(NSURLResponse *)response {
    [receivedData setLength:0];
    
}

//接收NSData数据

- (void)connection:(NSURLConnection *)aConn didReceiveData:(NSData *)data {
    
    [receivedData appendData:data];
    
}
- (void)connection:(NSURLConnection *)aConn didFailWithError:(NSError *)error{
    NSLog(@"Connection failed! Error - %@ %@",
          
          [error localizedDescription],
          
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    [HUD hide:YES];
    [receivedData release];
}

//接收完毕,显示结果
//558*278
- (void)connectionDidFinishLoading:(NSURLConnection *)aConn {
    m_image = [UIImage imageWithData:receivedData];
    m_imageHeight = CGImageGetHeight(m_image.CGImage)/2;
    m_imageWidth = CGImageGetWidth(m_image.CGImage)/2;
    
    
    
    [HUD hide:YES];
    
    [receivedData release];
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-30,m_imageHeight)];
    _imageView.image = m_image;
    _imageView.backgroundColor = [UIColor clearColor];
    
    [m_scrollerView addSubview:_imageView];
    m_calcSize = [[m_info objectAtIndex:0] sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(200,2000)];
    m_infoHeight = m_calcSize.height;
    m_timeLable.font = [UIFont systemFontOfSize:12];
    m_timeLable.textColor = [UIColor grayColor];
    [m_timeLable setFrame:CGRectMake(10,_imageView.frame.size.height ,100,20)];
    
    
    [m_timeLable setBackgroundColor:[UIColor clearColor]];
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(m_timeLable.frame.size.width+12, _imageView.frame.size.height+10, 167, 1)];
    
    line.image = [UIImage imageNamed:@"line.png"];
    
    [m_scrollerView addSubview:line];
    
    [m_scrollerView addSubview:m_timeLable];
    
     _calcSize = [m_titleLabel.text sizeWithFont:[UIFont systemFontOfSize:26] constrainedToSize:CGSizeMake(270,2000)];
    
    [m_titleLabel setFrame:CGRectMake(8, _imageView.frame.size.height+13,276 , _calcSize.height)];
    
    m_titleLabel.numberOfLines = 0;
    
    m_titleLabel.lineBreakMode = UILineBreakModeClip;
    
    [m_titleLabel setBackgroundColor:[UIColor clearColor]];
    
    m_titleLabel.font = [UIFont systemFontOfSize:26];
    
    [m_scrollerView addSubview:m_titleLabel];
    
    
    UIImageView *line2 = [[UIImageView alloc]initWithFrame:CGRectMake(11,  _imageView.frame.size.height+_calcSize.height+14, 268, 1)];
    
    line2.image = [UIImage imageNamed:@"line.png"];
    
    [m_scrollerView addSubview:line2];
    
    
    
    [ _infoLabel setFrame:CGRectMake(10, _imageView.frame.size.height+_calcSize.height+17, 276, m_infoHeight+10)];
    
    _infoLabel.textColor = [UIColor blackColor];
    _infoLabel.contentMode = UIViewContentModeTop;
    _infoLabel.textAlignment = UITextAlignmentLeft;
    _infoLabel.font = [UIFont systemFontOfSize:14];
    //    [_infoLabel sizeToFit];
    _infoLabel.numberOfLines = 0;
    _infoLabel.lineBreakMode = UILineBreakModeWordWrap;
    _infoLabel.userInteractionEnabled = NO;
    _infoLabel.backgroundColor = [UIColor clearColor];
    [m_scrollerView addSubview:_infoLabel];
    
    //    [m_photoView  setFrame:CGRectMake(0, _imageView.frame.size.height+60+m_infoHeight, m_width, m_height)];
    //       m_photoView.backgroundColor = [UIColor whiteColor];
    //    [m_scrollerView addSubview:m_photoView];
    
    for (int k = 0; k<[_urls count]; k++) {
        [self setdetailView:[m_info objectAtIndex:k+1] :[NSURL URLWithString:[_urls objectAtIndex:k]]];
    }
    
    
}
-(void)setM_info:(NSMutableArray *)info
{
    m_info =info;
    _infoLabel.text = [m_info objectAtIndex:0];
}
#pragma mark 最上面的图片
-(void)setUrls:(NSArray *)urls
{
    _urls = urls;
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
