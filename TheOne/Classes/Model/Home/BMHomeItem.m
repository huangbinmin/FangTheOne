//
//  BMHomeItem.m
//  TheOne
//
//  Created by 黄斌民 on 16/7/31.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMHomeItem.h"

@implementation BMHomeItem


- (NSString *)getDateString
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *date = [fmt dateFromString:_hp_makettime];
    
    fmt.dateFormat = @"dd MMM,yyyy. EEE.";
    
    return [fmt stringFromDate:date];
}

- (NSAttributedString *)getAttrContent
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;
    NSDictionary *attrs = @{
                            NSFontAttributeName:[UIFont systemFontOfSize:14],
                            NSForegroundColorAttributeName:[UIColor colorWithWhite:90 / 255.0 alpha:1],
                            NSParagraphStyleAttributeName:paragraphStyle
                            };
    return [[NSAttributedString alloc] initWithString:_hp_content attributes:attrs];
}

@end
