//
//  KHFeatureIntroductionDataSource.m
//  Pear
//
//  Created by Kevin Hwang on 2/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHFeatureIntroductionDataSource.h"
#import "KHFeatureIntroductionContent.h"

@interface KHFeatureIntroductionDataSource()

@property (nonatomic, strong) NSMutableArray *featureScreens;

@end

@implementation KHFeatureIntroductionDataSource

- (instancetype)init {
    if (self = [super init]) {
        _featureScreens = [NSMutableArray array];
        [self _setupFeatureScreens];
    }
    return self;
}

- (NSString *)imageNameForIndex:(NSUInteger)index {
    KHFeatureIntroductionContent *content = self.featureScreens[index];
    return content.imagePath;
}

- (NSString *)headerTextForIndex:(NSUInteger)index {
    KHFeatureIntroductionContent *content = self.featureScreens[index];
    return content.headerText;
}

- (NSString *)descriptionTextForIndex:(NSUInteger)index {
    KHFeatureIntroductionContent *content = self.featureScreens[index];
    return content.descriptionText;
}

- (void)_setupFeatureScreens {
    KHFeatureIntroductionContent *page1 = [[KHFeatureIntroductionContent alloc]
                                           initWithHeaderText:NSLocalizedString(@"Welcome 1", nil)
                                           descriptionText:NSLocalizedString(@"Description 1", nil)
                                           imagePath:@"feature_intro_background_1"];
    [self.featureScreens addObject:page1];
    
    KHFeatureIntroductionContent *page2 = [[KHFeatureIntroductionContent alloc]
                                           initWithHeaderText:NSLocalizedString(@"Welcome 2", nil)
                                           descriptionText:NSLocalizedString(@"Description 2", nil)
                                           imagePath:@"feature_intro_background_2"];
    [self.featureScreens addObject:page2];
}

@end
