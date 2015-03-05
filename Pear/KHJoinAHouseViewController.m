//
//  KHJoinAHouseViewController.m
//  Pear
//
//  Created by Kevin Hwang on 3/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHJoinAHouseViewController.h"

// ViewModel
#import "KHJoinAHouseViewModel.h"

@interface KHJoinAHouseViewController ()

@property (nonatomic, strong) KHJoinAHouseViewModel *viewModel;

@end

@implementation KHJoinAHouseViewController

- (instancetype)init {
    if (self = [super init]) {
        _viewModel = [[KHJoinAHouseViewModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _bindViewModel];
}

- (void)_bindViewModel {
}

@end
