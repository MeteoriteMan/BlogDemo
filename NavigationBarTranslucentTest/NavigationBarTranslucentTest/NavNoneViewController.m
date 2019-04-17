//
//  NavNoneViewController.m
//  NavigationBarTranslucentTest
//
//  Created by 张晨晖 on 2018/5/27.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "NavNoneViewController.h"
#import "NavAlphaViewController.h"

@interface NavNoneViewController ()

@end

@implementation NavNoneViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavHidden];
    self.title = @"Page Two";
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self setNavVisible];
}

//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    [self setNavVisible];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    UIButton *pushButton = [[UIButton alloc] init];
    [pushButton setTitle:@"push" forState:UIControlStateNormal];
    [self.view addSubview:pushButton];


    pushButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:pushButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:pushButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]]
     ];
    [pushButton addTarget:self action:@selector(pushButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pushButtonAction {
    NavAlphaViewController *vc = [[NavAlphaViewController alloc] init];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
