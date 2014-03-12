//
//  AboutViewController.m
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import "AboutViewController.h"
#import "IntroduceViewController.h"
#import "AppDelegate.h"
@interface AboutViewController ()

@end

@implementation AboutViewController

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
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取路径
    //参数NSDocumentDirectory要获取那种路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"paths=%@",paths);
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
    //创建文件fileName文件名称，contents文件的内容，如果开始没有内容可以设置为nil，attributes文件的属性，初始为nil
    m_contentpath = [documentsDirectory stringByAppendingPathComponent:@"abstractcontent.txt"];
    
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
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取路径
    //参数NSDocumentDirectory要获取那种路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];//去处需要的路径
    //更改到待操作的目录下
    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
    //创建文件fileName文件名称，contents文件的内容，如果开始没有内容可以设置为nil，attributes文件的属性，初始为nil
    read_path = [documentsDirectory stringByAppendingPathComponent:@"abstractTime.txt"];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    receivedData = [[NSMutableData alloc] init];
    UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aboutback.png"]];
    if (iOS_7) {
        [img setFrame:CGRectMake(0, 20, img.frame.size.width/2, img.frame.size.height/2)];
    }
    else
    {
        [img setFrame:CGRectMake(0, 0, img.frame.size.width/2, img.frame.size.height/2)];
    }
    
    [self.view addSubview:img];
    [img release];
    
    
    UIImage *_titleImg = [UIImage imageNamed:@"about us.png"];
    titleHeight = CGImageGetHeight(_titleImg.CGImage)/2;
    titleWidth = CGImageGetWidth(_titleImg.CGImage)/2;
    _imageView = [[UIImageView alloc] initWithImage:_titleImg];
    if (iOS_7) {
        _imageView.frame = CGRectMake(0, 20, titleWidth, titleHeight);
    }
    else
    {
        _imageView.frame = CGRectMake(0, 0, titleWidth, titleHeight);
    }
    
    [self.view addSubview:_imageView];
        AppDelegate *myDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];

    _urlString = [NSString stringWithFormat:@"http://115.29.148.86/Blogbg/image/oldimage/abstractpic_%@.png",myDelegate.currentLanguage];
    
    
        [self sendRequestByGet:_urlString];
    

    
    UIImage *_mailImg = [UIImage imageNamed:@"mail.png"];
    
    size_t mailHeight = CGImageGetHeight(_mailImg.CGImage)/1.8;
    
    size_t mailWidth = CGImageGetWidth(_mailImg.CGImage)/1.8;
    UIButton *bigBtn;
    if (iOS_7) {
        bigBtn = [[UIButton alloc] initWithFrame:CGRectMake(256, 32, mailHeight*5, mailHeight*2)];
        
        [bigBtn setBackgroundColor:[UIColor clearColor]];
        
        [bigBtn addTarget:self action:@selector(sendEMail) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:bigBtn];
    }else
    {
        bigBtn = [[UIButton alloc] initWithFrame:CGRectMake(256, 12, mailHeight*5, mailHeight*2)];
        
        [bigBtn setBackgroundColor:[UIColor clearColor]];
        
        [bigBtn addTarget:self action:@selector(sendEMail) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:bigBtn];
    }
//    if (!iPhone5&&!iOS_7) {
//        [bigBtn setFrame:CGRectMake(256, -12, mailHeight*5, mailHeight*2)];
//    }

    UIButton *_mailBtn;
    if (iOS_7) {
        _mailBtn = [[UIButton alloc] initWithFrame:CGRectMake(276, 38, mailWidth, mailHeight)];
        [_mailBtn addTarget:self action:@selector(sendEMail) forControlEvents:UIControlEventTouchUpInside];
        
        [_mailBtn setImage:_mailImg forState:UIControlStateNormal];
        
        [self.view addSubview:_mailBtn];
        
    }
    else
    {
      _mailBtn = [[UIButton alloc] initWithFrame:CGRectMake(276, 18, mailWidth, mailHeight)];
        [_mailBtn addTarget:self action:@selector(sendEMail) forControlEvents:UIControlEventTouchUpInside];
        
        [_mailBtn setImage:_mailImg forState:UIControlStateNormal];
        
        [self.view addSubview:_mailBtn];
        
    }
