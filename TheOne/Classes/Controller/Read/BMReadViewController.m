//
//  BMReadViewController.m
//  TheOne
//
//  Created by 黄斌民 on 16/7/28.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMReadViewController.h"
#import "SDCycleScrollView.h"
#import "BMReadCarouselItem.h"
#import "MJExtension.h"
#import "Masonry.h"

@interface BMReadViewController () <SDCycleScrollViewDelegate>

@property (strong, nonatomic) NSMutableArray *carouselImages;

@property (strong, nonatomic) SDCycleScrollView *cycleScrollView;

@end

@implementation BMReadViewController

# pragma mark - 初始化

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"阅读";
    
    [self.view addSubview:self.cycleScrollView];
    
    [self layoutPageSubViews];
}

- (void)layoutPageSubViews
{
    [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(64);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(@143.5);
    }];
}



#pragma mark - 懒加载

- (NSMutableArray *)carouselImages
{
    if (!_carouselImages)
    {
        _carouselImages = [NSMutableArray array];
    }
    return _carouselImages;
}

- (SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView)
    {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:nil];
    }
    return _cycleScrollView;
}



@end
