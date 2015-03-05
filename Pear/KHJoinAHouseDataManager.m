//
//  KHJoinAHouseDataManager.m
//  Pear
//
//  Created by Kevin Hwang on 3/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHJoinAHouseDataManager.h"

// API
#import "KHAPIManager.h"

@interface KHJoinAHouseDataManager()

@property (nonatomic, weak) id<KHJoinAHouseDataManagerDelegate>delegate;
@property (nonatomic, strong) KHAPIManager *manager;

@end

// API Keys
static NSString *const KHkHouseNameKey = @"house_name";
static NSString *const KHkPasswordKey = @"password";

@implementation KHJoinAHouseDataManager

- (instancetype)initWithDelegate:(id<KHJoinAHouseDataManagerDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _manager = [[KHAPIManager alloc] init];
    }
    return self;
}

- (void)joinWithHouseName:(NSString *)houseName password:(NSString *)password {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:houseName forKey:KHkHouseNameKey];
    [params setValue:password forKey:KHkPasswordKey];
    [self.manager get:@"join_house" parameters:params success:^(id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSDictionary *errorDictionary, NSError *error) {
        NSLog(@"%@", errorDictionary);
    }];
}

@end
