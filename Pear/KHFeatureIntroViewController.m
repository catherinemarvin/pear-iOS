//
//  KHFeatureIntroViewController.m
//  Pear
//
//  Created by Kevin Hwang on 2/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHFeatureIntroViewController.h"
#import "KHFeatureIntroductionProtocol.h"
#import "KHFeatureIntroContentViewController.h"

@interface KHFeatureIntroViewController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *featureIntroScreens;

@end

@implementation KHFeatureIntroViewController

- (instancetype)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation options:(NSDictionary *)options {
    if (self = [super initWithTransitionStyle:style navigationOrientation:navigationOrientation options:options]) {
        self.delegate = self;
        self.dataSource = self;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.featureIntroScreens = [NSMutableArray array];
    
    KHFeatureIntroContentViewController *page1 = [[KHFeatureIntroContentViewController alloc] init];
    page1.pageIndex = 0;
    
    [self.featureIntroScreens addObject:page1];
    
    [self setViewControllers:self.featureIntroScreens direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
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
    return 1;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}


@end
