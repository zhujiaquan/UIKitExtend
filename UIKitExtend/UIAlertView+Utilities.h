//
//  UIAlertView+Utilities.h
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SHARED_PROMPT_ALERT_TITLE  @"警告"
#define SHARED_OK_BUTTON_TITLE     @"确定"
#define SHARED_CANCEL_BUTTON_TITLE @"取消"

@interface UIAlertView (Utilities)

+ (void)showAlertViewWithWarnning:(NSString *)Warnning
                         delegate:(id /* <UIAlertViewDelegate> */)delegate
                              tag:(int)tag;
+ (void)showAlertViewWithTitle:(NSString *)title;
+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message;
+ (void)showAlertViewWithTitles:(NSArray *)titles;
+ (void)showAlertViewForErrors:(NSArray *)errors;
+ (void)showAlertViewForError:(NSError *)error;

@end
