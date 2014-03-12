//
//  ClassificationViewController.m
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import "ClassificationViewController.h"
#import "detailViewController.h"
#import "SetViewController.h"
#import "PropertiesViewController.h"
#import "MakeUpViewController.h"
#import "CustomViewController.h"
@interface ClassificationViewController ()

@end

@implementation ClassificationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    }
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aboutback.png"]];
    if (iOS_7) {
        [img setFrame:CGRectMake(0, 20, img.frame.size.width/2, img.frame.size.height/2)];

    }
    else
    {
    
        [img setFrame:CGRectMake(0, 0, img.frame.size.width/2, img.frame.size.height/2)];
     
    }
    if (!iPhone5&&!iOS_7) {
        [img setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];

    }
       [self.view addSubview:img];
    [img release];
    UIScrollView *_scrollerView = nil;
    if (iPhone5) {
        _scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, 320, self.view.frame.size.height-50)];
        _scrollerView.contentSize = CGSizeMake(320,249*2-10);

    }
    else
        
    {
     _scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, 320, self.view.frame.size.height-50)];
        [_scrollerView setContentSize:CGSizeMake(320, 520)];
    }
    if (!iPhone5&&!iOS_7) {
         _scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, -20, 320, self.view.frame.size.height-30)];
         _scrollerView.contentSize = CGSizeMake(320,249*2+10);
    }
    _scrollerView.showsHorizontalScrollIndicator = NO;
       _scrollerView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollerView];
    UIImage *_MakeUpImg = [UIImage imageNamed:@"makeupbtn.png"];
    UIImage *_MakeUpDownImg = [UIImage imageNamed:@"makeup 选中.png"];
    UIImage *_SetImg = [UIImage imageNamed:@"setbtn.png"];
    UIImage *_SetDownImg = [UIImage imageNamed:@"set 选中.png"];
    UIImage *_propertiesbtnImg = [UIImage imageNamed:@"propertiesbtn.png"];
    UIImage *_propertiesbtnDownImg = [UIImage imageNamed:@"properties 选中.png"];
    UIImage *_costumebtnUpImg = [UIImage imageNamed:@"costumebtn.png"];
    UIImage *_costumebtnDownImg = [UIImage imageNamed:@"costume 选中.png"];
    
    size_t _imageHeight = CGImageGetHeight(_MakeUpImg.CGImage);
    
    
    UIButton *_MakeUpButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320,_imageHeight/2)];
    [_MakeUpButton setImage:_MakeUpImg forState:UIControlStateNormal];
    [_MakeUpButton setImage:_MakeUpDownImg forState:UIControlStateHighlighted];
    [_MakeUpButton addTarget:self action:@selector(GoToMakeUp) forControlEvents:UIControlEventTouchUpInside];
    CATransition *animation = [CATransition animation];
    
    animation.duration = 0.25;
    animation.startProgress = 1;
    
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    animation.fillMode = kCATransitionFromBottom;
    
    animation.type = kCATransitionFromBottom;
//    animation.subtype = kCATransitionFromTop;
    [_MakeUpButton.layer addAnimation:animation forKey:@"animation"];
    [_MakeUpButton.layer addAnimation:animation forKey:@"animation"];
    
    [_scrollerView addSubview:_MakeUpButton];
    
    
    UIButton *_propertiesBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _imageHeight/2, 320,_imageHeight/2)];
    [_propertiesBtn setImage:_propertiesbtnImg forState:UIControlStateNormal];
    [_propertiesBtn setImage:_propertiesbtnDownImg forState:UIControlStateHighlighted];
    [_propertiesBtn addTarget:self action:@selector(GoToProperties) forControlEvents:UIControlEventTouchUpInside];
    CATransition *animation1 = [CATransition animation];
    
    animation1.duration = 0.5;
    animation1.startProgress = 2;
    animation1.timingFunction = UIViewAnimationCurveEaseInOut;
    animation1.fillMode = kCATransitionFromBottom;
    
    animation1.type = kCATransitionMoveIn;
    animation1.subtype = kCATransitionFromBottom;
    [_propertiesBtn.layer addAnimation:animation1 forKey:@"animation1"];
    [_propertiesBtn.layer addAnimation:animation1 forKey:@"animation1"];
    
    [_scrollerView addSubview:_propertiesBtn];
    
    
    UIButton *_customBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _imageHeight/2*2, 320,_imageHeight/2)];
    [_customBtn setImage:_costumebtnUpImg forState:UIControlStateNormal];
    [_customBtn setImage:_costumebtnDownImg forState:UIControlStateHighlighted];
    [_customBtn addTarget:self action:@selector(GoTocustom) forControlEvents:UIControlEventTouchUpInside];
    CATransition *animation2 = [CATransition animation];
    
    animation2.duration = 0.75;
    animation2.startProgress = 3;
    animation2.timingFunction = UIViewAnimationCurveEaseInOut;
    animation2.fillMode = kCATransitionFromBottom;
    
    animation2.type = kCATransitionMoveIn;
    animation2.subtype = kCATransitionFromBottom;
    [_customBtn.layer addAnimation:animation2 forKey:@"animation2"];
    [_customBtn.layer addAnimation:animation2 forKey:@"animation2"];
    
    [_scrollerView addSubview:_customBtn];
    
    
    
    UIButton *_setBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _imageHeight/2*3, 320,_imageHeight/2+5)];
    [_setBtn setImage:_SetImg forState:UIControlStateNormal];
    [_setBtn setImage:_SetDownImg forState:UIControlStateHighlighted];
    [_setBtn addTarget:self action:@selector(GoToSet) forControlEvents:UIControlEventTouchUpInside];
    CATransition *animation3 = [CATransition animation];
    
    animation3.duration = 1;
     animation3.startProgress = 4;
    animation3.timingFunction = UIViewAnimationCurveEaseInOut;
    animation3.fillMode = kCATransitionPush;
    
    animation3.type = kCATransitionMoveIn;
    animation3.subtype = kCATransitionFromBottom;
    [_setBtn.layer addAnimation:animation3 forKey:@"animation3"];
    [_setBtn.layer addAnimation:animation3 forKey:@"animation3"];
    [_scrollerView addSubview:_setBtn];
    


}
-(void)GoToMakeUp
{
    MakeUpViewController *_makeUpVC = [[MakeUpViewController alloc] init];
    
    [self.navigationController pushViewController:_makeUpVC animated:YES];
    
    [_makeUpVC release];

}
-(void)GoToProperties
{
    PropertiesViewController *_propertiesVC = [[PropertiesViewController alloc] init];
    
    [self.navigationController pushViewController:_propertiesVC animated:YES];
    
    [_propertiesVC release];
}
-(void)GoToSet{
    
    SetViewController *_setVC = [[SetViewController alloc] init];
    
    [self.navigationController pushViewController:_setVC animated:YES];
    
    [_setVC release];
}

-(void)GoTocustom
{
    CustomViewController *_customVC = [[CustomViewController alloc] init];
    
    [self.navigationController pushViewController:_customVC animated:YES];
    
    [_customVC release];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
