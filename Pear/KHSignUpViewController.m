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
    [signupView.signUpButton addTarget:self action:@selector(_signUpTapped:) forControlEvents:UIControlEventTouchUpInside];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
