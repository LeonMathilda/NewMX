//
//  IndexViewController.m
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//TIPS：
////分享图标更改
//显示状态栏
//首页图片
#import "IndexViewController.h"
#import "indexCell.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"


@interface IndexViewController ()

@end

@implementation IndexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark  写入请求内容
/******文件写入******/
-(void)writeFile:(NSString *)file
{
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];

       //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取路径
    //参数NSDocumentDirectory要获取那种路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"paths=%@",paths);
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
    //创建文件fileName文件名称，contents文件的内容，如果开始没有内容可以设置为nil，attributes文件的属性，初始为nil
    m_contentpath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"indexcontent_%@.txt",myDelegate.currentLanguage ]];
    
    //获取文件路径
    [fileManager removeItemAtPath:m_contentpath error:nil];
    
    //创建数据缓冲
    NSMutableData *writer = [[NSMutableData alloc] init];
    //将字符串添加到缓冲中
    
    [writer appendData:[file dataUsingEncoding:NSUTF8StringEncoding]];
    
    //将缓冲的数据写入到文件中
    [writer writeToFile:m_contentpath atomically:YES];
    [writer release];
}
/******文件读取******/
-(NSString *)readFile
{
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取路径
    //参数NSDocumentDirectory要获取那种路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    //更改到待操作的目录下
    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
    //    //获取文件路径
    
    NSData *reader = [NSData dataWithContentsOfFile:m_contentpath];
    return [[NSString alloc] initWithData:reader
                                 encoding:NSUTF8StringEncoding];
}
#pragma mark 写入时间戳
/******文件写入******/
-(void)writeTimeFile:(NSString *)file
{
     AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取路径
    //参数NSDocumentDirectory要获取那种路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    //更改到待操作的目录下
    //    NSLog(@"[documentsDirectory stringByExpandingTildeInPath]=%@",[documentsDirectory stringByExpandingTildeInPath]);
    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
    //创建文件fileName文件名称，contents文件的内容，如果开始没有内容可以设置为nil，attributes文件的属性，初始为nil
    read_path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"indexTime_%@.txt",myDelegate.currentLanguage ]];
    NSLog(@"path=%@",read_path);
    //获取文件路径
    [fileManager removeItemAtPath:read_path error:nil];
    
    //创建数据缓冲
    NSMutableData *writer = [[NSMutableData alloc] init];
    //将字符串添加到缓冲中
    
    [writer appendData:[file dataUsingEncoding:NSUTF8StringEncoding]];
    
    //将缓冲的数据写入到文件中
    [writer writeToFile:read_path atomically:YES];
    [writer release];
}
/******文件读取******/
-(NSString *)readTimeFile
{
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取路径
    //参数NSDocumentDirectory要获取那种路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    //更改到待操作的目录下
    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
    //    //获取文件路径
    
    NSData *reader = [NSData dataWithContentsOfFile:read_path];
    return [[NSString alloc] initWithData:reader
                                 encoding:NSUTF8StringEncoding];
}
#pragma mark 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
//    add = 0;
     AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    _ary = [[NSArray alloc] init];

    m_rectArray = [[NSMutableArray alloc] init]
    ;    min = 0;
    add2 = 0;
    table = 0;
    m_timeArray = [[NSMutableArray alloc] init];
    
    passaryary = [[NSMutableArray alloc] init];
    _infoAry = [[NSMutableArray alloc] init];
    //  程序中主UI绘制
    
    UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"base.png"]];
      if (iOS_7) {
          [img setFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
      }
    else
    {
          [img setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

    }
    [self.view addSubview:img];
    [img release];
    
    UIImage *_titleImg = [UIImage imageNamed:@"Navigation bar.png"];
    size_t titleHeight = CGImageGetHeight(_titleImg.CGImage)/2;
    size_t titleWidth = CGImageGetWidth(_titleImg.CGImage)/2;
    height = titleHeight;
    _imageView = [[UIImageView alloc] initWithImage:_titleImg];
    if (iOS_7) {
          _imageView.frame = CGRectMake(0, 20, titleWidth, titleHeight);
    }else{
    _imageView.frame = CGRectMake(0, 0, titleWidth, titleHeight);
    }
    if (!iPhone5&&!iOS_7) {
        _imageView.frame = CGRectMake(0, -20, titleWidth, titleHeight);
 
        
    }
    [self.view addSubview:_imageView];
    if (iOS_7) {
    m_infoTableView = [[UITableView alloc]initWithFrame:CGRectMake(15,72, self.view.frame.size.width-30, self.view.frame.size.height-120) style:UITableViewStylePlain];
    }
    else
    {
    m_infoTableView = [[UITableView alloc]initWithFrame:CGRectMake(15,52, self.view.frame.size.width-30, self.view.frame.size.height-100) style:UITableViewStylePlain];
    }
    if (!iPhone5&&!iOS_7) {
        m_infoTableView = [[UITableView alloc]initWithFrame:CGRectMake(15,32, self.view.frame.size.width-30, self.view.frame.size.height-80) style:UITableViewStylePlain];
        
    }
    height = 58;
    m_infoTableView.backgroundColor = [UIColor clearColor];
    m_infoTableView.separatorColor = [UIColor clearColor];
    m_infoTableView.delegate = self;
    m_infoTableView.dataSource = self;
    m_infoTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:m_infoTableView];
//           table = m_infoTableView.frame.size.height+58;
    if (_refreshHeaderView == nil) {
        EGORefreshTableHeaderView * view = nil;
        if (iOS_7) {
        view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0-m_infoTableView.bounds.size.height, m_infoTableView.frame.size.width, m_infoTableView.bounds.size.height)];
        }else
        {
         view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0-m_infoTableView.bounds.size.height, m_infoTableView.frame.size.width, m_infoTableView.bounds.size.height)];
                }
        if (!iPhone5&&!iOS_7) {
          view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0-m_infoTableView.bounds.size.height-20, m_infoTableView.frame.size.width, m_infoTableView.bounds.size.height)];
        }
        view.delegate = self;
        [m_infoTableView addSubview:view];
        _refreshHeaderView = view;
        [view release];
    }
    [_refreshHeaderView refreshLastUpdatedDate];
    //  初始化全局变量
    image_Array = [[NSMutableArray alloc] init];
    //    获取当前页内容的路径
    m_contentpath = [[NSString alloc] init];
    NSArray *content_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *content_documentsDirectory = [content_paths objectAtIndex:0];

    m_contentpath = [content_documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"indexcontent_%@.txt",myDelegate.currentLanguage]];
    [m_contentpath retain];
    passAry = [[NSMutableArray alloc] init];
    
    //    _info = [[NSArray alloc] init];
       //获取当前页时间戳路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    read_path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"indexTime_%@.txt",myDelegate.currentLanguage]];
    //定义url
   
    NSFileManager *fileManager = [NSFileManager defaultManager];
   
    if (![fileManager fileExistsAtPath:read_path]) {
        _urlString = [NSString stringWithFormat:@"http://115.29.148.86/Blogbg/Server.php?act=getSendinfo&language=%@&longtime=0",myDelegate.currentLanguage];
    }else
    {
        _urlString = [NSString stringWithFormat:@"http://115.29.148.86/Blogbg/Server.php?act=getSendinfo&language=%@&longtime=%@",myDelegate.currentLanguage,[self readTimeFile]];
    }
    
    //    发起请求
        [self sendRequestByGet:_urlString];
    UIImage *_mailImg = [UIImage imageNamed:@"refresh.png"];
    
    size_t mailHeight = CGImageGetHeight(_mailImg.CGImage)/1.8;
    
    size_t mailWidth = CGImageGetWidth(_mailImg.CGImage)/1.8;
    UIButton *bigBtn;
    if (iOS_7) {
        bigBtn = [[UIButton alloc] initWithFrame:CGRectMake(250, 30, mailHeight*5, mailHeight*2)];
        
        [bigBtn setBackgroundColor:[UIColor clearColor]];
        
        [bigBtn addTarget:self action:@selector(refers) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:bigBtn];
    }else
    {
        bigBtn = [[UIButton alloc] initWithFrame:CGRectMake(250, 10, mailHeight*5, mailHeight*2)];
        
        [bigBtn setBackgroundColor:[UIColor clearColor]];
        
        [bigBtn addTarget:self action:@selector(refers) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:bigBtn];
    }
    if (!iPhone5&&!iOS_7) {
        [bigBtn setFrame:CGRectMake(250, -10, mailHeight*5, mailHeight*2)];
    }
    UIButton *_mailBtn;
    if (iOS_7) {
        _mailBtn = [[UIButton alloc] initWithFrame:CGRectMake(270, 30, mailWidth, mailHeight)];
        [_mailBtn addTarget:self action:@selector(refers) forControlEvents:UIControlEventTouchUpInside];
        
        [_mailBtn setImage:_mailImg forState:UIControlStateNormal];
        
        [self.view addSubview:_mailBtn];
        
    }
    else
    {
        _mailBtn = [[UIButton alloc] initWithFrame:CGRectMake(270, 10, mailWidth, mailHeight)];
        [_mailBtn addTarget:self action:@selector(refers) forControlEvents:UIControlEventTouchUpInside];
        [_mailBtn setImage:_mailImg forState:UIControlStateNormal];
        [self.view addSubview:_mailBtn];
        
    }
    if (!iPhone5&&!iOS_7) {

        [_mailBtn setFrame:CGRectMake(270, -10, mailWidth, mailHeight)];
       }
}
-(void)refers
{
  
    [m_infoTableView setContentOffset:CGPointMake(0, -90)];
    [self performSelectorOnMainThread:@selector(pushSecondController) withObject:nil waitUntilDone:YES];

}
-(void)pushSecondController
{
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:m_infoTableView];
    [self performSelector:@selector(again) withObject:nil afterDelay:0.2f];
}
-(void)again
{
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:m_infoTableView];


}
#pragma mark 当前页的动画
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    currentPositiion = scrollView.contentOffset.y;
    
}
#pragma mark 网络请求
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

