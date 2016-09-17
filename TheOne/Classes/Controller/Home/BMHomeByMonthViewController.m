//
//  BMHomeByMonthViewController.m
//  TheOne
//
//  Created by 黄斌民 on 16/8/1.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMHomeByMonthViewController.h"
#import "BMHTTPAPIManager.h"
#import "BMHomeItem.h"
#import "MJExtension.h"
#import "BMHomeItemCell.h"
#import "UIImageView+WebCache.h"
#import "DDCollectionViewFlowLayout.h"

@interface BMHomeByMonthViewController () <DDCollectionViewDelegateFlowLayout, BMHTTPAPIManagerDelegate>

@property (strong, nonatomic) BMHTTPAPIManager *apiManager;
@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation BMHomeByMonthViewController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - 初始化

- (instancetype)init
{
    DDCollectionViewFlowLayout *layout = [[DDCollectionViewFlowLayout alloc] init];
    layout.delegate = self;
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    
    self.navigationItem.title = self.date;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"BMHomeItemCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.apiManager loadDataWithParams:nil];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BMHomeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    BMHomeItem *item = self.items[indexPath.item];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:item.hp_img_url]];
    cell.volLabel.text = item.hp_title;
    cell.contentTextView.text = item.hp_content;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

#pragma mark - DDCollectionViewDelegateFlowLayout

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(DDCollectionViewFlowLayout *)layout numberOfColumnsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(8, 8, 8, 8);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (self.view.frame.size.width - 31) / 2;
    
    BMHomeItem *item = self.items[indexPath.item];
    
    /* 计算文本高度 */
    CGSize maxTextSize = CGSizeMake(width, MAXFLOAT);
    CGFloat height = [item.hp_content boundingRectWithSize:maxTextSize options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil].size.height + 30;
    
    return CGSizeMake(width, width * 0.75 + height);
}

#pragma mark - BMHTTPAPIManagerDelegate

- (void)successedWithResponseObject:(id)responseObject
{
    self.items = [BMHomeItem mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
    [self.collectionView reloadData];
}

- (void)failedWithError:(NSError *)error
{
    
}

#pragma mark - 懒加载

- (BMHTTPAPIManager *)apiManager
{
    if (!_apiManager)
    {
        _apiManager = [[BMHTTPAPIManager alloc] init];
        _apiManager.delegate = self;
        _apiManager.APIName = [@"/hp/bymonth" stringByAppendingPathComponent:self.date];
    }
    return _apiManager;
}

- (NSMutableArray *)items
{
    if (!_items)
    {
        _items = [NSMutableArray array];
    }
    return _items;
}

@end
