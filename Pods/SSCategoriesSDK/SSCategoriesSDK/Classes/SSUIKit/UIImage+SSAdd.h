//
//  UIImage+SSAdd.h
//  12313213
//
//  Created by jiuhao-yangshuo on 16/5/24.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SSAdd)

- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;

-(UIImage*)getSubImage:(CGRect)rect;
-(UIImage*)scaleToSize:(CGSize)size;

///  实心三角(颜色2选一)
///
///  @param fillColor    填充颜色
///  @param strokeColor  画笔颜色
///  @param weight       长
///  @param height       高
///  @param strokeWeight 画笔宽
///
///  @return 正三角形
+ (UIImage*)createImageWithFillColor:(UIColor*)fillColor andWithStrokeColor:(UIColor*)strokeColor withWeigt:(float)weight andWithHeight:(float)height andWithStrokeWeight:(float)strokeWeight;

@end
