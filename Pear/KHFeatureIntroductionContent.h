//
//  KHFeatureIntroductionContent.h
//  Pear
//
//  Created by Kevin Hwang on 2/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHFeatureIntroductionContent : NSObject

- (instancetype)initWithHeaderText:(NSString *)headerText descriptionText:(NSString *)descriptionText imagePath:(NSString *)imagePath NS_DESIGNATED_INITIALIZER;

@property (nonatomic, strong, readonly) NSString *headerText;
@property (nonatomic, strong, readonly) NSString *descriptionText;
@property (nonatomic, strong, readonly) NSString *imagePath;

@end
