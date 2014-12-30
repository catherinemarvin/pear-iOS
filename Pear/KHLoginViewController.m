//
//  KHLoginViewController.m
//  Pear
//
//  Created by Kevin Hwang on 12/24/14.
//  Copyright (c) 2014 Kevin Hwang. All rights reserved.
//

#import "KHLoginViewController.h"
#import "KHLoginView.h"

@interface KHLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) KHLoginView *loginView;

@property (nonatomic, strong) UITextField *activeField;

@end

@implementation KHLoginViewController

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:frame];
    
    KHLoginView *loginView = [[KHLoginView alloc] initWithFrame:scroll.bounds];
    loginView.usernameField.delegate = self;
    loginView.passwordField.delegate = self;
    
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
    NSDictionary *userInfo = [n userInfo];
    
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    CGSize contentSize = self.scrollView.contentSize;
    contentSize.height -= keyboardSize.height;
    self.scrollView.contentSize = contentSize;
    
    
    CGPoint scrollPoint = CGPointMake(0, CGRectGetMinY(self.loginView.usernameField.frame));
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)_keyboardWillHide:(NSNotification *)n {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.activeField = nil;
}
@end
