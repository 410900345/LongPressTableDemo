//
//  UIViewController+LongPressTable.m
//  jiuhaohealth4.2
//
//  Created by jiuhao-yangshuo on 16/3/16.
//  Copyright © 2016年 xuGuohong. All rights reserved.
//

#import "UITableView+LongPressTable.h"
#import "LongPressTableHelper.h"
#import <objc/runtime.h>

@implementation UITableView (LongPressTable)

- (LongPressTableHelper *)getHelper
{
    LongPressTableHelper *helper = objc_getAssociatedObject(self, @selector(longPressTableAble));
    if(helper == nil) {
        helper = [[LongPressTableHelper alloc] initWithCollectionView:self];
        objc_setAssociatedObject(self, @selector(longPressTableAble), helper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return helper;
}

-(BOOL)longPressTableAble
{
    return  [self getHelper].enabled;
}

-(void)setLongPressTableAble:(BOOL)longPressTableAble
{
     [self getHelper].enabled = longPressTableAble;
}
@end
