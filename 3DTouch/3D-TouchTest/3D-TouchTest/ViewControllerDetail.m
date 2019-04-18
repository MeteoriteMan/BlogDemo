//
//  ViewControllerDetail.m
//  3D-TouchTest
//
//  Created by 张晨晖 on 2018/1/13.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "ViewControllerDetail.h"

@interface ViewControllerDetail ()

@end

@implementation ViewControllerDetail

#pragma mark 3DTouch
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    //
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"进入" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
//        if ([self.delegate respondsToSelector:@selector(chooseYesBtn)]) {
//            [self.delegate chooseYesBtn];
//        }
    }];
    //
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {

    }];

    NSArray *actions = @[action1,action2];

    return actions;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
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
