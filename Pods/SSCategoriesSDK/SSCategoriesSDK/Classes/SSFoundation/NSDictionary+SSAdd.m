//
//  NSDictionary+SSAdd.m
//  12313213
//
//  Created by jiuhao-yangshuo on 16/5/24.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import "NSDictionary+SSAdd.h"

@implementation NSDictionary (SSAdd)


@end


@implementation NSMutableDictionary (SSAdd)

- (void)replaceOldKeyy:(id)oldKey withNewKey:(id)newKey
{
    id value = [self objectForKey:oldKey];
    if (value) {
        [self setObject:value forKey:newKey];
        [self removeObjectForKey:oldKey];
    }
}

@end