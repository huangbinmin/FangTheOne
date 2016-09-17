//
//  BMPopMenu.m
//  TheOne
//
//  Created by 黄斌民 on 16/7/31.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMPopMenu.h"

@implementation BMPopMenu

- (instancetype)init
{
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:6];
    MenuItem *item1 = [[MenuItem alloc] initWithTitle:@"微信好友" iconName:@"more_wechat" glowColor:BMColor(102, 224, 141) index:0];
    MenuItem *item2 = [[MenuItem alloc] initWithTitle:@"朋友圈" iconName:@"more_moments" glowColor:BMColor(102, 224, 141) index:1];
    MenuItem *item3 = [[MenuItem alloc] initWithTitle:@"微博" iconName:@"more_sina" glowColor:BMColor(255, 132, 103) index:2];
    MenuItem *item4 = [[MenuItem alloc] initWithTitle:@"QQ" iconName:@"more_qq" glowColor:BMColor(73, 175, 214) index:3];
    MenuItem *item5 = [[MenuItem alloc] initWithTitle:@"复制链接" iconName:@"more_link" glowColor:BMColor(101, 154, 217) index:4];
    MenuItem *item6 = [[MenuItem alloc] initWithTitle:@"收藏" iconName:@"more_collection" glowColor:BMColor(246, 204, 65) index:5];
    [items addObjectsFromArray:@[item1, item2, item3, item4, item5, item6]];
    
    return [self initWithFrame:[UIScreen mainScreen].bounds items:items];
}

- (void)showMenu
{
    self.menuAnimationType = kPopMenuAnimationTypeSina;
    self.perRowItemCount = 3;
    [self showMenuAtView:[UIApplication sharedApplication].keyWindow];
}

@end
