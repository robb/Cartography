//
//  Cartography.h
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <TargetConditionals.h>

#if TARGET_OS_IPHONE || TARGET_OS_TV
    #import <UIKit/UIKit.h>
#else
    #import <AppKit/AppKit.h>
#endif

//! Project version number for Cartography.
FOUNDATION_EXPORT double CartographyVersionNumber;

//! Project version string for Cartography.
FOUNDATION_EXPORT const unsigned char CartographyVersionString[];
