//
//  LongPressTextViewHelper.h
//  LongPressTable
//
//  Created by yangshuo on 16/8/18.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface LongPressTextViewHelper : NSObject

@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, strong) UITextView *m_textView;

- (id)initWithView:(UITextView *)textView;

@end
