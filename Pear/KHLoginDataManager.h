//
//  KHLoginDataManager.h
//  Pear
//
//  Created by Kevin Hwang on 2/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHLoginDataManagerDelegate.h"

@interface KHLoginDataManager : NSObject

- (instancetype)initWithDelegate:(id<KHLoginDataManagerDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (void)loginWithUsername:(NSString *)username password:(NSString *)password;

@end
