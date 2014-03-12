//
//  ProductViewCell.m
//  NewMX
//
//  Created by 李 昂 on 13-9-20.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import "ProductViewCell.h"
#import "UIImageView+WebCache.h"
@implementation ProductViewCell
@synthesize m_productImg;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        m_productImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 3, self.frame.size.width, 139)];
//        m_productImg.contentMode = UIViewContentModeScaleAspectFit;
//        m_productImg.autoresizesSubviews = YES;
//        m_productImg.autoresizingMask =
//        UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        m_productImg.userInteractionEnabled = NO;

        [self loadView];
    }
    return self;
}
//558*278
-(void)loadView
{
    [self setBackgroundColor:[UIColor clearColor]];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 5)];
    view.backgroundColor = [UIColor clearColor];
    [self addSubview:view];
    UIImage *_logImg = [UIImage imageNamed:@"work logo.png"];
    size_t imageWidth = CGImageGetWidth(_logImg.CGImage)/2;
    size_t imageHeight = CGImageGetHeight(_logImg.CGImage)/2;
    UIButton *_logoBtn = [[UIButton alloc] initWithFrame:CGRectMake(8, 0, imageWidth, imageHeight)];
    [_logoBtn setImage:_logImg forState:UIControlStateNormal];

    [self addSubview:m_productImg];
    UIImage *_clockImg = [UIImage imageNamed:@"clock.png"];
    size_t imageWidth1 = CGImageGetWidth(_clockImg.CGImage)/2;
    size_t imageHeight1 = CGImageGetHeight(_clockImg.CGImage)/2;
    
    UIButton *_timeBtn = [[UIButton alloc] initWithFrame:CGRectMake(10,134-imageHeight1, imageWidth1, imageHeight1)];
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(26, 134-imageHeight1, 300, imageHeight1)];
    timeLabel.font = [UIFont systemFontOfSize:12];
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:timeLabel];

    [_timeBtn setImage:_clockImg forState:UIControlStateNormal];
    [self addSubview:_timeBtn];
    UIImage *_arImg = [UIImage imageNamed:@"arrow right.png"];
    size_t imageWidth2 = CGImageGetWidth(_arImg.CGImage)/2;
    size_t imageHeight2 = CGImageGetHeight(_arImg.CGImage)/2;
    
    UIButton *_arBtn = [[UIButton alloc] initWithFrame:CGRectMake(270,22, imageWidth2, imageHeight2)];
    [_arBtn setImage:_arImg forState:UIControlStateNormal];
    [self addSubview:_arBtn];
    
    
    [self addSubview:_logoBtn];
}
-(void)setMurl:(NSString *)murl
{
    _murl = murl;
    [m_productImg setImageWithURL:[NSURL URLWithString:_murl]];

}
-(void)setMtime:(NSString *)time
{
  
    [timeLabel setText:time];
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
