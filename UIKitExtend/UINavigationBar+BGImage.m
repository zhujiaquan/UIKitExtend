//
//  UINavigationBar+BGImage.m
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import "UINavigationBar+BGImage.h"
#import "ARCMacros.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UINavigationBar (BGImage)

///////////////////////////////////////////////////////////////////////////////////////////////////
UIImageView *backgroundImageView;

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
    {
        [self setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
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
            backgroundImageView.tag = 9999;
            backgroundImageView.frame = self.bounds;
            backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            
            [self addSubview:backgroundImageView];
            [self sendSubviewToBack:backgroundImageView];
        
            AMRelease( backgroundImageView );
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
