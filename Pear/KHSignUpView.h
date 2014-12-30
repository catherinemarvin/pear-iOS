//
//  KHSignUpView.h
//  Pear
//
//  Created by Kevin Hwang on 12/29/14.
//  Copyright (c) 2014 Kevin Hwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHSignUpView : UIView

@property (nonatomic, strong, readonly) UITextField *usernameField;
@property (nonatomic, strong, readonly) UITextField *passwordField;
@property (nonatomic, strong, readonly) UIButton *signUpButton;

@end
