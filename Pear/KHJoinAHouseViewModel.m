//
//  KHJoinAHouseViewModel.m
//  Pear
//
//  Created by Kevin Hwang on 3/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHJoinAHouseViewModel.h"

// Data Manager
#import "KHJoinAHouseDataManager.h"

// Helper
#import <ReactiveCocoa.h>

@interface KHJoinAHouseViewModel()

@property (nonatomic, strong) KHJoinAHouseDataManager *dataManager;

@end

@implementation KHJoinAHouseViewModel

- (instancetype)init {
    if (self = [super init]) {
        _buttonTitle = NSLocalizedString(@"Join now", nil);
    }
    return self;
}

- (void)joinOrCreateHouse {
    NSLog(@"Wahoo");
}

@end
