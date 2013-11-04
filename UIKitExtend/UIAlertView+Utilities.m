//
//  UIAlertView+Utilities.m
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import "UIAlertView+Utilities.h"
#import "ARCMacros.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIAlertView (Utilities)

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)showAlertViewWithWarnning:(NSString *)Warnning
                         delegate:(id /* <UIAlertViewDelegate> */)delegate
                              tag:(int)tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:SHARED_PROMPT_ALERT_TITLE
                                                         message:Warnning
                                                        delegate:delegate
                                               cancelButtonTitle:SHARED_CANCEL_BUTTON_TITLE
                                               otherButtonTitles:SHARED_OK_BUTTON_TITLE, nil];
    [alertView setTag:tag];
    [AMAutorelease( alertView ) show];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)showAlertViewWithTitle:(NSString *)title
{
	[self showAlertViewWithTitle:title message:nil];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message
{
    
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:SHARED_OK_BUTTON_TITLE, nil];
    [AMAutorelease( alertView ) show];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)showAlertViewWithTitles:(NSArray *)titles
{
	if ([titles count] == 1)
    {
        [UIAlertView showAlertViewWithTitle:(NSString *)[titles lastObject]];
    }
    else if ([titles count] > 1)
    {
		[UIAlertView showAlertViewWithTitle:nil message:[titles componentsJoinedByString:@"\n"]];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)showAlertViewForErrors:(NSArray *)errors
{
	if ([errors count] == 1)
    {
        
		[UIAlertView showAlertViewForError:[errors lastObject]];
        
    }
    else if ([errors count] > 1)
    {
		NSMutableArray *errorStrings = AMAutorelease( [[NSMutableArray alloc] init] );
		for (NSError *error in errors)
        {
            [errorStrings addObject:[error localizedDescription]];
        }
		[UIAlertView showAlertViewWithTitle:nil message:[errorStrings componentsJoinedByString:@"\n"]];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)showAlertViewForError:(NSError *)error
{
	NSString *description = [error localizedDescription];
	NSString *suggestion = [error localizedRecoverySuggestion];
	if (!description)
    {
        return;
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:description
                                                        message:suggestion
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:SHARED_OK_BUTTON_TITLE, nil];
    
	[AMAutorelease( alertView ) show];
}

@end
