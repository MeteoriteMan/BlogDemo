//
//  ViewController.m
//  3D-TouchTest
//
//  Created by 张晨晖 on 2018/1/13.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerDetail.h"

@interface ViewController () <UIViewControllerPreviewingDelegate>
//,ViewControllerDetailDelegate>

@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ViewController

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#pragma mark 1.register
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
}

#pragma mark 3D-TouchDelegate
//peek状态
//- (UIViewController *)previewingContext:(id)previewingContext viewControllerForLocation:(CGPoint)location {}
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
//    previewingContext.sourceRect = self.view.frame;
    //peek从哪里出来.比如用的是cell就是从cell上抛出来
    previewingContext.sourceRect = self.button.frame;
    ViewControllerDetail *VCDetail = [[ViewControllerDetail alloc] init];
//    VCDetail.delegate = self;
    return VCDetail;
}

//- (void)chooseYesBtn {
//
//}

//pop状态.点击进入的状态
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
