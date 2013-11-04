//
//  UIImage+Utilities.h
//  XClubs
//
//  Created by silence on 12-8-1.
//  Copyright (c) 2012年 5clubs.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utilities)

// 可伸缩的图片
- (UIImage *)stretchableImage;

- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

@end
