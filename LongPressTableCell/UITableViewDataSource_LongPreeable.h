//
//  UITableViewDataSource_Draggable.h
//  jiuhaohealth4.2
//
//  Created by jiuhao-yangshuo on 16/3/16.
//  Copyright © 2016年 xuGuohong. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UITableViewDataSource_LongPreeable <UITableViewDelegate>

@required

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
