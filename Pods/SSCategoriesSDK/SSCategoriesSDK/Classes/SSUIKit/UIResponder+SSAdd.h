//
//  UIResponder+SSAdd.h
//  12313213
//
//  Created by jiuhao-yangshuo on 16/5/24.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, SXEventType) {
    SXEventTypeBtn,
    SXEventTypeTitle,
    SXEventTypeTouch
};

@interface UIResponder (SSAdd)

/**
 *  发送一个路由器消息, 对eventName感兴趣的 UIResponsder 可以对消息进行处理
 *
 *  @param eventName 发生的事件名称
 *  @param userInfo  传递消息时, 携带的数据, 数据传递过程中, 会有新的数据添加
 *
 */
- (void)routerEventWithName:(NSString *)eventName userInfo:(id)userInfo;

- (void)routerEventWithEventType:(SXEventType )eventName userInfo:(id)userInfo;

@end
