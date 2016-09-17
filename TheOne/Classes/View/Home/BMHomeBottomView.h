//
//  BMHomeBottomView.h
//  TheOne
//
//  Created by 黄斌民 on 16/7/30.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMHomeBottomView : UIView

@property (weak, nonatomic) IBOutlet UIButton *diaryButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UILabel *likeNumLabel;

+ (instancetype)loadFromNib;

@end
