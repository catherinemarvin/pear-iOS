//
//  KHFeatureIntroView.m
//  Pear
//
//  Created by Kevin Hwang on 2/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHFeatureIntroView.h"
#import <Masonry/Masonry.h>

@interface KHFeatureIntroView()

@property (nonatomic, strong) UILabel *pageIndex;

@end

@implementation KHFeatureIntroView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _pageIndex = [[UILabel alloc] init];
        [self addSubview:_pageIndex];
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_initializeAutolayout {
    [self.pageIndex mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

- (void)setPageNumber:(NSInteger)pageNumber {
    self.pageIndex.text = [NSString stringWithFormat:NSLocalizedString(@"Page %f", pageNumber)];
}

@end
