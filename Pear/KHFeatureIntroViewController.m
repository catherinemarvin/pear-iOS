//
//  KHFeatureIntroViewController.m
//  Pear
//
//  Created by Kevin Hwang on 2/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHFeatureIntroViewController.h"
#import "KHFeatureIntroContentViewController.h"

#import "KHFeatureIntroductionDataSource.h"

#import <Masonry/Masonry.h>

@interface KHFeatureIntroViewController ()

@property (nonatomic, strong) KHFeatureIntroductionDataSource *dataSource;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation KHFeatureIntroViewController

- (instancetype)init {
    if (self = [super init]) {
        _dataSource = [[KHFeatureIntroductionDataSource alloc] init];
        _scrollView = [[UIScrollView alloc] init];
        _pageControl = [[UIPageControl alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupScrollView];
    [self _setupPageControl];
    [self _setupIntroScreens];
}

- (void)_setupScrollView {
    [self.view addSubview:self.scrollView];
    self.scrollView.frame = self.view.bounds;
    CGSize pageScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pageScrollViewSize.width * [self.dataSource count], pageScrollViewSize.height);
    self.scrollView.pagingEnabled = YES;
}

- (void)_setupPageControl {
    [self.view addSubview:self.pageControl];
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [self.dataSource count];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
}

- (void)_setupIntroScreens {
    for (int i = 0; i < [self.dataSource count]; i++) {
        UIViewController *vc = [self _viewControllerAtIndex:i];
        [self addChildViewController:vc];
        CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
        CGFloat pageHeight = CGRectGetHeight(self.scrollView.frame);
        CGFloat xOffset = pageWidth * i;
        CGRect frame = CGRectMake(xOffset, 0, pageWidth, pageHeight);
        vc.view.frame = frame;
        [self.scrollView addSubview:vc.view];
        [vc didMoveToParentViewController:self];
    }
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

@end
