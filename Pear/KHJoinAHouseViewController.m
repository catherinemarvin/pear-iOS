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
#import <ReactiveCocoa/ReactiveCocoa.h>

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
    self.joinAHouseView = view;
}

- (void)_bindViewModel {
    RAC(self.viewModel, houseName) = [self.joinAHouseView.houseNameField rac_textSignal];
    RAC(self.viewModel, housePassword) = [self.joinAHouseView.passwordField rac_textSignal];
    RAC(self.joinAHouseView.joinHouseButton.titleLabel, text) = RACObserve(self.viewModel, buttonTitle);
    [self.joinAHouseView.joinHouseButton rac_liftSelector:@selector(setTitle:forState:) withSignals:RACObserve(self.viewModel, buttonTitle), [RACSignal return:@(UIControlStateNormal)], nil];
    
    RACCommand *joinHouseCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self.viewModel joinHouse];
    }];
    
}

@end
