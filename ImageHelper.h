//
//  ImageHelper.h
//  NewMX
//
//  Created by 李 昂 on 13-12-14.
//  Copyright (c) 2013年 李昂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageHelper : NSObject
+ (UIImage *) image: (UIImage *) image fillSize: (CGSize) viewsize;
+ (CGSize) fitSize: (CGSize)thisSize inSize: (CGSize) aSize;
+ (UIImage *) image: (UIImage *) image centerInSize: (CGSize) viewsize;
@end
