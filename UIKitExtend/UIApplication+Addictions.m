//
//  UIApplication+Addictions.m
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import "UIApplication+Addictions.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIApplication (Addictions)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)statusBarSize
{
    CGRect rect = [self statusBarFrame];
    CGFloat width  = (rect.size.width > rect.size.height) ? rect.size.width : rect.size.height;
    CGFloat height = (rect.size.width > rect.size.height) ? rect.size.height : rect.size.width;
    return CGSizeMake(width, height);
}

@end
