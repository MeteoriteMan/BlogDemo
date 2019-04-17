//
//  ViewController.m
//  getCurrentSuspendTableViewSectionHeaderViewDemo
//
//  Created by 张晨晖 on 2018/4/25.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "TableViewSectionHeaderView.h"
#import "TableViewCell.h"

@interface ViewController () <UITableViewDataSource ,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController {
    // MARK: 当前顶部悬停Section的section
    long _currentTopSectionViewCount;
}

// MARK: cell的id和headerFooterView的ID
static NSString *cellID = @"cellID";
static NSString *tableHeaderViewID = @"tableHeaderViewID";

// MARK: 宏定义颜色
#define normalColor [UIColor whiteColor]
#define highlightColor [UIColor redColor]

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    // MARK:初始化当前悬停顶部的section为第0个
    _currentTopSectionViewCount = 0;
    // MARK: 注册控件
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[TableViewSectionHeaderView class] forHeaderFooterViewReuseIdentifier:tableHeaderViewID];
}

// MARK: DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arc4random_uniform(10) + 1;
}

// MARK: Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tableView) {
        ///记录当前组数
        NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
        NSArray <TableViewCell *> *cellArray = [self.tableView  visibleCells];
        //cell的section的最小值
        long cellSectionMINCount = LONG_MAX;
        for (int i = 0; i < cellArray.count; i++) {
            TableViewCell *cell = cellArray[i];
            long cellSection = [self.tableView indexPathForCell:cell].section;
            [dicM setValue:@(cellSection) forKey:[NSString stringWithFormat:@"%ld",cellSection]];
            if (cellSection < cellSectionMINCount) {
                cellSectionMINCount = cellSection;
            }
        }

        _currentTopSectionViewCount = cellSectionMINCount;
        NSLog(@"当前悬停的组头是:%ld",_currentTopSectionViewCount);

        // MARK: 进行section的颜色设置
        NSDictionary *dic = dicM.copy;
        NSArray *allKeys = dic.allKeys;
        for (int i = 0; i < allKeys.count; i++) {
            NSString *sectionCountStr = [dicM objectForKey:allKeys[i]];
            NSInteger sectionCount = [sectionCountStr integerValue];
            TableViewSectionHeaderView *sectionView = (TableViewSectionHeaderView *)[self.tableView headerViewForSection:sectionCount];
            sectionView.contentView.backgroundColor = normalColor;
            if (sectionCount == _currentTopSectionViewCount) {
                sectionView.contentView.backgroundColor = highlightColor;
            } else {
                sectionView.contentView.backgroundColor = normalColor;
            }
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 46;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableViewSectionHeaderView *headerView = (TableViewSectionHeaderView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:tableHeaderViewID];
//    [TableViewSectionHeaderView new];
    headerView.titleStr = [NSString stringWithFormat:@"第%ld组",(long)section];
    //颜色的设置
    headerView.contentView.backgroundColor = normalColor;
    if (section == _currentTopSectionViewCount) {
        headerView.contentView.backgroundColor = highlightColor;
    } else {
        headerView.contentView.backgroundColor = normalColor;
    }
    return headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
