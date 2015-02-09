//
//  KHAPIManager.m
//  Pear
//
//  Created by Kevin Hwang on 2/6/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHAPIManager.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "KHJSONResponseSerializer.h"

@interface KHAPIManager ()

@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

@end

static NSString *KHkPearSoapBaseUrl = @"http://pear-soap.herokuapp.com/api/v1.0/";

@implementation KHAPIManager

- (instancetype)init {
    if (self = [super init]) {
        _baseUrl = KHkPearSoapBaseUrl;
        
        NSURL *baseUrl = [NSURL URLWithString:KHkPearSoapBaseUrl];
        _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseUrl];
        _manager.responseSerializer = [KHJSONResponseSerializer serializer];
    }
    return self;
}

- (void)get:(NSString *)url
 parameters:(NSDictionary *)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSDictionary *errorDictionary, NSError *error))failure {
    [self.manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:
    ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:operation.responseData options:0 error:&jsonError];
        
        failure(json, error);
    }];
}

- (void)post:(NSString *)url
  parameters:(NSDictionary *)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSDictionary *errorDictionary, NSError *error))failure {
    [self.manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:operation.responseData options:0 error:&jsonError];
        
        failure(json, error);
    }];
}

@end
