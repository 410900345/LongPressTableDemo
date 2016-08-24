//
//  UITextView+LongPress.m
//  LongPressTable
//
//  Created by yangshuo on 16/8/18.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import "UITextView+LongPress.h"
#import "LongPressTextViewHelper.h"
#import <objc/runtime.h>

@implementation UITextView (LongPress)

- (LongPressTextViewHelper *)getHelper {
    LongPressTextViewHelper *helper = objc_getAssociatedObject(self, @selector(longPressTextViewAble));
    if(helper == nil) {
        helper = [[LongPressTextViewHelper alloc] initWithView:self];
        objc_setAssociatedObject(self, @selector(longPressTextViewAble), helper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return helper;
}

- (BOOL)longPressTextViewAble {
    return  [self getHelper].enabled;
}

- (void)setLongPressTextViewAble:(BOOL)able {
    [self getHelper].enabled = able;
}

@end
