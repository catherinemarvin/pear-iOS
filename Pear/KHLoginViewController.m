//
//  KHLoginViewController.m
//  Pear
//
//  Created by Kevin Hwang on 12/24/14.
//  Copyright (c) 2014 Kevin Hwang. All rights reserved.
//

#import "KHLoginViewController.h"
#import "KHLoginView.h"
#import <MBProgressHUD.h>
#import <AFNetworking.h>
#import <CocoaLumberjack/DDLog.h>
#import "KHSignUpViewController.h"

@interface KHLoginViewController ()<UITextFieldDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) KHLoginView *loginView;
@property (nonatomic, assign) BOOL keyboardVisible;

@end

@implementation KHLoginViewController

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:frame];
    
    KHLoginView *loginView = [[KHLoginView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(scroll.bounds), 400)];
    loginView.usernameField.delegate = self;
    loginView.passwordField.delegate = self;
    [loginView.signInButton addTarget:self action:@selector(_attemptLogin) forControlEvents:UIControlEventTouchUpInside];
    [loginView.signUpButton addTarget:self action:@selector(_signUpTapped:) forControlEvents:UIControlEventTouchUpInside];
    [loginView setCenter:scroll.center];
    
    [scroll addSubview:loginView];
    
    scroll.contentSize = loginView.bounds.size;
    scroll.alwaysBounceVertical = YES;
    scroll.backgroundColor = loginView.backgroundColor;
    
    self.scrollView = scroll;
    self.loginView = loginView;
    self.view = scroll;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_keyboardWillHide:) name:UIKeyboardWillHideNotification object:self.view.window];
}

#pragma mark - Keyboard Notifications

- (void)_keyboardWillShow:(NSNotification *)n {
    if (self.keyboardVisible) {
        return;
    }
    
    NSDictionary *userInfo = [n userInfo];
    
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    CGPoint centerPoint = self.loginView.center;
    centerPoint.y -= floorf(keyboardSize.height / 2);
    
    self.loginView.center = centerPoint;
    
    self.keyboardVisible = YES;
}

- (void)_keyboardWillHide:(NSNotification *)n {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    self.loginView.center = self.view.center;
    self.keyboardVisible = NO;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.loginView.usernameField]) {
        [self.loginView.passwordField becomeFirstResponder];
        return NO;
    } else {
        [self _attemptLogin];
        return YES;
    }
}

#pragma mark - Button Tap
- (void)_signUpTapped:(id)sender {
    KHSignUpViewController *signUp = [[KHSignUpViewController alloc] init];
    [self.navigationController pushViewController:signUp animated:YES];
}

#pragma mark - Login
- (void)_attemptLogin {
    if ([self _validateFields]) {
    }
}

- (BOOL)_validateFields {
    NSString *alertTitle = NSLocalizedString(@"Sorry", @"Alert title");
    NSString *alertMessage;
    if ([self.loginView.usernameField.text length] == 0) {
        alertMessage = NSLocalizedString(@"Please enter a username.", nil);
    } else if ([self.loginView.passwordField.text length] == 0) {
        alertMessage = NSLocalizedString(@"Please enter a password.", nil);
    }
    
    if (alertMessage) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:alertTitle message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
        return NO;
    } else {
        return YES;
    }
}
@end
