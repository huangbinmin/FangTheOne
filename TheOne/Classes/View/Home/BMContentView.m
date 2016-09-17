//
//  BMHomeMainView.m
//  TheOne
//
//  Created by 黄斌民 on 16/7/29.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMContentView.h"
#import "BMHomeBottomView.h"
#import "Masonry.h"

@interface BMContentView ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation BMContentView

+ (instancetype)loadFromNib
{
    return [[NSBundle mainBundle] loadNibNamed:@"BMContentView" owner:nil options:nil].firstObject;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.bottomView = [BMHomeBottomView loadFromNib];
    [self addSubview:self.bottomView];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self).with.offset(-74);
        make.height.mas_equalTo(@44);
    }];
    
    self.contentView.layer.cornerRadius = 5;
    self.contentView.layer.shadowOffset = CGSizeZero;
    self.contentView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.contentView.layer.shadowRadius = 2;
    self.contentView.layer.shadowOpacity = 0.8;
}

- (void)hiddenImageOfBottomView
{
    self.bottomView.likeNumLabel.hidden = YES;
    [self.bottomView.shareButton setImage:nil forState:UIControlStateNormal];
    [self.bottomView.likeButton setImage:nil forState:UIControlStateNormal];
    [self.bottomView.diaryButton setImage:nil forState:UIControlStateNormal];
}

- (void)buttonOfType:(kButtonType)type addTarget:(nullable id)target action:(nullable SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    switch (type)
    {
        case kButtonTypeDiary:
            [self.bottomView.diaryButton addTarget:target action:action forControlEvents:controlEvents];
            break;
        case kButtonTypeLike:
            [self.bottomView.likeButton addTarget:target action:action forControlEvents:controlEvents];
            break;
        case kButtonTypeShare:
            [self.bottomView.shareButton addTarget:target action:action forControlEvents:controlEvents];
            break;
    }
}

@end
