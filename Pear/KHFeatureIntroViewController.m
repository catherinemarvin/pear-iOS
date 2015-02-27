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

@interface KHFeatureIntroViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController *pageController;
@property (nonatomic, strong) KHFeatureIntroductionDataSource *dataSource;


@end

@implementation KHFeatureIntroViewController

- (instancetype)init {
    if (self = [super init]) {
        _dataSource = [[KHFeatureIntroductionDataSource alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
    [self.pageController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.pageController didMoveToParentViewController:self];
}


#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if ([viewController conformsToProtocol:@protocol(KHFeatureIntroductionProtocol)]) {
        UIViewController<KHFeatureIntroductionProtocol> *vc = (UIViewController<KHFeatureIntroductionProtocol> *)viewController;
        NSUInteger index = [vc pageIndex];
        index--;
        return [self _viewControllerAtIndex:index];
    } else {
        return nil;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    if ([viewController conformsToProtocol:@protocol(KHFeatureIntroductionProtocol)]) {
        UIViewController<KHFeatureIntroductionProtocol> *vc = (UIViewController<KHFeatureIntroductionProtocol> *)viewController;
        NSUInteger index = [vc pageIndex];
        index++;
        return [self _viewControllerAtIndex:index];
    } else {
        return nil;
    }
}

- (UIViewController *)_viewControllerAtIndex:(NSUInteger)index {
    if (index < [self.dataSource count]) {
        KHFeatureIntroContentViewController *vc = [[KHFeatureIntroContentViewController alloc] init];
        vc.pageIndex = index;
        return vc;
    }
    return nil;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.dataSource count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}
@end
