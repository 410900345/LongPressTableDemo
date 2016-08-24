//
//  NSString+SSAdd.m
//  12313213
//
//  Created by jiuhao-yangshuo on 16/5/24.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import "NSString+SSAdd.h"
#import "UIColor+SSAdd.h"
#include <CommonCrypto/CommonDigest.h>

@implementation NSString (SSAdd)

-(BOOL)containsString:(NSString *)astring
{
    BOOL haveString = [self rangeOfString:astring].location != NSNotFound;
    return haveString;
}

- (NSString *)SXstringByReplacingWihtNSRegularExpressionString:(NSString *)expressionString withString:(NSString *)newString
{
    NSString *content = self;
    if (!content.length)
    {
        content = @"";
    }
    else
    {
        NSRegularExpression *regularExpretion=[NSRegularExpression regularExpressionWithPattern:expressionString
                                                                                        options:0
                                                                                          error:nil];
        
        content=[regularExpretion stringByReplacingMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, content.length) withTemplate:newString];
    }
    NSLog(@"------%@",content);
    return content;
}


- (NSString *)URLEncoding
{
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)URLDecoding
{
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)isEmpty
{
    return [self length] > 0 ? NO : YES;
}

- (NSString *)MD5Hex
{
    const char *str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

@end

@implementation NSMutableAttributedString (SSAdd)

+(NSMutableAttributedString *)replaceRedColorWithNSString:(NSString *)str andUseKeyWord:(NSString *)keyWord andWithFontSize:(float )size andWithFrontColor:(NSString *)frontColor
{
    NSMutableAttributedString *attrituteString = [[NSMutableAttributedString alloc] initWithString:str] ;
    NSRange range = [str rangeOfString:keyWord];
    [attrituteString setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:frontColor], NSFontAttributeName : [UIFont systemFontOfSize:size]} range:range];
    return attrituteString;
}

+(NSMutableAttributedString *)replaceRedColorWithNSString:(NSString *)str andUseKeyWord:(NSString *)keyWord andWithCsutomFont:(UIFont*)font andWithFrontColor:(NSString *)frontColor
{
    NSMutableAttributedString *attrituteString = [[NSMutableAttributedString alloc] initWithString:str] ;
    NSRange range = [str rangeOfString:keyWord];
    [attrituteString setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:frontColor], NSFontAttributeName :font} range:range];
    return attrituteString;
}

@end