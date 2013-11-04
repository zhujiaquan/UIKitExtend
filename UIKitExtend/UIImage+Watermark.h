//
//  UIImage+Watermark.h
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Watermark)

- (UIImage *)addText:(NSString *)text;
- (UIImage *)addLogo:(UIImage *)logo;

@end
