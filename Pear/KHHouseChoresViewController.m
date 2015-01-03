//
//  KHHouseChoresViewController.m
//  Pear
//
//  Created by Kevin Hwang on 1/3/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHHouseChoresViewController.h"

@interface KHHouseChoresViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *KHkHouseChoresCellIdentifier = @"houseChoresCell";

@implementation KHHouseChoresViewController

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.tableView = tableView;
    self.view = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"House Chores", nil);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:KHkHouseChoresCellIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KHkHouseChoresCellIdentifier forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDelegate
@end
