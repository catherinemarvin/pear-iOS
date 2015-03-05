//
//  KHJoinAHouseView.m
//  Pear
//
//  Created by Kevin Hwang on 3/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHJoinAHouseView.h"

#import <Masonry/Masonry.h>

@interface KHJoinAHouseView()

@property (nonatomic, strong) UITextField *houseNameField;
@property (nonatomic, strong) UITextField *passwordField;

@end

@implementation KHJoinAHouseView

- (instancetype)init {
    if (self = [super init]) {
        _houseNameField = [[UITextField alloc] init];
        _houseNameField.placeholder = NSLocalizedString(@"House Name", nil);
        [self addSubview:_houseNameField];
        
        _passwordField = [[UITextField alloc] init];
        _passwordField.placeholder = NSLocalizedString(@"Password", nil);
        _passwordField.secureTextEntry = YES;
        [self addSubview:_passwordField];
        
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_initializeAutolayout {
    [self.houseNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.left.and.right.equalTo(self);
    }];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.houseNameField.mas_bottom);
        make.left.and.right.equalTo(self.houseNameField);
    }];
}




@end
