//
//  UIButton+category.m
//  LongPressTable
//
//  Created by jiuhao-yangshuo on 16/3/18.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import "UIButton+category.h"
#import <objc/runtime.h>

@implementation UIButton (category)

- (void)setIndexPath:(NSIndexPath *)indexPath {
    objc_setAssociatedObject(self, @selector(indexPath), indexPath, OBJC_ASSOCIATION_RETAIN);
}

- (NSIndexPath *)indexPath {
    id obj = objc_getAssociatedObject(self, _cmd);
    if([obj isKindOfClass:[NSIndexPath class]]) {
        return (NSIndexPath *)obj;
    }
    return nil;
}
@end
