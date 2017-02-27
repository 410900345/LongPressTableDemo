//
//  LongPressTableHelper.m
//  jiuhaohealth4.2
//
//  Created by jiuhao-yangshuo on 16/3/16.
//  Copyright © 2016年 xuGuohong. All rights reserved.
//

#import "LongPressTableHelper.h"
#import "UITableViewDataSource_LongPreeable.h"
#import "UIButton+category.h"

#define kDeleteButtonWidth  80
#define kDeleteButtonHeight  44
static int kObservingTableViewLayoutContext;

@implementation LongPressTableHelper {
    NSIndexPath *_editingIndexPath;
}

- (void)dealloc {
//     NSLog(@"LongPressTableHelper------------");
}

- (id)initWithCollectionView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        _tableView = tableView;
        
        _longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        _longPressGestureRecognizer.minimumPressDuration = 0.5;
        [_tableView addGestureRecognizer:_longPressGestureRecognizer];
        
        [_tableView addObserver:self
                          forKeyPath:@"contentOffset"
                             options:0
                             context:&kObservingTableViewLayoutContext];
        
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteButton.frame = CGRectMake(tableView.frame.size.width, 0, kDeleteButtonWidth, kDeleteButtonHeight);
        _deleteButton.backgroundColor = [UIColor redColor];
        _deleteButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        _deleteButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [_deleteButton setTitle:NSLocalizedString(@"删除",@"") forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteItem:) forControlEvents:UIControlEventTouchUpInside];
        [self.tableView addSubview:_deleteButton];
        
    }
    return self;
}

- (void)setEnabled:(BOOL)enabled {
    if (!enabled) {
       [_tableView removeObserver:self forKeyPath:@"contentOffset"];
       return;
    }
    _enabled = enabled;
    _longPressGestureRecognizer.enabled = enabled;
    _tapGestureRecognizer.enabled =  enabled;
    _deleteButton.enabled = enabled;
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (![(id<UITableViewDataSource_LongPreeable>)self.tableView.delegate conformsToProtocol:@protocol(UITableViewDataSource_LongPreeable)]) {
        return;
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan && !_editingIndexPath) {
        UIView * view = gestureRecognizer.view;
        //    CGPoint location = [gestureRecognizer locationInView:self.view];
        if(![view isKindOfClass:[UITableView class]]) {
            return;
        }
        CGPoint point = [gestureRecognizer locationInView:view];
        
        NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:point];
        UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPath];
        if (cell) {
            _editingIndexPath = indexPath;
            [self setEditing:YES atIndexPath:indexPath cell:cell];
        }
    }
}

- (void)deleteItem:(id)sender {
    UIButton * deleteButton = (UIButton *)sender;
    NSIndexPath * indexPath = deleteButton.indexPath;
    
    [self.tableView.dataSource tableView:self.tableView commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:indexPath];
    _editingIndexPath = nil;
    [UIView animateWithDuration:0.2f animations:^{
        CGRect frame = _deleteButton.frame;
        _deleteButton.frame = (CGRect){frame.origin, frame.size.width, 0};
    } completion:^(BOOL finished) {
        CGRect frame = _deleteButton.frame;
        _deleteButton.frame = (CGRect){_tableView.frame.size.width, frame.origin.y, frame.size.width, kDeleteButtonHeight};
    }];
    [self.tableView removeGestureRecognizer:_tapGestureRecognizer];
}

- (void)tapped:(UIGestureRecognizer *)gestureRecognizer {
    if(_editingIndexPath) {
        UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:_editingIndexPath];
        [self setEditing:NO atIndexPath:_editingIndexPath cell:cell];
    }
}

- (void)setEditing:(BOOL)editing atIndexPath:indexPath cell:(UITableViewCell *)cell {
    if(editing) {
        if(_editingIndexPath) {
            UITableViewCell * editingCell = [self.tableView cellForRowAtIndexPath:_editingIndexPath];
            [self setEditing:NO atIndexPath:_editingIndexPath cell:editingCell];
        }
        [self.tableView addGestureRecognizer:_tapGestureRecognizer];
    } else {
        [self.tableView removeGestureRecognizer:_tapGestureRecognizer];
    }
    
    CGRect frame = cell.frame;
    CGFloat cellXOffset;
    CGFloat deleteButtonXOffsetOld;
    CGFloat deleteButtonXOffset;
    
    if(editing) {
        cellXOffset = -kDeleteButtonWidth;
        deleteButtonXOffset = _tableView.frame.size.width - kDeleteButtonWidth;
        deleteButtonXOffsetOld = _tableView.frame.size.width;
        _editingIndexPath = indexPath;
    } else {
        cellXOffset = 0;
        deleteButtonXOffset = _tableView.frame.size.width;
        deleteButtonXOffsetOld = _tableView.frame.size.width - kDeleteButtonWidth;
        _editingIndexPath = nil;
    }
    
    CGFloat cellHeight = [self.tableView.delegate tableView:self.tableView heightForRowAtIndexPath:indexPath];
    float spaceH = 0;
    _deleteButton.frame = (CGRect) {deleteButtonXOffsetOld, frame.origin.y+spaceH, _deleteButton.frame.size.width, cellHeight-spaceH};
    _deleteButton.indexPath = indexPath;
    
    [UIView animateWithDuration:0.2f animations:^{
        cell.frame = CGRectMake(cellXOffset, frame.origin.y, frame.size.width, frame.size.height);
        _deleteButton.frame = (CGRect) {deleteButtonXOffset, frame.origin.y+spaceH, _deleteButton.frame.size.width, cellHeight-spaceH};
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"------------");
    if (context == &kObservingTableViewLayoutContext) {
        if(_editingIndexPath) {
            [self tapped:nil];
        }
    }
}
@end
