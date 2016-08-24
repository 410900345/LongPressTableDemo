//
//  UIColor+SSAdd.h
//  12313213
//
//  Created by jiuhao-yangshuo on 16/5/24.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SSAdd)

+ (UIColor*)colorWithHexString:(NSString*)stringToConvert;
+ (UIColor*)colorWithHexString:(NSString*)stringToConvert alpha:(CGFloat)alpha;

@end
