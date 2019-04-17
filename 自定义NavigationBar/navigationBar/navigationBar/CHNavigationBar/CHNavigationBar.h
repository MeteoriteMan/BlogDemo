//
//  CHNavigationBar.h
//  navigationBar
//
//  Created by 张晨晖 on 2018/5/12.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CHNavigationBarBackButtonClickBlock)(UIButton *button);

@interface CHNavigationBar : UINavigationBar

@property (nonatomic ,strong) CHNavigationBarBackButtonClickBlock navigationBarBackButtonClickBlock;

@property (nonatomic ,assign) BOOL navBackButtonIsShow;

@property (nonatomic ,strong) NSString *title;

@property (nonatomic ,strong) UIImage *navBackButtonImage;

@end
