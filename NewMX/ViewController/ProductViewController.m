//
//  ProductViewController.m
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//
//add time
//drag effict
//
#import "ProductViewController.h"
#import "ProductViewCell.h"
#include "detailViewController.h"
#import "AppDelegate.h"
#import "IntroduceViewController.h"

@interface ProductViewController ()

@end

@implementation ProductViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
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
    //    NSLog(@"documentsDirectory=%@",documentsDirectory);
    //更改到待操作的目录下
    //    NSLog(@"[documentsDirectory stringByExpandingTildeInPath]=%@",[documentsDirectory stringByExpandingTildeInPath]);
    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
    //创建文件fileName文件名称，contents文件的内容，如果开始没有内容可以设置为nil，attributes文件的属性，初始为nil
    m_contentpath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"productcontent_%@.txt",myDelegate.currentLanguage ]];
    //    NSLog(@"path=%@",m_contentpath);
    //获取文件路径
    [fileManager removeItemAtPath:m_contentpath error:nil];
    
    //创建数据缓冲
    NSMutableData *writer = [[NSMutableData alloc] init];
    //将字符串添加到缓冲中
    //    NSLog(@"[file dataUsingEncoding:NSUTF8StringEncoding]=%@",[file dataUsingEncoding:NSUTF8StringEncoding]);
    [writer appendData:[file dataUsingEncoding:NSUTF8StringEncoding]];
    //将其他数据添加到缓冲中
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
    //    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"username"];
    NSData *reader = [NSData dataWithContentsOfFile:m_contentpath];
    return [[NSString alloc] initWithData:reader
                                 encoding:NSUTF8StringEncoding];
}
/******文件写入******/
-(void)writeTimeFile:(NSString *)file
{
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];

    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取路径
    //参数NSDocumentDirectory要获取那种路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //    NSLog(@"paths=%@",paths);
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    //    NSLog(@"documentsDirectory=%@",documentsDirectory);
    //更改到待操作的目录下
    //    NSLog(@"[documentsDirectory stringByExpandingTildeInPath]=%@",[documentsDirectory stringByExpandingTildeInPath]);
    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
    //创建文件fileName文件名称，contents文件的内容，如果开始没有内容可以设置为nil，attributes文件的属性，初始为nil
    read_path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"productTime_%@.txt",myDelegate.currentLanguage ]];
    //    NSLog(@"path=%@",read_path);
    //获取文件路径
    [fileManager removeItemAtPath:read_path error:nil];
    
    //创建数据缓冲
    NSMutableData *writer = [[NSMutableData alloc] init];
    //将字符串添加到缓冲中
    //    NSLog(@"[file dataUsingEncoding:NSUTF8StringEncoding]=%@",[file dataUsingEncoding:NSUTF8StringEncoding]);
    [writer appendData:[file dataUsingEncoding:NSUTF8StringEncoding]];
    //将其他数据添加到缓冲中
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
    //    read_path = [documentsDirectory stringByAppendingPathComponent:@"username"];
    NSData *reader = [NSData dataWithContentsOfFile:read_path];
    return [[NSString alloc] initWithData:reader
                                 encoding:NSUTF8StringEncoding];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];

    infoArray = [[NSMutableArray alloc] init];
    m_timeArray = [[NSMutableArray alloc] init];
    image_Array = [[NSMutableArray alloc] init];
    content_Array = [[NSMutableArray alloc] init];
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
    UIImage *_titleImg = [UIImage imageNamed:@"Navigation bar 02.png"];
    size_t titleHeight = CGImageGetHeight(_titleImg.CGImage)/2;
    size_t titleWidth = CGImageGetWidth(_titleImg.CGImage)/2;
    _imageView = [[UIImageView alloc] initWithImage:_titleImg];
    if (iOS_7) {
        _imageView.frame = CGRectMake(0, 20, titleWidth, titleHeight);

    }else
    {
        _imageView.frame = CGRectMake(0, 0, titleWidth, titleHeight);

    }
    if (!iPhone5&&!iOS_7) {
        _imageView.frame = CGRectMake(0, -20, titleWidth, titleHeight);

    }
    [self.view addSubview:_imageView];
    if (iOS_7) {
        m_tableView = [[UITableView alloc]initWithFrame:CGRectMake(15, 70, self.view.frame.size.width-30, self.view.frame.size.height-119) style:UITableViewStylePlain];

    }else
    {
        m_tableView = [[UITableView alloc]initWithFrame:CGRectMake(15, 50, self.view.frame.size.width-30, self.view.frame.size.height-99) style:UITableViewStylePlain];

    }
    if (!iPhone5&&!iOS_7) {
        m_tableView = [[UITableView alloc]initWithFrame:CGRectMake(15, 30, self.view.frame.size.width-30, self.view.frame.size.height-79) style:UITableViewStylePlain];

        
    }
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    m_tableView.showsVerticalScrollIndicator = NO;
    m_tableView.userInteractionEnabled = YES;
    m_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    m_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:m_tableView];
    if (_refreshHeaderView == nil) {
        EGORefreshTableHeaderView * view = nil;
        if (iOS_7) {
            view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0-m_tableView.bounds.size.height, m_tableView.frame.size.width, m_tableView.bounds.size.height)];

        }
        else
        {
         view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0-m_tableView.bounds.size.height, m_tableView.frame.size.width, m_tableView.bounds.size.height)];
        }
        if (!iPhone5&&!iOS_7) {
            view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0-m_tableView.bounds.size.height-20, m_tableView.frame.size.width, m_tableView.bounds.size.height)];

        }
        view.delegate = self;
        [m_tableView addSubview:view];
        _refreshHeaderView = view;
        [view release];
    }
    [_refreshHeaderView refreshLastUpdatedDate];
    
    
    m_contentpath = [[NSString alloc] init];
    NSArray *content_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *content_documentsDirectory = [content_paths objectAtIndex:0];
    m_contentpath = [content_documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"productcontent_%@.txt",myDelegate.currentLanguage]];
    [m_contentpath retain];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    
    read_path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"productTime_%@.txt",myDelegate.currentLanguage ]];
    NSFileManager *fileManager = [NSFileManager defaultManager];
  
    if (![fileManager fileExistsAtPath:read_path]) {
        _urlString = [NSString stringWithFormat:@"http://115.29.148.86/Blogbg/Server.php?act=getProduct&language=%@&longtime=0",myDelegate.currentLanguage];
        NSLog(@"%@",_urlString);
    }else
    {
        _urlString = [NSString stringWithFormat:@"http://115.29.148.86/Blogbg/Server.php?act=getProduct&language=%@&longtime=%@",myDelegate.currentLanguage,[self readTimeFile]];
    }
    
        [self sendRequestByGet:_urlString];
    //    @"http://192.168.1.103/Blogbg/Server.php?act=getAbstract&language=chinese&longtime=1"
    //    getProduct
    //
    

}

