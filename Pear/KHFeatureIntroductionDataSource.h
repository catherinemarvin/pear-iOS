//
//  KHFeatureIntroductionDataSource.h
//  Pear
//
//  Created by Kevin Hwang on 2/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHFeatureIntroductionDataSource : NSObject

- (NSString *)imageNameForIndex:(NSUInteger)index;
- (NSString *)headerTextForIndex:(NSUInteger)index;
- (NSString *)descriptionTextForIndex:(NSUInteger)index;
- (NSUInteger)count;

@end
