//
//  NSDate+PGAdd.m
//  PGSShopkeeper
//
//  Created by yangshuo on 16/9/7.
//  Copyright © 2016年 JLRC. All rights reserved.
//

#import "NSDate+PGAdd.h"

@implementation NSDate (PGAdd)

- (NSString*)formatCreatetTime:(NSDate*)time {
    if ((NSNull*)time == [NSNull null]) {
        return @"";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //    formateDate
    NSString *dateString = [formatter stringFromDate:time];
    return dateString;
}

//获得当前时间
+ (long long)fetchLongTime {
    NSDate* now = [NSDate date];
    //    NSLog(@"%@",now);
    long long test = (long long)[now timeIntervalSince1970];
    return test;
}

//获得当前时间
+ (long long)fetchLongZeroTime {
    NSDate* now = [NSDate date];
    //    NSLog(@"%@",now);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //    formateDate
    NSString *dateString = [formatter stringFromDate:now];
    NSDate *zeroDate = [formatter dateFromString:dateString];
    long long test = (long long)[zeroDate timeIntervalSince1970];
    return test;
}

//获得当前时间
+ (long long)fetchLonglongTime {
    NSDate* now = [NSDate date];
    long long test = (long long)([now timeIntervalSince1970]*1000);
    return test;
}


//服务器返回时间戳进行转换
+ (NSString*)fetchServerTime:(long long)timeLine type:(int)type {
    NSString *timeStr = [NSString stringWithFormat:@"%lld", timeLine];
    NSString* currentDateStr = [self fetchServerTimeForStr:timeStr type:type];
    return currentDateStr;
}

+ (NSString*)fetchServerTimeForStr:(NSString*)dateString type:(int)type {
    if (dateString.length > 10) {
        dateString = [dateString substringToIndex:10];
    }
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss +0000"];
    NSTimeInterval time = dateString.longLongValue;
    NSDate* detaildate = [NSDate dateWithTimeIntervalSince1970:time];;
    NSString* currentDateStr = nil;
    switch (type) {
        case 1:
            [dateFormatter setDateFormat:@"HH:mm"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            break;
        case 2:
            [dateFormatter setDateFormat:@"MM月dd号"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
        case 3:
            [dateFormatter setDateFormat:@"MM-dd HH:mm"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
        case 4:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
        case 5:
            [dateFormatter setAMSymbol:@"上午"];
            [dateFormatter setPMSymbol:@"下午"];
            [dateFormatter setDateFormat:@"MM月dd日,EEE aHH:mm"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
        case 6:
            [dateFormatter setDateFormat:@"yyyy年MM月"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
        case 7:
            [dateFormatter setDateFormat:@"dd"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
        case 8:
            [dateFormatter setDateFormat:@"yyyy.MM.dd"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
        case 9:
            [dateFormatter setDateFormat:@"yyyy.MM.dd HH:mm"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
        case 10:
            [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
        case 11:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
        case 12:
            [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
        case 13:
            [dateFormatter setDateFormat:@"MM-dd"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
   
        case 14:
            [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
        default:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            currentDateStr = [dateFormatter stringFromDate:detaildate];
            
            break;
    }
    return currentDateStr;
}
@end
