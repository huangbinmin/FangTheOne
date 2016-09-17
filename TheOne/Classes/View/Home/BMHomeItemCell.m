//
//  BMHomeItemCell.m
//  TheOne
//
//  Created by 黄斌民 on 16/8/1.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMHomeItemCell.h"

@implementation BMHomeItemCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.contentView.layer.cornerRadius = 5;
    self.contentView.layer.masksToBounds = YES;
}

@end
