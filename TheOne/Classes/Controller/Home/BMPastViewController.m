//
//  BMPastViewController.m
//  TheOne
//
//  Created by 黄斌民 on 16/7/31.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMPastViewController.h"
#import "BMHomeByMonthViewController.h"

@interface BMPastViewController ()

@property (strong, nonatomic) NSMutableArray *datas;
@property (copy, nonatomic)   NSString *currentDate;

@end

@implementation BMPastViewController

#pragma mark - 初始化

- (instancetype)init
{
    return [self initWithStyle:UITableViewStylePlain];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"往期列表";
    
    self.datas = [NSMutableArray array];
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:date];
    NSInteger currentYear = components.year;
    NSInteger currentMonth = components.month;
    
    self.currentDate = [NSString stringWithFormat:@"%ld-%02ld", currentYear, currentMonth];
    
    NSInteger earlyYear = currentYear - 2;
    NSInteger earlyMonth = currentMonth;
    
    for (NSInteger startYear = earlyYear; startYear <= currentYear; startYear++)
    {
        for (NSInteger startMonth = earlyMonth; startMonth <= 12; startMonth++)
        {
            if (startYear == currentYear && startMonth == currentMonth)
            {
                [self.datas insertObject:@"本月" atIndex:0];
                break;
            }
            [self.datas insertObject:[NSString stringWithFormat:@"%ld-%02ld", startYear, startMonth] atIndex:0];
        }
        earlyMonth = 1;
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIndicator = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndicator];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndicator];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = self.datas[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewControllerDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BMHomeByMonthViewController *vc = [[BMHomeByMonthViewController alloc] init];
    if (indexPath.row == 0)
    {
        vc.date = self.currentDate;
    }
    else
    {
        vc.date = self.datas[indexPath.row];
    }
    [self.navigationController pushViewController:vc animated:YES];
}




@end
