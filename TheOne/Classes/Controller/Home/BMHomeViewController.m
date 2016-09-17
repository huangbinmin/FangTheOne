//
//  BMHomeViewController.m
//  TheOne
//
//  Created by 黄斌民 on 16/7/28.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMHomeViewController.h"
#import "iCarousel.h"
#import "BMContentView.h"
#import "BMHomeBottomView.h"
#import "Masonry.h"
#import "BMHTTPAPIManager.h"
#import "BMConst.h"
#import "MJExtension.h"
#import "BMHomeItem.h"
#import "UIImageView+WebCache.h"
#import "BMPopMenu.h"
#import "BMPastViewController.h"

@interface BMHomeViewController () <iCarouselDataSource, iCarouselDelegate, BMHTTPAPIManagerDelegate>

@property (strong, nonatomic) BMHomeBottomView *bottomView;
@property (strong, nonatomic) iCarousel *carousel;

@property (strong, nonatomic) BMHTTPAPIManager *apiManager;
@property (strong, nonatomic) NSMutableArray<BMHomeItem *> *items;

@end

@implementation BMHomeViewController

#pragma mark - 初始化

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_home_title"]];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.carousel];
    
    [self pageLayout];
    
    [self.apiManager loadDataWithParams:nil];
}

- (void)pageLayout
{
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view).with.offset(-74);
        make.height.mas_equalTo(@44);
    }];
}


#pragma mark - 事件响应

- (void)shareClick:(UIButton *)sender
{
    BMLogFunc
    BMPopMenu *popMenu = [[BMPopMenu alloc] init];
    [popMenu showMenu];
}


#pragma mark - iCarouselDataSource

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.items.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    BMHomeItem *item = self.items[index];
    
    BMContentView *contentView = (BMContentView *)view;
    
    if (contentView == nil)
    {
        contentView = [BMContentView loadFromNib];
        [contentView hiddenImageOfBottomView];
    }

    [contentView.pictureView sd_setImageWithURL:[NSURL URLWithString:item.hp_img_url]];
    contentView.volLabel.text = item.hp_title;
    contentView.authorLabel.text = item.hp_author;
    contentView.dateLabel.text = item.getDateString;
    contentView.contentField.attributedText = item.getAttrContent;
    
    CGSize textMaxSize = CGSizeMake(contentView.contentField.frame.size.width, MAXFLOAT);
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin;
    CGFloat height = [item.getAttrContent boundingRectWithSize:textMaxSize options:options context:nil].size.height;
    contentView.contentFieldH.constant = ceilf(height) + 50;
    
    [contentView buttonOfType:kButtonTypeShare addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return contentView;
}

#pragma mark - iCarouselDelegate

- (void)carouselDidEndDecelerating:(iCarousel *)carousel
{
    [self updateLikeNum];
}

- (void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate
{
    if (carousel.scrollOffset <= -0.2)
    {
        [self.apiManager loadDataWithParams:nil];
    }
    else if (carousel.scrollOffset >= self.items.count - 1 + 0.2)
    {
        [self.navigationController pushViewController:[[BMPastViewController alloc] init] animated:YES];
    }
}

#pragma mark - 请求回调

- (void)successedWithResponseObject:(id)responseObject
{
    self.items = [BMHomeItem mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
    [self.carousel reloadData];
    
    [self updateLikeNum];
}

- (void)failedWithError:(NSError *)error
{
    
}

#pragma mark - 私有方法

- (void)updateLikeNum
{
    self.bottomView.likeNumLabel.text = @(self.items[self.carousel.currentItemIndex].praisenum).stringValue;
}

#pragma mark - 懒加载

- (iCarousel *)carousel
{
    if (!_carousel)
    {
        _carousel = [[iCarousel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _carousel.delegate = self;
        _carousel.dataSource = self;
        _carousel.pagingEnabled = YES;
        _carousel.bounceDistance = 0.4;
    }
    return _carousel;
}

- (BMHomeBottomView *)bottomView
{
    if (!_bottomView)
    {
        _bottomView = [BMHomeBottomView loadFromNib];
    }
    return _bottomView;
}

- (BMHTTPAPIManager *)apiManager
{
    if (!_apiManager)
    {
        _apiManager = [[BMHTTPAPIManager alloc] init];
        _apiManager.APIName = kAPIHomeMore;
        _apiManager.delegate = self;
    }
    return _apiManager;
}

- (NSMutableArray<BMHomeItem *> *)items
{
    if (!_items)
    {
        _items = [NSMutableArray array];
    }
    return _items;
}



@end
