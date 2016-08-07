//
//  XNMenuTableViewCell.m
//  XNTalk
//
//  Created by Jiabao on 16/7/25.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNMenuTableViewCell.h"

@interface XNMenuTableViewCell () {
    XNRowModel *_model;
}

@end

@implementation XNMenuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (nil != self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (nil != self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupUI];
}

#pragma mark - 初始化UI
- (void)setupUI {
    [self.textLabel removeFromSuperview];
}

- (XNRowModel *)model {
    return _model;
}

- (void)setModel:(XNRowModel *)model {
    _model = model;
}

@end
