//
//  KHSignUpView.m
//  Pear
//
//  Created by Kevin Hwang on 12/29/14.
//  Copyright (c) 2014 Kevin Hwang. All rights reserved.
//

#import "KHSignUpView.h"
#import "UIColor+KHHexString.h"
#import <Masonry/Masonry.h>
#import "UIImage+KHAdditions.h"

@interface KHSignUpView()

@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UIButton *signUpButton;

@end

static CGFloat KHkButtonHeight = 44.0f;

@implementation KHSignUpView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:@"3B7FB2"];
        
        _usernameField = [[UITextField alloc] init];
        [self _setupElement:_usernameField];
        _usernameField.placeholder = NSLocalizedString(@"Username", nil);
        _usernameField.backgroundColor = [UIColor whiteColor];
        _usernameField.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_usernameField];
        
        _passwordField = [[UITextField alloc] init];
        [self _setupElement:_passwordField];
        _passwordField.placeholder = NSLocalizedString(@"Password", nil);
        _passwordField.backgroundColor = [UIColor whiteColor];
        _passwordField.textAlignment = NSTextAlignmentCenter;
        _passwordField.secureTextEntry = YES;
        [self addSubview:_passwordField];
        
        _signUpButton = [[UIButton alloc] init];
        [self _setupElement:_signUpButton];
        [_signUpButton setTitle:NSLocalizedString(@"Sign up", nil) forState:UIControlStateNormal];
        [_signUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_signUpButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"79B4D5"]] forState:UIControlStateNormal];
        [self addSubview:_signUpButton];
        
        [self _initializeAutolayout];
    }
    return self;
}


- (void)_initializeAutolayout {
    CGFloat padding = 40.0f;
    
    CGFloat verticalPadding = 20.0f;
    
    [self.usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.passwordField.mas_top).with.offset(-verticalPadding);
        make.left.equalTo(self).with.offset(padding);
        make.right.equalTo(self).with.offset(-padding);
        make.height.equalTo(@(KHkButtonHeight));
    }];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(self.usernameField);
        make.height.equalTo(@(KHkButtonHeight));
    }];
    
    [self.signUpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.passwordField.mas_bottom).with.offset(verticalPadding);
        make.width.equalTo(self.usernameField);
        make.height.equalTo(@(KHkButtonHeight));
    }];
}

- (void)_setupElement:(UIView *)view {
    view.layer.cornerRadius = 5.0f;
    view.layer.masksToBounds = YES;
    view.layer.borderColor = [UIColor grayColor].CGColor;
    view.layer.borderWidth = 1.0f;
}

@end
