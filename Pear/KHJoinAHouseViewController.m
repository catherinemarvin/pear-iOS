//
//  KHJoinAHouseViewController.m
//  Pear
//
//  Created by Kevin Hwang on 3/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

// Views
#import "KHJoinAHouseViewController.h"
#import "KHJoinAHouseView.h"

// ViewModel
#import "KHJoinAHouseViewModel.h"

// Helpers
#import <Masonry/Masonry.h>

@interface KHJoinAHouseViewController ()

@property (nonatomic, strong) KHJoinAHouseView *joinAHouseView;
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
    [self _setupCustomView];
    [self _bindViewModel];
}

- (void)_setupCustomView {
    KHJoinAHouseView *view = [[KHJoinAHouseView alloc] init];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)_bindViewModel {
}

@end
