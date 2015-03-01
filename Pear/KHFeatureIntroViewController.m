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

@end

@implementation KHFeatureIntroViewController

- (instancetype)init {
    if (self = [super init]) {
        _dataSource = [[KHFeatureIntroductionDataSource alloc] init];
        _scrollView = [[UIScrollView alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.dataSource count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
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
