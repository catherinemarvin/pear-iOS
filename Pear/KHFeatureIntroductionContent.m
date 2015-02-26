//
//  KHFeatureIntroductionContent.m
//  Pear
//
//  Created by Kevin Hwang on 2/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHFeatureIntroductionContent.h"

@interface KHFeatureIntroductionContent()

@property (nonatomic, strong) NSString *headerText;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) NSString *imagePath;

@end

@implementation KHFeatureIntroductionContent

- (instancetype)initWithHeaderText:(NSString *)headerText descriptionText:(NSString *)descriptionText imagePath:(NSString *)imagePath {
    if (self = [super init]) {
        _headerText = headerText;
        _descriptionText = descriptionText;
        _imagePath = imagePath;
    }
    return self;
}

@end
