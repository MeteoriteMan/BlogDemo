//
//  TableViewSectionHeaderView.m
//  getCurrentSuspendTableViewSectionHeaderViewDemo
//
//  Created by 张晨晖 on 2018/4/25.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "TableViewSectionHeaderView.h"
#import <Masonry.h>

@interface TableViewSectionHeaderView ()

@property (nonatomic ,strong) UILabel *label;

@end

@implementation TableViewSectionHeaderView

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    self.label.text = titleStr;
}

- (void)setupUI {
    self.label = [UILabel new];
    [self.contentView addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
    }];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
