//
//  IntroduceViewController.m
//  NewMX
//
//  Created by 李昂 on 13-9-11.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import "IntroduceViewController.h"
#import "AppDelegate.h"

@interface IntroduceViewController ()

@end

@implementation IntroduceViewController

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
    m_contentpath = [documentsDirectory stringByAppendingPathComponent:@"indexcontent.txt"];
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
    read_path = [documentsDirectory stringByAppendingPathComponent:@"indexTime.txt"];
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
    UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    [self.view addSubview:img];
    [img release];
//    [_appdelegate.leveyTabBarController hidesTabBar:YES animated:YES];
    _introduceImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/4)];
    _introduceImg.image = [UIImage imageNamed:@"gibson.jpg"];
    [self.view addSubview:_introduceImg];
    UIButton *closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(300, 0, 20, 20)];
    closeBtn.backgroundColor = [UIColor redColor];
    [closeBtn addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    
    read_path = [documentsDirectory stringByAppendingPathComponent:@"abstactTime.txt"];
    AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *_urlString;
    if (![fileManager fileExistsAtPath:read_path]) {
        _urlString = [NSString stringWithFormat:@"http://192.168.1.103/Blogbg/Server.php?act=getAbstract&language=%@&longtime=0",myDelegate.currentLanguage];
    }else
    {
        _urlString = [NSString stringWithFormat:@"http://192.168.1.103/Blogbg/Server.php?act=getAbstract&language=%@&longtime=%@",myDelegate.currentLanguage,[self readTimeFile]];
    }
        [self sendRequestByGet:_urlString];
    //    @"http://192.168.1.103/Blogbg/Server.php?act=getAbstract&language=chinese&longtime=1"
    //    getProduct
//http://192.168.1.103/Blogbg/Server.php?act=getAbstract&language=chinese&longtime=1
   
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

- (void)connectionDidFinishLoading:(NSURLConnection *)aConn {
    
    m_dic = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingAllowFragments error:nil];
    
    NSLog(@"%@",m_dic);
    
    NSString *longtime =  [m_dic objectForKey:@"newtime"];
    
    [self writeTimeFile:[NSString stringWithFormat:@"%@",longtime]];
   
//    {"newtime":1383458273,"newInfo":[{"id":1,"title":"dsf","language":"chinese","information":"adffasdfsdafsdfdasf","oldpic":"\/home\/caoshuyu\/www\/Blogbg\/image\/oldimage","smallpic":"\/home\/caoshuyu\/www\/Blogbg\/image\/smallimage","picname":"[\"16074601accb58783b7da1b647ed0b85.jpg\"]","time":1383455961}]}
    m_info = [[[m_dic objectForKey:@"newInfo"] objectAtIndex:0] objectForKey:@"information"];
    NSString *imageurl = [[[m_dic objectForKey:@"newInfo"] objectAtIndex:0] objectForKey:@"oldpic"];
    NSString *_imageurl = [imageurl stringByAppendingString:[[[[m_dic objectForKey:@"newInfo"] objectAtIndex:0] objectForKey:@"picname"] objectAtIndex:0]];
    [_introduceImg setImageWithURL:[NSURL URLWithString:_imageurl]];
    [receivedData release];
    [HUD hide:YES];
}-(void)closeView
{
    AppDelegate *_appdelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
//   [_appdelegate.leveyTabBarController hidesTabBar:NO animated:YES];
   [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
