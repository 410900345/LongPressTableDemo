//
//  NSArray+SSAdd.h
//  12313213
//
//  Created by jiuhao-yangshuo on 16/5/24.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SSAdd)

- (id)safeObjectAtIndex:(NSUInteger)index;

- (id)deepCopy;
- (id)mutableDeepCopy;

- (id)trueDeepCopy;
- (id)trueDeepMutableCopy;

@end


@interface NSMutableArray (SSAdd)

+ (NSMutableArray *)randomSortArrayWithArray:(NSMutableArray *)yourMutableArray;//乱序

@end