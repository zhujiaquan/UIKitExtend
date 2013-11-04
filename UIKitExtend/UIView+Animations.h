//
//  UIView+Animations.h
//  UIViewAnimations
//
//  Created by ZhuJiaQuan on 13-8-8.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animations)

- (void)fadeWithDuration:(NSTimeInterval)duration startAlpha:(CGFloat)startAlpha endAlpha:(CGFloat)endAlpha wait:(BOOL)wait completion:(void (^)(BOOL finished))completion;
- (void)fadeInWithDuration:(NSTimeInterval)duration wait:(BOOL)wait completion:(void (^)(BOOL finished))completion;
- (void)fadeOutWithDuration:(NSTimeInterval)duration wait:(BOOL)wait completion:(void (^)(BOOL finished))completion;

- (void)moveWithDuration:(NSTimeInterval)duration startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint wait:(BOOL)wait completion:(void (^)(BOOL finished))completion;
- (void)moveWithDuration:(NSTimeInterval)duration startCenter:(CGPoint)startCenter endCenter:(CGPoint)endCenter wait:(BOOL)wait completion:(void (^)(BOOL finished))completion;
- (void)moveUpWithDuration:(NSTimeInterval)duration offset:(float)offset wait:(BOOL)wait completion:(void (^)(BOOL finished))completion;
- (void)moveDownWithDuration:(NSTimeInterval)duration offset:(float)offset wait:(BOOL)wait completion:(void (^)(BOOL finished))completion;
- (void)moveLeftWithDuration:(NSTimeInterval)duration offset:(float)offset wait:(BOOL)wait completion:(void (^)(BOOL finished))completion;
- (void)moveRightWithDuration:(NSTimeInterval)duration offset:(float)offset wait:(BOOL)wait completion:(void (^)(BOOL finished))completion;

- (void)bounceUpAnimation;
- (void)bounceDownAnimation;

- (void)rotateWithDuration:(NSTimeInterval)duration angle:(int)angle completion:(void (^)(BOOL finished))completion;
- (void)scaleWithDuration:(NSTimeInterval)duration startFrame:(CGRect)startFrame endFrame:(CGRect)endFrame completion:(void (^)(BOOL finished))completion;

// animationCurve default is UIViewAnimationCurveEaseInOut
- (void)flipFromLeftWithDuration:(NSTimeInterval)duration;
- (void)flipFromLeftWithDuration:(NSTimeInterval)duration animationCurve:(UIViewAnimationCurve)curve;

// animationCurve default is UIViewAnimationCurveEaseInOut
- (void)flipFromRightWithDuration:(NSTimeInterval)duration;
- (void)flipFromRightWithDuration:(NSTimeInterval)duration animationCurve:(UIViewAnimationCurve)curve;

// animationCurve default is UIViewAnimationCurveEaseInOut
- (void)curlUpWithDuration:(NSTimeInterval)duration;
- (void)curlUpWithDuration:(NSTimeInterval)duration animationCurve:(UIViewAnimationCurve)curve;

// animationCurve default is UIViewAnimationCurveEaseInOut
- (void)curlDownWithDuration:(NSTimeInterval)duration;
- (void)curlDownWithDuration:(NSTimeInterval)duration animationCurve:(UIViewAnimationCurve)curve;

@end
