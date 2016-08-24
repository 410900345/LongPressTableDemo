//
//  NSNull+SSAdd.h
//  12313213
//
//  Created by jiuhao-yangshuo on 16/5/24.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (SSAdd)

- (NSUInteger)length;
- (NSInteger)integerValue;
- (float)floatValue;
- (NSString *)description;
- (NSArray *)componentsSeparatedByString:(NSString *)separator;
- (id)objectForKey:(id)key;
- (BOOL)boolValue;
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)aSet;

@end
