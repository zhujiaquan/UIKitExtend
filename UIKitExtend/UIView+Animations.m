//
//  UIView+Animations.m
//  UIViewAnimations
//
//  Created by ZhuJiaQuan on 13-8-8.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import "UIView+Animations.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
#define degreesToRadians( x ) (M_PI*(x)/180.0)

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIView (Animations)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)fadeWithDuration:(NSTimeInterval)duration
              startAlpha:(CGFloat)startAlpha
                endAlpha:(CGFloat)endAlpha
                    wait:(BOOL)wait
              completion:(void (^)(BOOL finished))completion
{
    // wait =  YES wait to finish animation
    __block BOOL done = wait;
    __block UIView *safeSelf = self;
    
    [safeSelf setAlpha:startAlpha];
    [UIView animateWithDuration:duration animations:^{
        
        [safeSelf setAlpha:endAlpha];
        
    } completion:^(BOOL finished) {
        
        if (finished) done = NO;
        if (completion) {
            completion(finished);
        }
    }];
    
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)fadeInWithDuration:(NSTimeInterval)duration
                      wait:(BOOL)wait
                completion:(void (^)(BOOL finished))completion
{
    [self fadeWithDuration:duration startAlpha:0.0f endAlpha:1.0f wait:wait completion:completion];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)fadeOutWithDuration:(NSTimeInterval)duration
                       wait:(BOOL)wait
                 completion:(void (^)(BOOL finished))completion
{
    [self fadeWithDuration:duration startAlpha:1.0f endAlpha:0.0f wait:wait completion:completion];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)moveWithDuration:(NSTimeInterval)duration
              startPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint
                    wait:(BOOL)wait
              completion:(void (^)(BOOL finished))completion
{
    // wait =  YES wait to finish animation
    __block BOOL done = wait;
    __block UIView *safeSelf = self;
    
    CGRect frame = self.frame;
    self.frame = (CGRect){startPoint, frame.size};
    
    [UIView animateWithDuration:duration animations:^{
        
        safeSelf.frame = (CGRect){endPoint, frame.size};
        
    } completion:^(BOOL finished) {
        
        if (finished) done = NO;
        if (completion){
            completion(finished);
        }
    }];
    
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)moveWithDuration:(NSTimeInterval)duration
             startCenter:(CGPoint)startCenter
               endCenter:(CGPoint)endCenter
                    wait:(BOOL)wait
              completion:(void (^)(BOOL finished))completion
{
    // wait =  YES wait to finish animation
    __block BOOL done = wait;
    __block UIView *safeSelf = self;
    
    self.center = startCenter;
    [UIView animateWithDuration:duration animations:^{
        
        safeSelf.center = endCenter;
        
    } completion:^(BOOL finished) {
        
        if (finished) done = NO;
        if (completion){
            completion(finished);
        }
    }];
    
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)moveUpWithDuration:(NSTimeInterval)duration
                    offset:(float)offset
                     wait:(BOOL)wait
                completion:(void (^)(BOOL finished))completion
{
    [self moveWithDuration:duration
               startCenter:self.center
                 endCenter:CGPointMake(self.center.x, self.center.y - offset)
                      wait:wait
                completion:completion];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)moveDownWithDuration:(NSTimeInterval)duration
                      offset:(float)offset
                       wait:(BOOL)wait
                  completion:(void (^)(BOOL finished))completion
{
    [self moveWithDuration:duration
               startCenter:self.center
                 endCenter:CGPointMake(self.center.x, self.center.y + offset)
                      wait:wait
                completion:completion];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)moveLeftWithDuration:(NSTimeInterval)duration
                      offset:(float)offset
                       wait:(BOOL)wait
                  completion:(void (^)(BOOL finished))completion
{
    [self moveWithDuration:duration
               startCenter:self.center
                 endCenter:CGPointMake(self.center.x - offset, self.center.y)
                      wait:wait
                completion:completion];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)moveRightWithDuration:(NSTimeInterval)duration
                       offset:(float)offset
                         wait:(BOOL)wait
                   completion:(void (^)(BOOL finished))completion
{
    [self moveWithDuration:duration
               startCenter:self.center
                 endCenter:CGPointMake(self.center.x + offset, self.center.y)
                     wait:wait
                completion:completion];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)bounceUpAnimation
{
    [self moveUpWithDuration:0.2f offset:50.0f wait:YES completion:nil];
    [self moveDownWithDuration:0.2f offset:20.0f wait:YES completion:nil];
    [self moveUpWithDuration:0.1f offset:15.0f wait:YES completion:nil];
    [self moveDownWithDuration:0.1f offset:10.0f wait:YES completion:nil];
    [self moveUpWithDuration:0.1f offset:15.0f wait:YES completion:nil];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)bounceDownAnimation
{
    [self moveDownWithDuration:0.2f offset:100.0f wait:YES completion:nil];
    [self moveUpWithDuration:0.2f offset:20.0f wait:YES completion:nil];
    [self moveDownWithDuration:0.1f offset:20.0f wait:YES completion:nil];
    [self moveUpWithDuration:0.1f offset:12.0f wait:YES completion:nil];
    [self moveDownWithDuration:0.1f offset:12.0f wait:YES completion:nil];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)rotateWithDuration:(NSTimeInterval)duration
                     angle:(int)angle
                completion:(void (^)(BOOL finished))completion
{
    __block UIView *safeSelf = self;
    
    [UIView animateWithDuration:duration animations:^{
        
        [safeSelf setTransform:CGAffineTransformMakeRotation(degreesToRadians(angle))];
        
    } completion:^(BOOL finished) {
        
        if (completion) {
            completion(finished);
        }
    }];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)scaleWithDuration:(NSTimeInterval)duration
               startFrame:(CGRect)startFrame
                 endFrame:(CGRect)endFrame
               completion:(void (^)(BOOL finished))completion
{
    __block UIView *safeSelf = self;
    
    [self setFrame:startFrame];
    [UIView animateWithDuration:duration animations:^{
        
        [safeSelf setFrame:endFrame];
        
    } completion:^(BOOL finished) {
        
        if (completion) {
            completion(finished);
        }
    }];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)flipFromLeftWithDuration:(NSTimeInterval)duration
{
    [self flipFromLeftWithDuration:duration
                    animationCurve:UIViewAnimationCurveEaseInOut];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)flipFromLeftWithDuration:(NSTimeInterval)duration
                  animationCurve:(UIViewAnimationCurve)curve
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:self
                             cache:YES];
    [UIView commitAnimations];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)flipFromRightWithDuration:(NSTimeInterval)duration
{
    [self flipFromRightWithDuration:duration
                     animationCurve:UIViewAnimationCurveEaseInOut];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)flipFromRightWithDuration:(NSTimeInterval)duration
                   animationCurve:(UIViewAnimationCurve)curve
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:self
                             cache:YES];
    [UIView commitAnimations];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)curlUpWithDuration:(NSTimeInterval)duration
{
    [self curlUpWithDuration:duration
              animationCurve:UIViewAnimationCurveEaseInOut];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)curlUpWithDuration:(NSTimeInterval)duration
            animationCurve:(UIViewAnimationCurve)curve
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                           forView:self
                             cache:YES];
    [UIView commitAnimations];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)curlDownWithDuration:(NSTimeInterval)duration
{
    [self curlDownWithDuration:duration
               animationCurve:UIViewAnimationCurveEaseInOut];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)curlDownWithDuration:(NSTimeInterval)duration
              animationCurve:(UIViewAnimationCurve)curve
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
                           forView:self
                             cache:YES];
    [UIView commitAnimations];
}

@end
