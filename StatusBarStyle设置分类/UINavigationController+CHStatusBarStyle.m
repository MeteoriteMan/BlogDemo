//
//  UINavigationController+CHStatusBarStyle.m
//  StatusBarStyleTest
//
//  Created by 张晨晖 on 2018/7/12.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "UINavigationController+CHStatusBarStyle.h"

@implementation UINavigationController (CHStatusBarStyle)

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

@end
