//
//  KHLoginDataManager.m
//  Pear
//
//  Created by Kevin Hwang on 2/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHLoginDataManager.h"

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
    [self.delegate loginSucceeded:@"fakeKey"];
}

@end
