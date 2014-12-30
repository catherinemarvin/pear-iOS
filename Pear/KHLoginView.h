//
//  KHLoginView.h
//  Pear
//
//  Created by Kevin Hwang on 12/24/14.
//  Copyright (c) 2014 Kevin Hwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KHLoginView : UIView

@property (nonatomic, strong, readonly) UITextField *usernameField;
@property (nonatomic, strong, readonly) UITextField *passwordField;
@property (nonatomic, strong, readonly) UIButton *signInButton;
@property (nonatomic, strong, readonly) UIButton *signUpButton;

@end
