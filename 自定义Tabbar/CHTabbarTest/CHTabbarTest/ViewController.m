//
//  ViewController.m
//  CHTabbarTest
//
//  Created by 张晨晖 on 2018/5/11.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "ViewController.h"
#import "CHTabbar.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelMid;

@property (weak, nonatomic) IBOutlet CHTabbar *tabbar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    __weak typeof(self) weakSelf = self;
    self.tabbar.tabbarButtonClickBlock = ^(CHTabbarButtonType type) {
        switch (type) {
            case CHTabbarButtonTypeLeft:
                weakSelf.labelMid.text = @"左边按钮点击";
                break;
            case CHTabbarButtonTypeMid:
                weakSelf.labelMid.text = @"中间按钮点击";
                break;
            case CHTabbarButtonTypeRight:
                weakSelf.labelMid.text = @"右边按钮点击";
                break;
            default:
                break;
        }
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
