//
//  UIResponder+SSAdd.m
//  12313213
//
//  Created by jiuhao-yangshuo on 16/5/24.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import "UIResponder+SSAdd.h"



@implementation UIResponder (SSAdd)

- (void)routerEventWithName:(NSString *)eventName userInfo:(id )userInfo
{
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}

- (void)routerEventWithEventType:(SXEventType )eventName userInfo:(id)userInfo;
{
    [[self nextResponder] routerEventWithEventType:eventName userInfo:userInfo];
}
@end
