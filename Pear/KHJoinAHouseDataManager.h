//
//  KHJoinAHouseDataManager.h
//  Pear
//
//  Created by Kevin Hwang on 3/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHJoinAHouseDataManagerDelegate.h"

@class RACSignal;

@interface KHJoinAHouseDataManager : NSObject

- (instancetype)initWithDelegate:(id<KHJoinAHouseDataManagerDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (RACSignal *)joinWithHouseName:(NSString *)houseName password:(NSString *)password;

@end
