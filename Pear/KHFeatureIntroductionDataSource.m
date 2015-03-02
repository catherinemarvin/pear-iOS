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

- (NSUInteger)count {
    return [self.featureScreens count];
}

- (void)_setupFeatureScreens {
    KHFeatureIntroductionContent *page1 = [[KHFeatureIntroductionContent alloc]
                                           initWithHeaderText:NSLocalizedString(@"Welcome", nil)
                                           descriptionText:NSLocalizedString(@"Put your whiteboard away and simplify your household management.", nil)
                                           imagePath:@"feature_intro_background_1"];
    [self.featureScreens addObject:page1];
    
    KHFeatureIntroductionContent *page2 = [[KHFeatureIntroductionContent alloc]
                                           initWithHeaderText:NSLocalizedString(@"Finances", nil)
                                           descriptionText:NSLocalizedString(@"Just enter what you buy for the house and we'll crunch all the numbers for you.", nil)
                                           imagePath:@"feature_intro_background_2"];
    [self.featureScreens addObject:page2];
    
    KHFeatureIntroductionContent *page3 = [[KHFeatureIntroductionContent alloc]
                                           initWithHeaderText:NSLocalizedString(@"Balance Work", nil)
                                           descriptionText:NSLocalizedString(@"Tell us the chores and we'll make sure everybody pitches in.", nil) imagePath:@"feature_intro_background_3"];
    [self.featureScreens addObject:page3];
}

@end
