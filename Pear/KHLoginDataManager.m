//
//  KHLoginDataManager.m
//  Pear
//
//  Created by Kevin Hwang on 2/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHLoginDataManager.h"
#import "KHAPIManager.h"

@interface KHLoginDataManager()

@property (nonatomic, weak) id<KHLoginDataManagerDelegate>delegate;
@property (nonatomic, strong) KHAPIManager *manager;

@end

static NSString *const KHkUsernameKey = @"username";
static NSString *const KHkPasswordKey = @"password";

@implementation KHLoginDataManager

- (instancetype)initWithDelegate:(id<KHLoginDataManagerDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _manager = [[KHAPIManager alloc] init];
    }
    return self;
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:username forKey:KHkUsernameKey];
    [params setValue:password forKey:KHkPasswordKey];
    
    [self.manager get:@"login" parameters:params success:^(id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

@end