//    if (!iPhone5&&!iOS_7) {
//        [_mailBtn setFrame:CGRectMake(276, -18, mailWidth, mailHeight)];
//        
//    }
    
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
    
    UIImage *_Image = [UIImage imageWithData:receivedData];
    
    size_t _ImageHeight = CGImageGetHeight(_Image.CGImage)/2;
    
    
    
    if (iOS_7) {
        bkView = [[UIScrollView alloc] initWithFrame:CGRectMake(15,72 ,self.view.frame.size.width-30, self.view.frame.size.height-120)];
        bkView.backgroundColor = [UIColor clearColor];
    }
    else
    {
        bkView = [[UIScrollView alloc] initWithFrame:CGRectMake(15,52 , self.view.frame.size.width-30, self.view.frame.size.height-100
                                                                )];
        bkView.backgroundColor = [UIColor clearColor];

    }
    
//    if (!iPhone5&&!iOS_7) {
//        [bkView setFrame:CGRectMake(15,32 , self.view.frame.size.width-30, self.view.frame.size.height-80
//                                    )];
//    }
    [bkView setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:bkView];
    
    if (iOS_7) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 290, _ImageHeight)];
        imageView.image = _Image;
        
        imageView.backgroundColor = [UIColor clearColor];

        [bkView setContentSize:CGSizeMake(self.view.frame.size.width-30,_ImageHeight)];
        
        [bkView addSubview:imageView];
    }
    else
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 290, _ImageHeight)];
        imageView.image = _Image;
        
        imageView.backgroundColor = [UIColor clearColor];
        
        [bkView setContentSize:CGSizeMake(self.view.frame.size.width-30,_ImageHeight)];
        
        [bkView addSubview:imageView];
        
    }

       [receivedData release];
    [HUD hide:YES];
}

-(void)sendEMail
{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    if (mailClass != nil)
    {
        if ([mailClass canSendMail])
        {
            [self displayComposerSheet];
        }
        else
        {
            [self launchMailAppOnDevice];
        }
    }
    else
    {
        [self launchMailAppOnDevice];
    }
}
//可以发送邮件的话
-(void)displayComposerSheet
{
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
    
    mailPicker.mailComposeDelegate = self;
    
    //设置主题
    [mailPicker setSubject: @"发送邮件"];
    
    // 添加发送者
    NSArray *toRecipients = [NSArray arrayWithObject: @"CarlWang@newmx.com"];
    //NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com", @"third@example.com", nil];
    //NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com", nil];
    [mailPicker setToRecipients: toRecipients];
    //[picker setCcRecipients:ccRecipients];
    //[picker setBccRecipients:bccRecipients];
    
    // 添加图片
    UIImage *addPic = [UIImage imageNamed: @""];
    NSData *imageData = UIImagePNGRepresentation(addPic);            // png
    // NSData *imageData = UIImageJPEGRepresentation(addPic, 1);    // jpeg
    [mailPicker addAttachmentData: imageData mimeType: @"" fileName: @""];
    
    NSString *emailBody = @"";
    [mailPicker setMessageBody:emailBody isHTML:YES];
    
    [self presentModalViewController: mailPicker animated:YES];
    AppDelegate *_appdelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    //    [_appdelegate.leveyTabBarController hidesTabBar:YES animated:YES];
    
    [mailPicker release];
}
-(void)launchMailAppOnDevice
{
    NSString *recipients = @"mailto:first@example.com&subject=my email!";
    //@"mailto:first@example.com?cc=second@example.com,third@example.com&subject=my email!";
    NSString *body = @"&body=email body!";
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    email = [email stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:email]];
}
- (void)alertWithTitle:(NSString *)_title_ msg:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:_title_
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    NSString *msg;
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            msg = @"邮件发送取消";
            break;
        case MFMailComposeResultSaved:
            msg = @"邮件保存成功";
            [self alertWithTitle:nil msg:msg];
            break;
        case MFMailComposeResultSent:
            msg = @"邮件发送成功";
            [self alertWithTitle:nil msg:msg];
            break;
        case MFMailComposeResultFailed:
            msg = @"邮件发送失败";
            [self alertWithTitle:nil msg:msg];
            break;
        default:
            break;
    }
    [self dismissModalViewControllerAnimated:YES];
}


@end
