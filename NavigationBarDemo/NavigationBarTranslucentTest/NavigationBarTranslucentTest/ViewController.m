//
//  ViewController.m
//  NavigationBarTranslucentTest
//
//  Created by 张晨晖 on 2018/5/27.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "ViewController.h"
#import "NavNoneViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"Page One";
    [self setNavVisible];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self setNavHidden];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
}

- (IBAction)pushButtonClick:(UIButton *)sender {
    NavNoneViewController *vc = [[NavNoneViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

//显示
- (void)setNavVisible {
    self.navigationController.navigationBar.backgroundColor = nil;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    //    [self.navigationController.navigationBar setTintColor:nil];
    //    self.navigationController.navigationBar.translucent = NO;
}

//透明
- (void)setNavHidden {
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    //    self.navigationController.navigationBar.translucent = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
