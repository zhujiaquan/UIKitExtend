//
//  ARCMacros.h
//  FoundationExtend
//
//  Created by ZhuJiaQuan on 13-11-1.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#ifndef ARC_MACROS_H
#define ARC_MACROS_H

#if !defined(__clang__) || __clang_major__ < 3
#ifndef __bridge
#define __bridge
#endif

#ifndef __bridge_retain
#define __bridge_retain
#endif

#ifndef __bridge_retained
#define __bridge_retained
#endif

#ifndef __autoreleasing
#define __autoreleasing
#endif

#ifndef __strong
#define __strong
#endif

#ifndef __unsafe_unretained
#define __unsafe_unretained
#endif

#ifndef __weak
#define __weak
#endif
#endif

#if ! __has_feature(objc_arc)

// none arc
#define AMAutorelease(__v) ([__v autorelease])
#define AMReturnAutoreleased AMAutorelease
#define AMParamAutoreleased(__v) [__v autorelease]

#define AMRetain(__v) ([__v retain]);
#define AMReturnRetained AMRetain

#define AMRelease(__v) ([__v release]);
#define AMSafeRelease(__v) ([__v release], __v = nil);
#define AMSuperDealoc() ([super dealloc]);

#define __AMWeak

#else
// -fobjc-arc
#define AMAutorelease(__v)
#define AMReturnAutoreleased(__v) (__v)
#define AMParamAutoreleased AMReturnAutoreleased

#define AMRetain(__v)
#define AMReturnRetained(__v) (__v)

#define AMRelease(__v)
#define AMSafeRelease(__v) (__v = nil);
#define AMSuperDealoc()

#define __AMWeak __unsafe_unretained
#endif


#endif
