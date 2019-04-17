//
//  CHNavigationBar.m
//  navigationBar
//
//  Created by 张晨晖 on 2018/5/12.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "CHNavigationBar.h"
#import <Masonry.h>

@interface CHNavigationBar ()

/// 自定义背景图片(可以超出背景)
@property (nonatomic ,strong) UIImageView *imageView;

/// title
@property (nonatomic ,strong) UILabel *labelTitle;

/// Nav返回按钮
@property (nonatomic ,strong) UIButton *navBackButton;

@end

@implementation CHNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setTitle:(NSString *)title {
    _title = title;
    self.labelTitle.text = title;
}

- (void)setNavBackButtonImage:(UIImage *)navBackButtonImage {
    _navBackButtonImage = navBackButtonImage;
    [self.navBackButton setImage:navBackButtonImage forState:UIControlStateNormal];
}

- (void)setNavigationBarBackButtonClickBlock:(CHNavigationBarBackButtonClickBlock)navigationBarBackButtonClickBlock {
    _navigationBarBackButtonClickBlock = navigationBarBackButtonClickBlock;
    self.navBackButton.hidden = NO;
}

- (UIButton *)navBackButton {
    if (_navBackButton == nil) {
        self.navBackButton = [UIButton new];
        [self.navBackButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
        [self.navBackButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navBackButton.hidden = YES;
    }
    return _navBackButton;
}

- (UILabel *)labelTitle {
    if (_labelTitle == nil) {
        _labelTitle = [UILabel new];
    }
    return _labelTitle;
}

- (void)setupUI {
    //颜色
    self.shadowImage = [UIImage new];
    self.barStyle = UIBarStyleDefault;
    [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //穿透
    self.translucent = NO;

    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = [UIImage imageNamed:@"Img"];
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        // iPhoneX电池蓝高度44.
        make.top.offset(-44);
    }];

    [self addSubview:self.navBackButton];
    [self.navBackButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.centerY.equalTo(self);
    }];

    [self addSubview:self.labelTitle];
    [self.labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
    }];
}

- (void)backButtonClick:(UIButton *)sender {
    if (self.navigationBarBackButtonClickBlock) {
        self.navigationBarBackButtonClickBlock(sender);
    }
}

//  Nib创建
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupUI];
    }
    return self;
}

// 代码创建
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

@end
