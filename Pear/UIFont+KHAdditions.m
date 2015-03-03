//
//  UIFont+KHAdditions.m
//  Pear
//
//  Created by Kevin Hwang on 3/1/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "UIFont+KHAdditions.h"

static NSString *const KHkRegularFontName = @"Lato-Regular";
static NSString *const KHkBoldFontName = @"Lato-Bold";
static NSString *const KHkItalicFontName = @"Lato-Italic";

@implementation UIFont (KHAdditions)

+ (UIFont *)regularWithSize:(CGFloat)size {
    return [UIFont fontWithName:KHkRegularFontName size:size];
}

+ (UIFont *)boldWithSize:(CGFloat)size {
    return [UIFont fontWithName:KHkBoldFontName size:size];
}

+ (UIFont *)italicWithSize:(CGFloat)size {
    return [UIFont fontWithName:KHkItalicFontName size:size];
}

@end
