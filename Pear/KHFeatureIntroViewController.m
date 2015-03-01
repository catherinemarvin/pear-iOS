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
        _scrollView.pagingEnabled = YES;
        _pageControl = [[UIPageControl alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupScrollView];
    [self _setupPageControl];
}

- (void)_setupScrollView {
    [self.view addSubview:self.scrollView];
    self.scrollView.frame = self.view.bounds;
    CGSize pageScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pageScrollViewSize.width * [self.dataSource count], pageScrollViewSize.height);
    
}

- (void)_setupPageControl {
    [self.view addSubview:self.pageControl];
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [self.dataSource count];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
}

#pragma mark - Helpers

- (NSArray *)_initialPageControllerVCs {
    UIViewController *vc = [self _viewControllerAtIndex:0];
    return [NSArray arrayWithObject:vc];
}

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
