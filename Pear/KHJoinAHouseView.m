//
//  KHJoinAHouseView.m
//  Pear
//
//  Created by Kevin Hwang on 3/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHJoinAHouseView.h"

// Helpers
#import <Masonry/Masonry.h>
#import "UIFont+KHAdditions.h"

@interface KHJoinAHouseView()

@property (nonatomic, strong) UIView *container;

@property (nonatomic, strong) UITextField *houseNameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UIButton *joinHouseButton;

@end

@implementation KHJoinAHouseView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _container = [[UIView alloc] init];
        [self addSubview:_container];
        
        _houseNameField = [[UITextField alloc] init];
        _houseNameField.placeholder = NSLocalizedString(@"House Name", nil);
        _houseNameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _houseNameField.backgroundColor = [UIColor lightGrayColor];
        _houseNameField.font = [UIFont regularWithSize:14.0f];
        [_container addSubview:_houseNameField];
        
        _passwordField = [[UITextField alloc] init];
        _passwordField.placeholder = NSLocalizedString(@"Password", nil);
        _passwordField.secureTextEntry = YES;
        _passwordField.backgroundColor = [UIColor lightGrayColor];
        _passwordField.font = [UIFont regularWithSize:14.0f];
        [_container addSubview:_passwordField];
        
        _joinHouseButton = [[UIButton alloc] init];
        _joinHouseButton.backgroundColor = [UIColor blackColor];
        [_container addSubview:_joinHouseButton];
        
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_initializeAutolayout {
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.passwordField);
        make.center.equalTo(self);
        make.left.and.right.equalTo(self);
    }];
    
    CGFloat buttonHeight = 44.0f;
    [self.houseNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.container);
        make.left.and.right.equalTo(self.container);
        make.height.mas_equalTo(buttonHeight);
    }];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.houseNameField.mas_bottom);
        make.left.and.right.equalTo(self.houseNameField);
        make.height.equalTo(self.houseNameField);
    }];
    
    [self.joinHouseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordField.mas_bottom);
        make.left.and.right.equalTo(self.container);
        make.height.mas_equalTo(buttonHeight);
    }];
}




@end
