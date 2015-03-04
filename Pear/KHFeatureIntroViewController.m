//
//  KHFeatureIntroViewController.m
//  Pear
//
//  Created by Kevin Hwang on 2/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

// VCs
#import "KHFeatureIntroViewController.h"
#import "KHFeatureIntroContentViewController.h"

// Data Source
#import "KHFeatureIntroductionDataSource.h"

// Helper
#import "UIColor+KHHexString.h"

// Views
#import <Masonry/Masonry.h>
#import "UIFont+KHAdditions.h"

@interface KHFeatureIntroViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) KHFeatureIntroductionDataSource *dataSource;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIButton *callToAction;

@end

@implementation KHFeatureIntroViewController

- (instancetype)init {
    if (self = [super init]) {
        _dataSource = [[KHFeatureIntroductionDataSource alloc] init];
        _scrollView = [[UIScrollView alloc] init];
        _pageControl = [[UIPageControl alloc] init];
        _callToAction = [[UIButton alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupScrollView];
    [self _setupPageControl];
    [self _setupIntroScreens];
    [self _setupCallToAction];
    [self _setupAutolayout];
}

- (void)_setupScrollView {
    [self.view addSubview:self.scrollView];
    self.scrollView.frame = self.view.bounds;
    CGSize pageScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pageScrollViewSize.width * [self.dataSource count], pageScrollViewSize.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
}

- (void)_setupPageControl {
    [self.view addSubview:self.pageControl];
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [self.dataSource count];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
}

- (void)_setupIntroScreens {
    // Add the last intro screen behind the first one.
    UIViewController *firstVC = ({
        UIViewController *vc = [self _viewControllerAtIndex:[self.dataSource count] - 1];
        [self addChildViewController:vc];
        CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
        CGFloat pageHeight = CGRectGetHeight(self.scrollView.frame);
        CGFloat xOffset = 0;
        CGRect frame = CGRectMake(xOffset, 0, pageWidth, pageHeight);
        vc.view.frame = frame;
        [self.scrollView addSubview:vc.view];
        vc;
    });
    [firstVC didMoveToParentViewController:self];
    
    for (int i = 0; i < [self.dataSource count]; i++) {
        UIViewController *vc = [self _viewControllerAtIndex:i];
        [self addChildViewController:vc];
        CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
        CGFloat pageHeight = CGRectGetHeight(self.scrollView.frame);
        CGFloat xOffset = pageWidth * (i + 1);
        CGRect frame = CGRectMake(xOffset, 0, pageWidth, pageHeight);
        vc.view.frame = frame;
        [self.scrollView addSubview:vc.view];
        [vc didMoveToParentViewController:self];
    }
    
    UIViewController *lastVC = ({
        UIViewController *vc = [self _viewControllerAtIndex:0];
        [self addChildViewController:vc];
        CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
        CGFloat pageHeight = CGRectGetHeight(self.scrollView.frame);
        CGFloat xOffset = pageWidth * ([self.dataSource count] + 1);
        CGRect frame = CGRectMake(xOffset, 0, pageWidth, pageHeight);
        vc.view.frame = frame;
        [self.scrollView addSubview:vc.view];
        vc;
    });
    [lastVC didMoveToParentViewController:self];
}

- (void)_setupCallToAction {
    [self.view addSubview:self.callToAction];
    self.callToAction.backgroundColor = [UIColor colorWithHexString:@"fed136"];
    [self.callToAction setTitle:[NSLocalizedString(@"Let's go!", nil) uppercaseStringWithLocale:[NSLocale currentLocale]] forState:UIControlStateNormal];
    self.callToAction.titleLabel.font = [UIFont boldWithSize:14];
}

- (void)_setupAutolayout {
    CGFloat padding = 20.0f;
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.callToAction.mas_top).with.offset(-padding);
    }];
    
    CGFloat buttonHeight = 44.0f;
    [self.callToAction mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.mas_equalTo(buttonHeight);
    }];
}

#pragma mark - Appearance

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Helpers

- (UIViewController *)_viewControllerAtIndex:(NSUInteger)index {
    if (index < [self.dataSource count]) {
        KHFeatureIntroContentViewController *vc = [[KHFeatureIntroContentViewController alloc] init];
        vc.pageIndex = index;
        [vc setHeaderText:[self.dataSource headerTextForIndex:index]];
        [vc setDescriptionText:[self.dataSource descriptionTextForIndex:index]];
        [vc setBackgroundImage:[self.dataSource imageNameForIndex:index]];
        return vc;
    }
    return nil;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page =lround(fractionalPage);
    self.pageControl.currentPage = page;
}

@end
