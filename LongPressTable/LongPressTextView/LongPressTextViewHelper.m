//
//  LongPressTextViewHelper.m
//  LongPressTable
//
//  Created by yangshuo on 16/8/18.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import "LongPressTextViewHelper.h"
#import "UITextView+Extras.h"

@interface LongPressTextViewHelper()

@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;
@property (strong, nonatomic) UILabel* m_selectionView;

@end


@implementation LongPressTextViewHelper

- (id)initWithView:(UITextView *)textView {
    self = [super init];
    if (self) {
        _m_textView = textView;
        [self setUpParameter];
    }
    return self;
}

- (void)setUpParameter {
     _tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [_m_textView addGestureRecognizer:_tapGestureRecognizer];
    
    _m_selectionView = [[UILabel alloc]initWithFrame:CGRectZero];
    _m_selectionView.font = [UIFont systemFontOfSize: 16];
    _m_selectionView.backgroundColor = [UIColor whiteColor];
    _m_selectionView.textColor = [UIColor blueColor];
    _m_selectionView.adjustsFontSizeToFitWidth = YES;
    [_m_textView addSubview:_m_selectionView];
}

- (void)setEnabled:(BOOL)enabled {
//    if (!enabled) {
//        [_tableView removeObserver:self forKeyPath:@"contentOffset"];
//        return;
//    }
    _enabled = enabled;
    _tapGestureRecognizer.enabled = enabled;
    _tapGestureRecognizer.enabled =  enabled;
    _m_textView.showsVerticalScrollIndicator = !enabled;
    _m_textView.editable = !enabled;
}

#pragma mark - Gesture Handling
-(void)handleTap:(UITapGestureRecognizer*)tap {
    if(tap.state == UIGestureRecognizerStateRecognized) {
        CGPoint tappedPoint = [tap locationInView:_m_textView];
        NSUInteger idx = [_m_textView closestCharacterIndexToPoint:tappedPoint];
        //        UITextGranularity granularity =_granularityControl.selectedSegmentIndex;
        UITextGranularity granularity  = UITextGranularityWord;
        UIBezierPath* selectionPathInTextView = [_m_textView selectionPathWithGranularity:granularity atIndex:idx];
        CGRect newFrame = CGPathGetPathBoundingBox(selectionPathInTextView.CGPath);
        NSRange selectRane = [_m_textView.myTextRange rangeValue];
        if (selectRane.location == NSNotFound) {
            [self dismissView];
            return;
        }
        NSString *srTxt  = [_m_textView.text substringWithRange:_m_textView.myTextRange.rangeValue];
        //         NSString *sre  = [m_textView.text substringWithRange:NSMakeRange(idx, 1)];
        //        m_selectionView.frame = [self.view convertRect:newFrame fromView:m_textView];
        _m_selectionView.frame = newFrame;
        _m_selectionView.text = @"123456";
         _m_selectionView.textColor = [UIColor blueColor];
        [self showFloatViewWithData];
    }
}

-(void)showFloatViewWithData {
    NSLog(@"-------");
//    FloatView *fv = [[FloatView alloc] initWithPointButton:m_selectionView withData:m_selectionView.text];
//    //    fv.delegate = self;
//    [fv setUpDeledate:self];
}

-(void)dismissView {
    [self removeHighlight];
}

- (void)removeHighlight {
    if (_m_textView.myTextRange.rangeValue.location != NSNotFound) {
        //remove highlight from previously selected word
        _m_textView.myTextRange = [NSValue valueWithRange:NSMakeRange(NSNotFound, 0)];
        _m_textView.frame = CGRectZero;
    }
}

@end