-(void)pushSecondController
{
    //    [m_infoTableView setContentOffset:CGPointMake(0, -90) animated:YES];
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:m_tableView];
    
    
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
    [HUD setHidden:YES];
    [receivedData release];
}

//接收完毕,显示结果

- (void)connectionDidFinishLoading:(NSURLConnection *)aConn {
    
    m_dic = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingAllowFragments error:nil];
    
    NSLog(@"%@",m_dic);
    
    NSString *longtime =  [m_dic objectForKey:@"newtime"];
    
    [self writeTimeFile:[NSString stringWithFormat:@"%@",longtime]];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:m_contentpath])
    {
        NSArray *new = [[m_dic objectForKey:@"change"] objectForKey:@"newInfo"];
        NSLog(@"==========%@",new);
        [self writeFile:[NSString stringWithFormat:@"%@",new]];
        [self operatStringFirstTime:[self readFile]];
        
    }
    else{
        [self operatString:[self readFile]];
    }
    [HUD hide:YES];
    
    [receivedData release];
}
-(void)operatStringFirstTime:(NSString*)str
{
    content_Array = [[NSMutableArray alloc] initWithContentsOfFile:m_contentpath];
    for (int i = 0; i<[content_Array count]; i++) {
        
        [m_timeArray addObject:[[content_Array objectAtIndex:i] objectForKey:@"mktime" ]];
        
    }
    [m_tableView reloadData];
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
    NSArray *update = [[[m_dic objectForKey:@"change"] objectForKey:@"updateInfo"] retain];
    for (int i = 0; i<[update count]; i++) {
        for (int j = 0;j<[content_Array count]; j++) {
            if ([[NSString stringWithFormat:@"%@",[[update objectAtIndex:i] objectForKey:@"id"]]isEqualToString:[NSString stringWithFormat:@"%@",[[content_Array objectAtIndex:j] objectForKey:@"id"]] ] ){
                [content_Array removeObjectAtIndex:j];
                [content_Array insertObject:[update objectAtIndex:i] atIndex:j];
            }
        }
    }
    [self writeFile:[NSString stringWithFormat:@"%@",content_Array]];
    NSLog(@"aaaaaaaaaaaaaaaa%@",content_Array);
    [m_timeArray removeAllObjects];
    for (int i = 0; i<[content_Array count]; i++) {
        
        [m_timeArray addObject:[[content_Array objectAtIndex:i] objectForKey:@"mktime"]];

    }
    [m_tableView reloadData];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [content_Array count]*2-1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    static NSString *CellWithIdentifier1 = @"Cell2";
    ProductViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier1];
    if (indexPath.row%2 == 1) {
        if (!cell2)
        {
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier1];
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;
            cell2.backgroundColor = [UIColor clearColor];
            
        }
        return cell2;
    }else{
        if (cell == nil) {
            cell = [[[ProductViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier] autorelease];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSString *_Urlstr = [@"http://115.29.148.86/Blogbg/image/oldimage/" stringByAppendingString:[[[[content_Array objectAtIndex:indexPath.row/2] objectForKey:@"picname"] objectAtIndex:0] objectForKey:@"name"]];
        NSLog(@"%@",_Urlstr);
        cell.murl = _Urlstr;
        cell.mtime = [m_timeArray objectAtIndex:indexPath.row/2];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (1 == indexPath.row%2) {
        return 15;
    }else{
        return 139;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"kkkkkkkkkkkkkk,%@",content_Array);
    detailViewController *detailVC = [[detailViewController alloc]init];
    
    detailVC.m_oldpic = [NSString stringWithFormat:@"http://115.29.148.86/Blogbg/image/oldimage/%@",[[[[content_Array objectAtIndex:indexPath.row/2] objectForKey:@"picname"] objectAtIndex:0] objectForKey:@"name"]];

    NSMutableArray *_array =[[NSMutableArray alloc] init];
    
    for (int i = 1;i< [[[content_Array objectAtIndex:indexPath.row/2] objectForKey:@"picname"] count]; i++)
    {
        [_array addObject:[NSString stringWithFormat:@"http://115.29.148.86/Blogbg/image/oldimage/%@",[[[[content_Array objectAtIndex:indexPath.row/2] objectForKey:@"picname"] objectAtIndex:i]objectForKey:@"name" ]]];
    }


    detailVC.m_titleInfo = [[content_Array objectAtIndex:indexPath.row/2] objectForKey:@"title"];
    detailVC.m_timeInfo =[m_timeArray objectAtIndex:indexPath.row/2];
    detailVC.urls = _array;
    [infoArray removeAllObjects];
    for (int i = 0; i<[[[content_Array objectAtIndex:indexPath.row/2] objectForKey:@"picname"] count]; i++) {
        [infoArray addObject:[[[[content_Array objectAtIndex:indexPath.row/2] objectForKey:@"picname"] objectAtIndex:i] objectForKey:@"value"]];
    }
    NSLog(@"rrrrrrrr,%@",infoArray);
    detailVC.m_info = infoArray;
    [self.navigationController pushViewController:detailVC animated:YES];
    //    [detailVC release];
   
}
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];

	NSArray *content_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *content_documentsDirectory = [content_paths objectAtIndex:0];
    m_contentpath = [content_documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"productcontent_%@.txt",myDelegate.currentLanguage]];
    [m_contentpath retain];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    
    read_path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"productTime_%@.txt",myDelegate.currentLanguage]];
           _urlString = [NSString stringWithFormat:@"http://115.29.148.86/Blogbg/Server.php?act=getProduct&language=%@&longtime=%@",myDelegate.currentLanguage,[self readTimeFile]];
    
        
        [self sendRequestByGet:_urlString];

	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:m_tableView];
	
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

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
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end