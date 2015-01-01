//
//  KHSignUpViewController.m
//  Pear
//
//  Created by Kevin Hwang on 12/29/14.
//  Copyright (c) 2014 Kevin Hwang. All rights reserved.
//

#import "KHSignUpViewController.h"
#import "KHSignUpView.h"

@interface KHSignUpViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) KHSignUpView *signUpView;

@end

@implementation KHSignUpViewController

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:frame];
    KHSignUpView *signupView = [[KHSignUpView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(scroll.bounds), 400)];
    signupView.usernameField.delegate = self;
    signupView.passwordField.delegate = self;
    [signupView.signUpButton addTarget:self action:@selector(_attemptSignup) forControlEvents:UIControlEventTouchUpInside];
    [signupView setCenter:scroll.center];
    
    [scroll addSubview:signupView];
    
    scroll.contentSize = signupView.bounds.size;
    scroll.alwaysBounceVertical = YES;
    scroll.backgroundColor = signupView.backgroundColor;
    
    self.scrollView = scroll;
    self.signUpView = signupView;
    self.view = scroll;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.signUpView.usernameField]) {
        [self.signUpView.passwordField becomeFirstResponder];
        return NO;
    } else {
        [self _attemptSignup];
        return YES;
    }
}

#pragma mark - Button Tap

- (void)_signUpTapped:(id)sender {
    
}

#pragma mark - Signup

- (void)_attemptSignup {
    if ([self _validateFields]) {
        
    }
}

- (BOOL)_validateFields {
    NSString *alertTitle = NSLocalizedString(@"Sorry", @"Alert title");
    NSString *alertMessage;
    if ([self.signUpView.usernameField.text length] == 0) {
        alertMessage = NSLocalizedString(@"Please enter a username.", nil);
    } else if ([self.signUpView.passwordField.text length] == 0) {
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
