//
//  KHLoginDataManagerDelegate.h
//  Pear
//
//  Created by Kevin Hwang on 2/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KHLoginDataManagerDelegate <NSObject>

- (void)loginSucceeded:(NSString *)key;
- (void)loginFailed:(NSError *)error;

@end
