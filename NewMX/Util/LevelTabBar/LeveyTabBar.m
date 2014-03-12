//
//  LeveyTabBar.m
//  LeveyTabBarController
//
//  Created by zhang on 12-10-10.
//  Copyright (c) 2012年 jclt. All rights reserved.
//
//

#import "LeveyTabBar.h"

@implementation LeveyTabBar
@synthesize backgroundView = _backgroundView;
@synthesize delegate = _delegate;
@synthesize buttons = _buttons;

- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray
{
    self = [super initWithFrame:frame];
    if (self)
	{
		self.backgroundColor = [UIColor blackColor];
		_backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
		[self addSubview:_backgroundView];
		
		self.buttons = [NSMutableArray arrayWithCapacity:[imageArray count]];
		UIButton *btn;
               
		for (int i = 0; i < [imageArray count]; i++)
		{
			btn = [UIButton buttonWithType:UIButtonTypeCustom];
			btn.showsTouchWhenHighlighted = NO;
            btn.adjustsImageWhenHighlighted  = NO;
			btn.tag = i;
			btn.frame = CGRectMake(129/2 * (i-1)+247/2, 0, 129/2, frame.size.height+1);
            if (i == 0) {
                btn.frame = CGRectMake(0, 0, 247/2, frame.size.height);
            }
            if (i == 3) {
                btn.frame = CGRectMake(129/2 * (i-1)+247/2, 0, 154/2, frame.size.height+1);

            }
			[btn setImage:[[imageArray objectAtIndex:i] objectForKey:@"Default"] forState:UIControlStateNormal];
			[btn setImage:[[imageArray objectAtIndex:i] objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
			[btn setImage:[[imageArray objectAtIndex:i] objectForKey:@"Seleted"] forState:UIControlStateSelected];
			[btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
			[self.buttons addObject:btn];
			[self addSubview:btn];
		}
        UIImage *_loadImg = [UIImage imageNamed:@"load.png"];
        m_loadimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,92,2.5)];
        m_loadimg.image = _loadImg;
        [self addSubview:m_loadimg];
    }
    return self;
}

- (void)setBackgroundImage:(UIImage *)img
{
	[_backgroundView setImage:img];
}

- (void)tabBarButtonClicked:(id)sender
{
	UIButton *btn = sender;
	[self selectTabAtIndex:btn.tag];
//    NSLog(@"Select index: %d",btn.tag);
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)])
    {
        [_delegate tabBar:self didSelectIndex:btn.tag];
    }
}

- (void)selectTabAtIndex:(NSInteger)index
{
    
	for (int i = 0; i < [self.buttons count]; i++)
	{
      
		UIButton *b = [self.buttons objectAtIndex:i];
		b.selected = NO;
		b.userInteractionEnabled = YES;
	}
  
    if (index >0  && index <3) {
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:@"View" context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.8];
      
        [m_loadimg setFrame:CGRectMake(0, 0,129/2 * (index-1)+247/2+65-65/2, 2.5)];
             [UIView commitAnimations];
    }
    if (index == 3) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:@"View" context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.8];
        [m_loadimg setFrame:CGRectMake(0, 0, 129/2 * (index-1)+247/2+75, 2.5)];
        [UIView commitAnimations];

    }
    if (index == 0) {
       
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:@"View" context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.8];
        [m_loadimg setFrame:CGRectMake(0, 0, 92, 2.5)];
        [UIView commitAnimations];
    }

	UIButton *btn = [self.buttons objectAtIndex:index];
	btn.selected = YES;
	btn.userInteractionEnabled = NO;
}

- (void)removeTabAtIndex:(NSInteger)index
{
    // Remove button
    [(UIButton *)[self.buttons objectAtIndex:index] removeFromSuperview];
    [self.buttons removeObjectAtIndex:index];
   
    // Re-index the buttons
     CGFloat width = 320.0f / [self.buttons count];
    for (UIButton *btn in self.buttons) 
    {
        if (btn.tag > index)
        {
            btn.tag --;
        }
        btn.frame = CGRectMake(width * btn.tag, 0, width, self.frame.size.height);
    }
}
- (void)insertTabWithImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index
{
    // Re-index the buttons
    CGFloat width = 320.0f / ([self.buttons count] + 1);
    for (UIButton *b in self.buttons) 
    {
        if (b.tag >= index)
        {
            b.tag ++;
        }
        b.frame = CGRectMake(width * b.tag, 0, width, self.frame.size.height);
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
   btn.showsTouchWhenHighlighted = NO;
    btn.adjustsImageWhenHighlighted= YES;
    btn.highlighted =NO;
    btn.tag = index;
    btn.frame = CGRectMake(width * index, 0, width, self.frame.size.height);
    btn.backgroundColor = [UIColor blackColor];
    [btn setImage:[dict objectForKey:@"Default"] forState:UIControlStateNormal];
//    [btn setImage:[dict objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
    [btn setImage:[dict objectForKey:@"Seleted"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttons insertObject:btn atIndex:index];
    [self addSubview:btn];
}

- (void)dealloc
{
    [_backgroundView release];
    [_buttons release];
    [super dealloc];
}

@end
