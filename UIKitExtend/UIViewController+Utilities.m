//
//  UIViewController+Utilities.m
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import "UIViewController+Utilities.h"
#import "ARCMacros.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIViewController (Utilities)

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)viewControllerFromNib
{
    return AMAutorelease( [[self alloc] initWithNibName:[self description] bundle:nil] );
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UINavigationController *)navigationControllerFromSelf
{
    UINavigationController * navigation = [[UINavigationController alloc] initWithRootViewController:self] ;
    [navigation setTitle:self.title];
    return AMAutorelease( navigation );
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIPopoverController *)popoverControllerFromSelf
{
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:self];
    return AMAutorelease( popover );
}

@end
