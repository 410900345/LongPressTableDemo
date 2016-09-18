//
//  CheckConfigUpdateAPI.m
//  WapsPayDemo
//
//  Created by yangshuo on 16/9/17.
//  Copyright © 2016年 waps. All rights reserved.
//

#import "CheckConfigUpdateAPI.h"

//#define YM_HOST                                   @"http://oc.umeng.com/v2/check_config_update"
#define YM_HOST    @"http://mobile.umeng.com/apps/87021190bdb042654e0daf25/online_config/update_parameter"
@implementation CheckConfigUpdateAPI
{
    NSDictionary *m_infoDict;
    NSString *userID_;
}
- (id)init {
    self = [super init];
    if (self) {
        //        m_infoDict = dict;
    }
    return self;
}

- (NSString *)requestUrl {
    NSString *requestString = YM_HOST ;
    return requestString;
}

- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (id)requestArgument {
    NSString *appKey = @"52fad0e456240bdb09112078";
    NSDictionary *param = @{
                            @"type":@"online_config",
                            @"appkey": appKey,
                            @"version_code": @"129",
                            @"package": @"com.xiaobin.ncenglishPro",
                              @"sdk_version": @"3.2.2",
                             
                            @"channel": @"appStore",
                            @"idmd5":@"ce43ccc1a039df76d421bc1551c0e3",
                            
                            @"report_policy":@"1",
                            @"last_config_time":@(-1),
                           
                            };
    return param;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

@end
