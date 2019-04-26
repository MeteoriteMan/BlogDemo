//
//  CHBabyTabbar.h
//  CHTabbarTest
//
//  Created by 张晨晖 on 2018/5/11.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CHTabbarButtonType) {
    CHTabbarButtonTypeLeft,
    CHTabbarButtonTypeMid,
    CHTabbarButtonTypeRight,
};

typedef void(^TabbarButtonClickBlock)(CHTabbarButtonType type);

@interface CHTabbar : UITabBar

@property (nonatomic ,copy) TabbarButtonClickBlock tabbarButtonClickBlock;

@end
