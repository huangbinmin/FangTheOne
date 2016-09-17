//
//  BMHomeMainView.h
//  TheOne
//
//  Created by 黄斌民 on 16/7/29.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BMHomeBottomView;

typedef NS_ENUM(NSInteger, kButtonType) {
    kButtonTypeDiary = 0,
    kButtonTypeLike   = 1,
    kButtonTypeShare  = 2,
};

@interface BMContentView : UIView



@property (weak, nonatomic) IBOutlet UILabel *volLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *temLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weathView;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentFieldH;

@property (strong, nonatomic) BMHomeBottomView *bottomView;

+ (instancetype)loadFromNib;

- (void)hiddenImageOfBottomView;

- (void)buttonOfType:(kButtonType)type addTarget:(nullable id)target action:(nullable SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
