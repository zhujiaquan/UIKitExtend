//
//  UIToolbar+Utilities.m
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import "UIToolbar+Utilities.h"
#import "ARCMacros.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIToolbar (Utilities)

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
UIImageView *backgroundImageView;

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
    {
        [self setBackgroundImage:backgroundImage
              forToolbarPosition:UIToolbarPositionAny
                      barMetrics:UIBarMetricsDefault];
    }
    else
    {
        if (backgroundImage == nil)
        {
            [backgroundImageView removeFromSuperview];
        }
        else
        {
            backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
            backgroundImageView.frame = self.bounds;
            backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            
            [self addSubview:backgroundImageView];
            [self sendSubviewToBack:backgroundImageView];
        
            AMRelease(backgroundImageView);
        }
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index
{
    [super insertSubview:view atIndex:index];
    [self sendSubviewToBack:backgroundImageView];
}

@end
