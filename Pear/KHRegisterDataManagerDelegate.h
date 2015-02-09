//
//  KHRegisterDataManagerDelegate.h
//  Pear
//
//  Created by Kevin Hwang on 2/8/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KHRegisterDataManagerDelegate <NSObject>

- (void)registerSucceeded:(NSString *)key;
- (void)registerFailed:(NSError *)error;

@end
