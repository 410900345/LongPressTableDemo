//
//  ViewController.m
//  text123
//
//  Created by jiuhao-yangshuo on 16/1/11.
//  Copyright © 2016年 jiuhao. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+LongPressTable.h"
#import "UITableViewDataSource_LongPreeable.h"
#import "SNLogger.h"
//#import "CheckConfigUpdateAPI.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UITableViewDataSource_LongPreeable>
{
    UITableView *m_tableView;
    NSMutableArray *m_dataArray;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    m_dataArray = [[NSMutableArray alloc] init];
//    [self creatTableView];
//    for (int i = 0; i<10; i++) {
//        [m_dataArray addObject:@(i)];
//    }
////    集成代码
//    m_tableView.longPressTableAble = YES;
//    
//    DLog("%@",m_dataArray);

//    CheckConfigUpdateAPI *checkOrderInfoAPI = [[CheckConfigUpdateAPI alloc] init];
//    [checkOrderInfoAPI startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
//        NSLog(@"-----%@",request.responseString);
//    } failure:^(__kindof YTKBaseRequest *request) {
//        NSLog(@"-----%@",request.responseString);
//    }];
}

- (void)dealloc
{
    NSLog(@"----dealloc");
//    m_tableView.longPressTableAble = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)creatTableView
{
    m_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,  self.view.frame.size.width,  self.view.frame.size.height-64) style:UITableViewStylePlain];
    m_tableView.dataSource = self;
    m_tableView.delegate = self;
    m_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:m_tableView];
}

#pragma mark - UITableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return m_dataArray.count;
}

#pragma mark - UITableViewDataSource_LongPreeable
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float kCellHeight = 35;
//    switch (indexPath.row) {
//        case 0:
//            kCellHeight = 20;
//            break;
//        case 1:
//            kCellHeight = 30;
//            break;
//        default:
//            break;
//    }
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld", (long)indexPath.row];
    cell.textLabel.textColor = [UIColor blueColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [m_dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - UITableView Delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
