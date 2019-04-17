//
//  NavAlphaViewController.m
//  NavigationBarTranslucentTest
//
//  Created by 张晨晖 on 2018/5/27.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "NavAlphaViewController.h"
#import "NavNoneViewController.h"

@interface NavAlphaViewController ()

@end

@implementation NavAlphaViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"Page Three";
    [self setNavVisible];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self setNavHidden];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
