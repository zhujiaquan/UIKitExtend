//
//  UIToolbar+KeybordToolbar.h
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIKeyboardToolbarDelegate <NSObject>

- (void)segmentAction:(id)sender;
- (void)doneBarItemDidTouchUpInside:(UIBarButtonItem *)doneBarItem;

@end

@interface UIToolbar (KeybordToolbar)

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIBarButtonItem *doneBarItem;
@property (nonatomic, strong) UIBarButtonItem *spaceBarItem;

+ (UIToolbar *)keyboardToolbarWithDelegate:(id<UIKeyboardToolbarDelegate>)delegate;

@end
