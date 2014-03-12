//
//  AboutTableCell.h
//  NewMX
//
//  Created by 李昂 on 13-9-10.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutTableCell : UITableViewCell
{
    UIImage *m_icon;
    NSString *m_info;
}
@property(nonatomic,retain)UIImage *m_icon;
@property(nonatomic,retain)NSString *m_info;
@end
