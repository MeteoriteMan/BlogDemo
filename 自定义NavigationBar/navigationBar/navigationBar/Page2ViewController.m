//
//  Page2ViewController.m
//  navigationBar
//
//  Created by 张晨晖 on 2018/5/12.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "Page2ViewController.h"
#import "CHNavigationBar.h"

@interface Page2ViewController ()

@property (weak, nonatomic) IBOutlet CHNavigationBar *navigationBar;

@end

@implementation Page2ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //隐藏NavigaitonController自带的navigatonBar
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationBar.title = @"第二页Title";
    self.navigationBar.navigationBarBackButtonClickBlock = ^(UIButton *button) {
        //点击按钮的操作
        [self.navigationController popViewControllerAnimated:YES];
    };
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
