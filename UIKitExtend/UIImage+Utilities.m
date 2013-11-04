//
//  UIImage+Utilities.m
//  XClubs
//
//  Created by silence on 12-8-1.
//  Copyright (c) 2012年 5clubs.com. All rights reserved.
//

#import "UIImage+Utilities.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180 / M_PI;};

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIImage (Utilities)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage *)stretchableImage
{
	CGFloat leftCap = floorf((self.size.width - 0.5f) * 0.5f);
	CGFloat topCap  = floorf((self.size.height - 0.5f) * 0.5f);
	
	if ([self respondsToSelector:@selector(resizableImageWithCapInsets:)])
    {
		UIEdgeInsets capInsets = UIEdgeInsetsMake(topCap, leftCap, topCap, leftCap);
		return [self resizableImageWithCapInsets:capInsets];
    }
	
	return [self stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage *)imageRotatedByRadians:(CGFloat)radians
{
    return [self imageRotatedByDegrees:RadiansToDegrees(radians)];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees
{
    // calculate the size of the rotated view's containing box for our drawing space
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
    CGAffineTransform t = CGAffineTransformMakeRotation(DegreesToRadians(degrees));
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    [rotatedViewBox release];
    
        // Create the bitmap context
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
        // Move the origin to the middle of the image so we will rotate and scale around the center.
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    
        // Rotate the image context
    CGContextRotateCTM(bitmap, DegreesToRadians(degrees));
    
        // Now, draw the rotated/scaled image into the context
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
