//
//  NSString+SSAdd.h
//  12313213
//
//  Created by jiuhao-yangshuo on 16/5/24.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (SSAdd)

-(BOOL)containsString:(NSString *)astring;
- (NSString *)SXstringByReplacingWihtNSRegularExpressionString:(NSString *)expressionString withString:(NSString *)newString;
- (NSString *)URLEncoding;
- (NSString *)URLDecoding;
- (NSString *)trim;
- (BOOL)isEmpty;

- (NSString *)MD5Hex;

@end


@interface NSMutableAttributedString (SSAdd)

//替换字体颜色
+(NSMutableAttributedString *)replaceRedColorWithNSString:(NSString *)str andUseKeyWord:(NSString *)keyWord andWithFontSize:(float )size andWithFrontColor:(NSString *)frontColor;
//替换字体颜色和样式
+(NSMutableAttributedString *)replaceRedColorWithNSString:(NSString *)str andUseKeyWord:(NSString *)keyWord andWithCsutomFont:(UIFont*)font andWithFrontColor:(NSString *)frontColor;

@end
