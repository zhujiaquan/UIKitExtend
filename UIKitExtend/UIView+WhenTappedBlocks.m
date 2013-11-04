//
//  UIView+WhenTappedBlocks.m
//  UIKitExtend
//
//  Created by ZhuJiaQuan on 13-11-4.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#if NS_BLOCKS_AVAILABLE

#import "UIView+WhenTappedBlocks.h"
#import "ARCMacros.h"
#import <objc/runtime.h>

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@interface UIView (UIWhenTappedBlocks_Private)

- (void)runBlockForKey:(void *)blockKey;
- (void)setBlock:(UIWhenTappedBlock)block forKey:(void *)blockKey;

- (UITapGestureRecognizer*)addTapGestureRecognizerWithTaps:(NSUInteger)taps touches:(NSUInteger)touches selector:(SEL)selector;
- (void) addRequirementToSingleTapsRecognizer:(UIGestureRecognizer *) recognizer;
- (void) addRequiredToDoubleTapsRecognizer:(UIGestureRecognizer *) recognizer;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIView (UIWhenTappedBlocks)

static char kWhenTappedBlockKey;
static char kWhenDoubleTappedBlockKey;
static char kWhenTwoFingerTappedBlockKey;
static char kWhenTouchedDownBlockKey;
static char kWhenTouchedUpBlockKey;

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Set blocks

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)runBlockForKey:(void *)blockKey
{
    UIWhenTappedBlock block = objc_getAssociatedObject(self, blockKey);
    if (block) block();
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBlock:(UIWhenTappedBlock)block forKey:(void *)blockKey
{
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, blockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark When Tapped

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)whenTapped:(UIWhenTappedBlock)block
{
    UITapGestureRecognizer* gesture = [self addTapGestureRecognizerWithTaps:1 touches:1 selector:@selector(viewWasTapped:)];
    [self addRequirementToSingleTapsRecognizer:gesture];
    
    [self setBlock:block forKey:&kWhenTappedBlockKey];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)whenDoubleTapped:(UIWhenTappedBlock)block
{
    UITapGestureRecognizer* gesture = [self addTapGestureRecognizerWithTaps:2
                                                                    touches:1
                                                                   selector:@selector(viewWasDoubleTapped:)];
    [self addRequiredToDoubleTapsRecognizer:gesture];
    
    [self setBlock:block forKey:&kWhenDoubleTappedBlockKey];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)whenTwoFingerTapped:(UIWhenTappedBlock)block
{
    [self addTapGestureRecognizerWithTaps:1
                                  touches:2
                                 selector:@selector(viewWasTwoFingerTapped:)];
    [self setBlock:block forKey:&kWhenTwoFingerTappedBlockKey];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)whenTouchedDown:(UIWhenTappedBlock)block
{
    [self setBlock:block forKey:&kWhenTouchedDownBlockKey];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)whenTouchedUp:(UIWhenTappedBlock)block
{
    [self setBlock:block forKey:&kWhenTouchedUpBlockKey];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Callbacks

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewWasTapped:(UITapGestureRecognizer *)sender
{
    [self runBlockForKey:&kWhenTappedBlockKey];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewWasDoubleTapped:(UITapGestureRecognizer *)sender
{
    [self runBlockForKey:&kWhenDoubleTappedBlockKey];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewWasTwoFingerTapped:(UITapGestureRecognizer *)sender
{
    [self runBlockForKey:&kWhenTwoFingerTappedBlockKey];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self runBlockForKey:&kWhenTouchedDownBlockKey];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self runBlockForKey:&kWhenTouchedUpBlockKey];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Helpers

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UITapGestureRecognizer *)addTapGestureRecognizerWithTaps:(NSUInteger)taps touches:(NSUInteger)touches selector:(SEL)selector
{
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    tapGesture.delegate = self;
    tapGesture.numberOfTapsRequired = taps;
    tapGesture.numberOfTouchesRequired = touches;
    [self addGestureRecognizer:tapGesture];
    
    return AMAutorelease(tapGesture);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)addRequirementToSingleTapsRecognizer:(UIGestureRecognizer *) recognizer
{
    for (UIGestureRecognizer* gesture in [self gestureRecognizers])
    {
        if ([gesture isKindOfClass:[UITapGestureRecognizer class]])
        {
            UITapGestureRecognizer* tapGesture = (UITapGestureRecognizer*) gesture;
            if (tapGesture.numberOfTouchesRequired == 1 && tapGesture.numberOfTapsRequired == 1)
            {
                [tapGesture requireGestureRecognizerToFail:recognizer];
            }
        }
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)addRequiredToDoubleTapsRecognizer:(UIGestureRecognizer *) recognizer
{
    for (UIGestureRecognizer* gesture in [self gestureRecognizers])
    {
        if ([gesture isKindOfClass:[UITapGestureRecognizer class]])
        {
            UITapGestureRecognizer* tapGesture = (UITapGestureRecognizer*) gesture;
            if (tapGesture.numberOfTouchesRequired == 2 && tapGesture.numberOfTapsRequired == 1)
            {
                [recognizer requireGestureRecognizerToFail:tapGesture];
            }
        }
    }
}

@end

#endif
