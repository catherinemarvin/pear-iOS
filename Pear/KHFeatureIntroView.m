//
//  KHFeatureIntroView.m
//  Pear
//
//  Created by Kevin Hwang on 2/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHFeatureIntroView.h"
#import "UIFont+KHAdditions.h"
#import <Masonry/Masonry.h>

@interface KHFeatureIntroView()

@property (nonatomic, strong) UIImageView *backgroundImage;
@property (nonatomic, strong) UILabel *headerTextLabel;
@property (nonatomic, strong) UILabel *descriptionTextLabel;

@end

@implementation KHFeatureIntroView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _backgroundImage = ({
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView;
        });
        [self addSubview:_backgroundImage];
        
        _headerTextLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont regularWithSize:24];
            label.textColor = [UIColor whiteColor];
            label.textAlignment = NSTextAlignmentCenter;
            
            label;
        });
        [_backgroundImage addSubview:_headerTextLabel];
        
        _descriptionTextLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont regularWithSize:14];
            label.textColor = [UIColor whiteColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.numberOfLines = 0;
            label;
        });
        [_backgroundImage addSubview:_descriptionTextLabel];
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_initializeAutolayout {
    CGFloat sidePadding = 40.0f;
    [self.backgroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.headerTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(sidePadding);
        make.right.equalTo(self).with.offset(-sidePadding);
    }];
    
    CGFloat padding = 20.0f;
    [self.descriptionTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerTextLabel.mas_bottom).with.offset(padding);
        make.left.and.right.equalTo(self.headerTextLabel);
    }];
}

- (void)setHeaderText:(NSString *)headerText {
    self.headerTextLabel.text = headerText;
}

- (void)setDescriptionText:(NSString *)descriptionText {
    self.descriptionTextLabel.text = descriptionText;
}

- (void)setBackgroundImageFromString:(NSString *)backgroundImageText {
    self.backgroundImage.image = [UIImage imageNamed:backgroundImageText];
}

@end
