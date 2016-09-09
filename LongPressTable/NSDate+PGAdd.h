//
//  NSDate+PGAdd.h
//  PGSShopkeeper
//
//  Created by yangshuo on 16/9/7.
//  Copyright © 2016年 JLRC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (PGAdd)

- (NSString*)formatCreatetTime:(NSDate*)time;

+ (long long)fetchLongTime;
+ (long long)fetchLongZeroTime;
+ (long long)fetchLonglongTime;

+ (NSString*)fetchServerTime:(long long)timeLine type:(int)type;
+ (NSString*)fetchServerTimeForStr:(NSString*)dateString type:(int)type;

@end
