//
//  LongPressTableHelper.h
//  jiuhaohealth4.2
//
//  Created by jiuhao-yangshuo on 16/3/16.
//  Copyright © 2016年 xuGuohong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LongPressTableHelper : NSObject

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGestureRecognizer;

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

@property (nonatomic, strong) UIButton *deleteButton;

@property (nonatomic, assign) BOOL enabled;

- (id)initWithCollectionView:(UITableView *)tableView;

@end
