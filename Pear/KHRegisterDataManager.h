//
//  KHRegisterDataManager.h
//  Pear
//
//  Created by Kevin Hwang on 2/8/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHRegisterDataManagerDelegate.h"

@interface KHRegisterDataManager : NSObject

- (instancetype)initWithDelegate:(id<KHRegisterDataManagerDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (void)registerWithUsername:(NSString *)username password:(NSString *)password;

@end
