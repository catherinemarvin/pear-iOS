//
//  KHAPIManager.h
//  Pear
//
//  Created by Kevin Hwang on 2/6/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

@interface KHAPIManager : NSObject

- (void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSDictionary *errorDictionary, NSError *error))failure;
- (void)post:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSDictionary *errorDictionary, NSError *error))failure;

- (RACSignal *)get:(NSString *)url parameters:(NSDictionary *)parameters;

- (RACSignal *)post:(NSString *)url parameters:(NSDictionary *)parameters;
@end