- (void)connection:(NSURLConnection *)aConn didReceiveResponse:(NSURLResponse *)response
{
    
    [receivedData setLength:0];
    
}

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



- (void)connectionDidFinishLoading:(NSURLConnection *)aConn {
    
    m_dic = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingAllowFragments error:nil];
    
    NSLog(@"===========================%@",m_dic);
    
    NSString *longtime =  [m_dic objectForKey:@"newtime"];
    
    [self writeTimeFile:[NSString stringWithFormat:@"%@",longtime]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:m_contentpath])
    {
        NSArray *new = [[m_dic objectForKey:@"change"] objectForKey:@"newInfo"];
        [self writeFile:[NSString stringWithFormat:@"%@",new]];
        [self operatStringFirstTime:[self readFile]];
    }
    else{
        [self operatString:[self readFile]];
    }
    [receivedData release];
    [HUD hide:YES];
    
}
#pragma mark 处理结果
-(void)operatStringFirstTime:(NSString*)str
{
    content_Array = [[NSMutableArray alloc] initWithContentsOfFile:m_contentpath];
    NSLog(@"****************%@",content_Array);
    
    NSLog(@"%d",[content_Array count]);
    [self oprateArry];
    [m_infoTableView reloadData];
}
-(void)operatString:(NSString*)str
{
    
    content_Array = [[NSMutableArray alloc] initWithContentsOfFile:m_contentpath];
    NSArray *add = [[m_dic objectForKey:@"change"] objectForKey:@"newInfo"];
    for (int i = 0; i<[add count]; i++) {
        [content_Array insertObject:[add objectAtIndex:i] atIndex:0];
    }
    
    NSArray* del =  [[m_dic objectForKey:@"change"] objectForKey:@"deleteInfo"];
    for (int i = 0; i<[del count]; i++) {
        for (int j = 0; j<[content_Array count]; j++) {
            if ([[NSString stringWithFormat:@"%@",[[del objectAtIndex:i] objectForKey:@"deleteid"]]isEqualToString:[NSString stringWithFormat:@"%@",[[content_Array objectAtIndex:j] objectForKey:@"id"]] ])
            {
                [content_Array removeObjectAtIndex:j];
            }
        }
    }
    //    更新字符串
    NSArray *update = [[m_dic objectForKey:@"change"] objectForKey:@"updateInfo"];
    for (int i = 0; i<[update count]; i++) {
        for (int j = 0;j<[content_Array count]; j++) {
            if ([[NSString stringWithFormat:@"%@",[[update objectAtIndex:i] objectForKey:@"id"]]isEqualToString:[NSString stringWithFormat:@"%@",[[content_Array objectAtIndex:j] objectForKey:@"id"]]] ){
                [content_Array removeObjectAtIndex:j];
                [content_Array insertObject:[update objectAtIndex:i] atIndex:j];
            }
        }
    }
    [self writeFile:[NSString stringWithFormat:@"%@",content_Array]];
    NSLog(@"%@",content_Array);
    NSLog(@"%d",[content_Array count]);
    [self oprateArry];
    [m_infoTableView reloadData];
}
-(void)oprateArry
{
    [_infoAry removeAllObjects];
    [passaryary removeAllObjects];
    [m_timeArray removeAllObjects];
    for (int i = 0; i<[content_Array count]; i++) {
        _info = [[content_Array objectAtIndex:i] objectForKey:@"information"];
        [_infoAry addObject:_info];
        _ary = [[content_Array objectAtIndex:i] objectForKey:@"picname"];
        

        [passaryary addObject:_ary];
    }
    
    for (int i = 0; i<[content_Array count]; i++) {
        
        [m_timeArray addObject:[[content_Array objectAtIndex:i] objectForKey:@"mktime" ]];
        
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [content_Array count]*2-1;
}

#pragma mark 列表视图
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    static NSString *CellWithIdentifier2= @"Cell2";
    NSLog(@"================%d",indexPath.row);
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier2];
    indexCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (indexPath.row%2 == 1) {
        if (!cell2) {
            cell2 = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier2] autorelease];
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;
            cell2.backgroundColor = [UIColor clearColor];
        }
        return cell2;
        
    }else{
        
        cell = [[[indexCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier] autorelease];
            
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
    

        cell.urls = [passaryary objectAtIndex:indexPath.row/2];
        
        cell.minfo = [_infoAry objectAtIndex:indexPath.row/2];
        
        cell.mtime = [m_timeArray objectAtIndex:indexPath.row/2];

        
        if (indexPath.row/2<3) {
            [cell showNewLable:YES];
        }
     
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%2 != 0) {
        return 15;
    }else{
        UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
      
        return cell.frame.size.height;
    }
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];

    NSArray *content_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *content_documentsDirectory = [content_paths objectAtIndex:0];
    m_contentpath = [content_documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"indexcontent_%@.txt",myDelegate.currentLanguage]];
    [m_contentpath retain];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    read_path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"indexTime_%@.txt",myDelegate.currentLanguage ]];

    _urlString = [NSString stringWithFormat:@"http://115.29.148.86/Blogbg/Server.php?act=getSendinfo&language=%@&longtime=%@",myDelegate.currentLanguage,[self readTimeFile]];
    
    //    发起请求
        [self sendRequestByGet:_urlString];

	_reloading = YES;
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:m_infoTableView];
	
}
#pragma mark -
#pragma mark UIScrollViewDelegate Methods



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading;
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; 	
}


#pragma mark 内存事件处理
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
