//
//  KHFeatureIntroductionProtocol.h
//  Pear
//
//  Created by Kevin Hwang on 2/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KHFeatureIntroductionProtocol <NSObject>

@property (nonatomic, assign) NSInteger pageIndex;

- (void)setBackgroundImage:(NSString *)imageString;
- (void)setHeaderText:(NSString *)headerText;
- (void)setDescriptionText:(NSString *)descriptionText;

@end
