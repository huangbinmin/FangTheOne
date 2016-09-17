//
//  BMHomeBottomView.m
//  TheOne
//
//  Created by 黄斌民 on 16/7/30.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMHomeBottomView.h"

@implementation BMHomeBottomView

+ (instancetype)loadFromNib
{
    return [[NSBundle mainBundle] loadNibNamed:@"BMHomeBottomView" owner:nil options:nil].firstObject;
}

@end
