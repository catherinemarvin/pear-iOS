//
//  UIImage+KHAdditions.m
//  Pear
//
//  Created by Kevin Hwang on 12/29/14.
//  Copyright (c) 2014 Kevin Hwang. All rights reserved.
//

#import "UIImage+KHAdditions.h"

@implementation UIImage (KHAdditions)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
