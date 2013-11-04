//
//  UIToolbar+KeybordToolbar.m
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import "UIToolbar+KeybordToolbar.h"
#import <objc/runtime.h>

static const char kKeyboardToolbarSegmentedControl;
static const char kKeyboardToolbarPreviousBarItem;
static const char kKeyboardToolbarNextBarItem;
static const char kKeyboardToolbarDoneBarItem;
static const char kKeyboardToolbarSpaceBarItem;

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIToolbar (KeybordToolbar)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSegmentedControl:(UISegmentedControl *)segmentedControl
{
    objc_setAssociatedObject(self, &kKeyboardToolbarSegmentedControl, segmentedControl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UISegmentedControl *)segmentedControl
{
    return (UISegmentedControl *)objc_getAssociatedObject(self, &kKeyboardToolbarSegmentedControl);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setDoneBarItem:(UIBarButtonItem *)doneBarItem
{
    objc_setAssociatedObject(self, &kKeyboardToolbarDoneBarItem, doneBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIBarButtonItem *)doneBarItem
{
    return (UIBarButtonItem *)objc_getAssociatedObject(self, &kKeyboardToolbarDoneBarItem);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSpaceBarItem:(UIBarButtonItem *)spaceBarItem
{
    objc_setAssociatedObject(self, &kKeyboardToolbarSpaceBarItem, spaceBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIBarButtonItem *)spaceBarItem
{
    return (UIBarButtonItem *)objc_getAssociatedObject(self, &kKeyboardToolbarSpaceBarItem);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (UIToolbar *)keyboardToolbarWithDelegate:(id<UIKeyboardToolbarDelegate>)delegate;
{
    // NSLocalizedString(@"Previous", @"")
    // NSLocalizedString(@"Next", @"")
    // NSLocalizedString(@"Done", @"")
    // NSLocalizedString(@"前一项", @"")
    // NSLocalizedString(@"后一项", @"")
    // NSLocalizedString(@"完成", @"")
    
    UISegmentedControl* segmentedControl = [[[UISegmentedControl alloc] initWithItems:@[@"前一项", @"后一项"]] autorelease];
    [segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [segmentedControl setMomentary:YES];
    [segmentedControl setHighlighted:YES];
    [segmentedControl setEnabled:NO forSegmentAtIndex:0];
    [segmentedControl addTarget:delegate action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *segmentedControlBarItem = [[[UIBarButtonItem alloc] initWithCustomView:segmentedControl] autorelease];
    
    UIBarButtonItem *spaceBarItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                   target:nil
                                                                                   action:nil] autorelease];
    
    UIBarButtonItem *doneBarItem =  [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"完成", @"")
                                                                      style:UIBarButtonItemStyleDone
                                                                     target:delegate
                                                                     action:@selector(doneBarItemDidTouchUpInside:)] autorelease];
    
    UIToolbar *keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320.0f, 44.0f)];
    [keyboardToolbar setBarStyle:UIBarStyleBlackTranslucent];
    [keyboardToolbar setSegmentedControl:segmentedControl];
    [keyboardToolbar setDoneBarItem:doneBarItem];
    [keyboardToolbar setSpaceBarItem:spaceBarItem];
    [keyboardToolbar setItems:@[segmentedControlBarItem, spaceBarItem, doneBarItem]];
    
    return [keyboardToolbar autorelease];
}

@end
