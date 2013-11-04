//
//  UIViewController+Utilities.h
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Utilities)

+ (id)viewControllerFromNib;

- (UINavigationController *)navigationController;

- (UIPopoverController *)popoverController;

@end
