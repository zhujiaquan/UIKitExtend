//
//  UIView+WhenTappedBlocks.h
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#if NS_BLOCKS_AVAILABLE

#import <UIKit/UIKit.h>

typedef void (^UIWhenTappedBlock)();

@interface UIView (UIWhenTappedBlocks) <UIGestureRecognizerDelegate>

- (void)whenTapped:(UIWhenTappedBlock)block;
- (void)whenDoubleTapped:(UIWhenTappedBlock)block;
- (void)whenTwoFingerTapped:(UIWhenTappedBlock)block;
- (void)whenTouchedDown:(UIWhenTappedBlock)block;
- (void)whenTouchedUp:(UIWhenTappedBlock)block;

@end

#endif
