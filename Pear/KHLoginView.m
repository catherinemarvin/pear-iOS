//
//  KHLoginView.m
//  Pear
//
//  Created by Kevin Hwang on 12/24/14.
//  Copyright (c) 2014 Kevin Hwang. All rights reserved.
//

#import "KHLoginView.h"
#import "Masonry.h"
#import "DDLog.h"

@interface KHLoginView()

@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UIButton *signInButton;
@property (nonatomic, strong) UIButton *signUpButton;

@end

static int ddLogLevel = LOG_LEVEL_VERBOSE;

static CGFloat KHkButtonHeight = 44.0f;

@implementation KHLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _usernameField = [[UITextField alloc] init];
        _usernameField.placeholder = NSLocalizedString(@"Username", nil);
        _usernameField.layer.cornerRadius = 2.0f;
        _usernameField.layer.masksToBounds = YES;
        _usernameField.layer.borderColor = [UIColor grayColor].CGColor;
        _usernameField.layer.borderWidth = 1.0f;
        [self addSubview:_usernameField];
        
        _passwordField = [[UITextField alloc] init];
        _passwordField.placeholder = NSLocalizedString(@"Password", nil);
        _passwordField.layer.cornerRadius = 2.0f;
        _passwordField.layer.masksToBounds = YES;
        _passwordField.layer.borderColor = [UIColor grayColor].CGColor;
        _passwordField.layer.borderWidth = 1.0f;
        [self addSubview:_passwordField];
        
        _signInButton = [[UIButton alloc] init];
        [_signInButton setTitle:NSLocalizedString(@"Sign in", nil) forState:UIControlStateNormal];
        [_signInButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_signInButton addTarget:self action:@selector(_signInTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_signInButton];
        
        _signUpButton = [[UIButton alloc] init];
        [_signUpButton setTitle:NSLocalizedString(@"Sign up", nil) forState:UIControlStateNormal];
        [_signUpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_signUpButton addTarget:self action:@selector(_signUpTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_signUpButton];
        
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_initializeAutolayout {
    CGFloat padding = 40.0f;
    
    [self.usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.passwordField.mas_top);
        make.left.equalTo(self).with.offset(padding);
        make.right.equalTo(self).with.offset(-padding);
        make.height.equalTo(@(KHkButtonHeight));
    }];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(self.usernameField);
        make.height.equalTo(@(KHkButtonHeight));
    }];
    
    [self.signInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.passwordField.mas_bottom);
        make.width.equalTo(self.usernameField);
    }];
    
    [self.signUpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.signInButton.mas_bottom);
        make.width.equalTo(self.usernameField);
    }];
    
}

#pragma mark - Button Taps

- (void)_signInTapped:(id)sender {
    DDLogInfo(@"Sign in tapped");
    [self.usernameField resignFirstResponder];
}

- (void)_signUpTapped:(id)sender {
    DDLogInfo(@"Sign up tapped");
    
}

@end
