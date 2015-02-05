//
//  KHLoginDataManager.m
//  Pear
//
//  Created by Kevin Hwang on 2/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHLoginDataManager.h"
#import <AFNetworking/AFNetworking.h>

@interface KHLoginDataManager()

@property (nonatomic, weak) id<KHLoginDataManagerDelegate>delegate;

@end

@implementation KHLoginDataManager

- (instancetype)initWithDelegate:(id<KHLoginDataManagerDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:username forKey:@"username"];
    [params setValue:password forKey:@"password"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:@"http://pear-soap.herokuapp.com/api/v1.0/login" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Response: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
