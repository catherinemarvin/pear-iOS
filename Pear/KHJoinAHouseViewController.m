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

@property (nonatomic, strong) KHJoinAHouseView *view;
@property (nonatomic, strong) KHJoinAHouseViewModel *viewModel;

@end

@implementation KHJoinAHouseViewController

- (instancetype)init {
    if (self = [super init]) {
        _viewModel = [[KHJoinAHouseViewModel alloc] init];
    }
    return self;
}

- (void)loadView {
    KHJoinAHouseView *view = [[KHJoinAHouseView alloc] init];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _bindViewModel];
}

- (void)_setupCustomView {
}

- (void)_bindViewModel {
    RAC(self.viewModel, houseName) = [self.view.houseNameField rac_textSignal];
    RAC(self.viewModel, housePassword) = [self.view.passwordField rac_textSignal];
    RAC(self.view.joinHouseButton.titleLabel, text) = RACObserve(self.viewModel, buttonTitle);
    [self.view.joinHouseButton rac_liftSelector:@selector(setTitle:forState:) withSignals:RACObserve(self.viewModel, buttonTitle), [RACSignal return:@(UIControlStateNormal)], nil];
    
    self.view.joinHouseButton.rac_command = self.viewModel.joinHouseCommand;
}

@end
