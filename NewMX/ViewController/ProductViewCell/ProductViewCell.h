//
//  ProductViewCell.h
//  NewMX
//
//  Created by 李 昂 on 13-9-20.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductViewCell : UITableViewCell
{
    UIImageView *m_productImg;
    NSString *mtime;
    UILabel *timeLabel;
}
@property(nonatomic,retain)NSString *murl;
@property(nonatomic,retain)UIImageView *m_productImg;
@property(nonatomic,retain)NSString* mtime;
@end
