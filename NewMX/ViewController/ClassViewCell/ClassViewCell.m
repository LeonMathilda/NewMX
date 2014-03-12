//
//  ClassViewCell.m
//  NewMX
//
//  Created by 李昂 on 13-9-11.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import "ClassViewCell.h"

@implementation ClassViewCell
@synthesize m_image;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
