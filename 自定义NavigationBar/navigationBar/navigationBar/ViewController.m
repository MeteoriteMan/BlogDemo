//
//  ViewController.m
//  navigationBar
//
//  Created by 张晨晖 on 2018/5/12.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "ViewController.h"
#import "Page2ViewController.h"
#import "CHNavigationBar.h"

@interface ViewController () <UITableViewDataSource ,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet CHNavigationBar *navigationBar;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

static NSString *cellID = @"cellID";

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //隐藏NavigaitonController自带的navigatonBar
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationBar.title = @"首页自定义Title";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //背景色
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Page2ViewController *page2 = [[Page2ViewController alloc] init];
    [self.navigationController pushViewController:page2 animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    //背景色
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arc4random_uniform(20);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
