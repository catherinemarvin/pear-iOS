//
//  UIFont+KHAdditions.m
//  Pear
//
//  Created by Kevin Hwang on 3/1/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "UIFont+KHAdditions.h"

static NSString *const KHkRegularFontName = @"Helvetica";
static NSString *const KhkSerifFontName = @"Helvetica Neue";
static NSString *const KHkBoldFontName = @"Helvetica";

@implementation UIFont (KHAdditions)

+ (UIFont *)regularWithSize:(CGFloat)size {
    return [UIFont fontWithName:KHkRegularFontName size:size];
}

+ (UIFont *)serifWithSize:(CGFloat)size {
    return [UIFont fontWithName:KhkSerifFontName size:size];
}

+ (UIFont *)boldWithSize:(CGFloat)size {
    return [UIFont fontWithName:KHkBoldFontName size:size];
}

@end
