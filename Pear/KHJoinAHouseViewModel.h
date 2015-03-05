//
//  KHJoinAHouseViewModel.h
//  Pear
//
//  Created by Kevin Hwang on 3/4/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RACCommand;

@interface KHJoinAHouseViewModel : NSObject

@property (nonatomic, strong) NSString *houseName;
@property (nonatomic, strong) NSString *housePassword;
@property (nonatomic, strong, readonly) NSString *buttonTitle;

@property (nonatomic, strong) RACCommand *joinHouseCommand;

@end
