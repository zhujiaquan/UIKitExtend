//
//  UIView+FromNib.h
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FromNib)

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
+ (id)viewFromNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
+ (id)viewFromNib;

@end
