//
//  UIView+Utilities.h
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-3.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utilities)

- (CGFloat)left;
- (void)setLeft:(CGFloat)x;

- (CGFloat)top;
- (void)setTop:(CGFloat)y;

- (CGFloat)right;
- (void)setRight:(CGFloat)right;

- (CGFloat)bottom;
- (void)setBottom:(CGFloat)bottom;

- (CGFloat)centerX;
- (void)setCenterX:(CGFloat)centerX;

- (CGFloat)centerY;
- (void)setCenterY:(CGFloat)centerY;

- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

- (CGPoint)origin;
- (void)setOrigin:(CGPoint)origin;

- (CGSize)size;
- (void)setSize:(CGSize)size;

- (void)setLeftDelta:(CGFloat)delta;
- (void)setTopDelta:(CGFloat)delta;

- (void)setWidthDelta:(CGFloat)delta;
- (void)setHeightDelta:(CGFloat)delta;

- (id)firstResponder;

- (NSArray *)allSubviews;
- (void)removeAllSubviews;

@end
