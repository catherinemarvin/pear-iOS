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

@property (nonatomic, strong) RACSignal *formValidSignal;
@property (nonatomic, strong) KHJoinAHouseDataManager *dataManager;

@end

@implementation KHJoinAHouseViewModel

- (instancetype)init {
    if (self = [super init]) {
        _buttonTitle = NSLocalizedString(@"Join now", nil);
    }
    return self;
}

- (RACCommand *)joinHouseCommand {
    if (!_joinHouseCommand) {
        NSString *houseName = self.houseName;
        NSString *housePassword = self.housePassword;
        _joinHouseCommand = [[RACCommand alloc] initWithEnabled:self.formValidSignal signalBlock:^RACSignal *(id input) {
            return [self.dataManager joinWithHouseName:houseName password:housePassword];
        }];
    }
    return _joinHouseCommand;
}


@end
