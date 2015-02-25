//
//  KHFeatureIntroViewController.m
//  Pear
//
//  Created by Kevin Hwang on 2/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHFeatureIntroViewController.h"
#import "KHFeatureIntroContentViewController.h"

#import <Masonry/Masonry.h>

@interface KHFeatureIntroViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController *pageController;

@property (nonatomic, strong) NSMutableArray *featureIntroScreens;

@end

@implementation KHFeatureIntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    
    self.featureIntroScreens = [NSMutableArray array];
    
    KHFeatureIntroContentViewController *page1 = [[KHFeatureIntroContentViewController alloc] init];
    page1.pageIndex = 0;
    
    KHFeatureIntroContentViewController *page2 = [[KHFeatureIntroContentViewController alloc] init];
    page2.pageIndex = 1;
    
    [self.featureIntroScreens addObject:page1];
    [self.featureIntroScreens addObject:page2];
    
    // Since we display one screen at a time, we pass in just the first screen, and the data source handles the rest.
    NSArray *displayScreens = [NSArray arrayWithObject:[self.featureIntroScreens firstObject]];
    [self.pageController setViewControllers:displayScreens direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    
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
    if (index < [self.featureIntroScreens count]) {
        return [self.featureIntroScreens objectAtIndex:index];
    } else {
        return nil;
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.featureIntroScreens count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}
@end
