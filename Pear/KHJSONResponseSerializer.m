//
//  KHJSONRequestSerializer.m
//  Pear
//
//  Created by Kevin Hwang on 2/8/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHJSONResponseSerializer.h"


@implementation KHJSONResponseSerializer

- (instancetype)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error {
    if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {
        if (*error != nil) {
            NSMutableDictionary *userInfo = [(*error).userInfo mutableCopy];
            NSError *jsonError;
            // parse to json
            id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            // store the value in userInfo if JSON has no error
            if (jsonError == nil) {
                userInfo[KhkJSONResponseSerializerWithDataKey] = json;
            }
            NSError *newError = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
            (*error) = newError;
        }
        return (nil);
    }
    return ([super responseObjectForResponse:response data:data error:error]);
}

@end
