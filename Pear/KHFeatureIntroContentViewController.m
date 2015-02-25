//
//  KHFeatureIntroContentViewController.m
//  Pear
//
//  Created by Kevin Hwang on 2/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHFeatureIntroContentViewController.h"
#import "KHFeatureIntroView.h"

@interface KHFeatureIntroContentViewController ()

@property (nonatomic, strong) KHFeatureIntroView *view;

@end


@implementation KHFeatureIntroContentViewController

@synthesize pageIndex = _pageIndex;

- (void)loadView {
    KHFeatureIntroView *featureIntro = [[KHFeatureIntroView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = featureIntro;
}

- (void)setPageIndex:(NSInteger)pageIndex {
    _pageIndex = pageIndex;
    
    [self.view setPageNumber:pageIndex];
}





@end
