//
//  KHLoginViewController.m
//  Pear
//
//  Created by Kevin Hwang on 12/24/14.
//  Copyright (c) 2014 Kevin Hwang. All rights reserved.
//

#import "KHLoginViewController.h"
#import "KHLoginView.h"

@interface KHLoginViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation KHLoginViewController

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:frame];
    
    KHLoginView *loginView = [[KHLoginView alloc] initWithFrame:scroll.bounds];
    [scroll addSubview:loginView];
    
    scroll.contentSize = loginView.bounds.size;
    
    self.scrollView = scroll;
    self.view = scroll;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_keyboardDidShow:) name:UIKeyboardDidShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_keyboardWillHide:) name:UIKeyboardWillHideNotification object:self.view.window];
}

#pragma mark - Keyboard Notifications

- (void)_keyboardDidShow:(NSNotification *)n {
    NSDictionary *userInfo = [n userInfo];
    
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
}

- (void)_keyboardWillHide:(NSNotification *)n {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}
@end
