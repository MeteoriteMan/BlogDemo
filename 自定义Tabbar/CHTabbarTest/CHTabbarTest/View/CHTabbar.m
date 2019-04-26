//
//  CHBabyTabbar.m
//  CHTabbarTest
//
//  Created by 张晨晖 on 2018/5/11.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "CHTabbar.h"
#import <Masonry.h>

@interface CHTabbar ()

@property (nonatomic ,strong) NSArray <UIButton *> *buttonArray;

@end

@implementation CHTabbar

#define buttonHeight 36
#define buttonWidth 103

- (void)setupUI {
    //去除tabbar上部的线
    self.shadowImage = [UIImage new];
    self.backgroundImage = [UIImage new];
    UIButton *buttonMid = [UIButton new];
    [buttonMid setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [self addSubview:buttonMid];
    [buttonMid mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self.mas_top);
    }];
    UIButton *buttonLeft = [self creatButtonWithTitle:@"左边按钮"];
    [self addSubview:buttonLeft];
    [buttonLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(buttonMid.mas_left).offset(-43);
        make.centerY.equalTo(buttonMid);
        make.height.offset(buttonHeight);
        make.width.offset(buttonWidth);
    }];
    UIButton *buttonRight = [self creatButtonWithTitle:@"右边按钮"];
    [self addSubview:buttonRight];
    [buttonRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonMid.mas_right).offset(43);
        make.centerY.equalTo(buttonMid);
        make.height.offset(buttonHeight);
        make.width.offset(buttonWidth);
    }];
    buttonLeft.tag = CHTabbarButtonTypeLeft;
    buttonMid.tag = CHTabbarButtonTypeMid;
    buttonRight.tag = CHTabbarButtonTypeRight;
    [buttonLeft addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonMid addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonRight addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonArray = @[buttonLeft ,buttonMid ,buttonRight];
}

- (void)buttonClick:(UIButton *)sender {
    if (self.tabbarButtonClickBlock) {
        self.tabbarButtonClickBlock(sender.tag);
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

//解决超过btn范围没有点击效果的bug
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.isHidden == NO) {
        for (UIButton *button in self.buttonArray) {
            CGPoint newA = [self convertPoint:point toView:button];
            if ([button pointInside:newA withEvent:event]) {
                return button;
            }
        }
    } else {
        return [super hitTest:point withEvent:event];
    }
    return [super hitTest:point withEvent:event];
}

- (BOOL)touchPointInsideCircle:(CGPoint)center radius:(CGFloat)radius targetPoint:(CGPoint)point {
    CGFloat dist = sqrtf((point.x - center.x) * (point.x - center.x) + (point.y - center.y) * (point.y - center.y));
    return (dist <= radius);
}

- (UIButton *)creatButtonWithTitle:(NSString *)title {
    UIButton *button = [UIButton new];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = buttonHeight / 2;
    button.backgroundColor = [UIColor whiteColor];
    button.layer.shadowOffset = CGSizeMake(1, 1);
    button.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    button.layer.shadowOpacity = .8;
    return button;
}

@end
