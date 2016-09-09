//
//  MainViewController.m
//  LongPressTable
//
//  Created by jiuhao-yangshuo on 16/3/18.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "UITextView+LongPress.h"
#import <SSCategories.h>
#import "SNLogger.h"

#define kDeviceWidth  320
#define kDeviceHeight  440

@implementation MainViewController
{
    UITextView *m_textView;
    UILabel *m_subTitleLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, 50, 30);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [self getsSubViews];
    
     DLog("%@",self.view.subviews);
    SNLogError("%@",self.view.subviews);
    SNLogWarn("%@",self.view.subviews);
    SNLogInfo("%@",self.view.subviews);
     SNLogDebug("%@",self.view.subviews);
}

-(void)btnClick {
//    ViewController *vc = [[ViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    

}

- (void)getsSubViews {
    m_textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 100, kDeviceWidth -2*10, kDeviceHeight)];
    m_textView.editable = NO;
    m_textView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:m_textView];
     m_textView.font = [UIFont systemFontOfSize:16.];
    m_textView.textColor = [UIColor blueColor];
    m_textView.showsVerticalScrollIndicator = NO;
    m_textView.longPressTextViewAble = YES;
    m_textView.textContainerInset = UIEdgeInsetsMake(0,0,0,0);
    m_textView.text = @"ViewController *vc = [[ViewController alloc] init];";
    
//    [m_textView sizeToFit];
//    [m_textView sizeThatFits:CGSizeMake(320, 999)];
    m_subTitleLabel = [[self class] createLabel:CGRectMake(10, 160, kDeviceWidth - 10*2 , m_textView.frame.size.height) TextColor:nil Font:[UIFont systemFontOfSize:16] textAlignment:NSTextAlignmentLeft labTitle:m_textView.text];
    [self.view addSubview:m_subTitleLabel];
    m_subTitleLabel.numberOfLines = 0;
    [m_subTitleLabel sizeToFit];
    
    m_textView.frameHeight = m_subTitleLabel.frameHeight;
}

+ (UILabel*)createLabel:(CGRect)rect TextColor:(NSString*)color Font:(UIFont*)font textAlignment:(NSTextAlignment)alignment labTitle:(NSString*)title
{
    UILabel* lab = [[UILabel alloc] initWithFrame:rect] ;
    lab.backgroundColor = [UIColor blueColor];
    lab.textColor = [UIColor redColor];
    lab.font = font;
    lab.textAlignment = alignment;
    if (title) {
        lab.text = title;
    }
    
    return lab;
}
                     
    + (CGSize)sizeForAllString:(NSString*)title andFont:(int)frontSize andWight:(int)weight
    {
        UIFont* front = [UIFont systemFontOfSize:frontSize];
        CGSize size;
       
            NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                        front,
                                        NSFontAttributeName,
                                        nil];
            //        size = [title sizeWithAttributes:attributes];
            CGRect rect = [title boundingRectWithSize:CGSizeMake(weight, CGFLOAT_MAX)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:attributes
                                              context:nil];
            size = rect.size;
 
        return size;
    }
    
@end
