# LongPressTableDemo

## 简介
长按删除tableviewCell,仿写安卓的长按删除,适用于一些页面,滑动事件被占用的情况,还的去做滑动删除;

## 集成方法
方法1.使用pod,在Podfile里面增加

```
pod 'LongPressTable'
```
方法2.加入demo中的`LongPressTable`文件夹

```
#import "UITableView+LongPressTable.h"
#import "UITableViewDataSource_LongPreeable.h"
```
方法3.使用Cartfile,在Cartfile里面增加

```
github "sukeyang/LongPressTableDemo" 
```

## 使用方法
添加代码

```
tableView.longPressTableAble = YES;
```

实现协议`UITableViewDataSource_LongPreeable`为了保证cel高度不一样情况下正常运作

```
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
```


