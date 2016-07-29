//
//  BMBaseViewController.m
//  TheOne
//
//  Created by 黄斌民 on 16/7/28.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMBaseViewController.h"

@interface BMBaseViewController ()

@end

@implementation BMBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_me_normal"] style:0 target:self action:@selector(meClick)];
}

#pragma mark - 事件响应

- (void)searchClick
{
    
}

- (void)meClick
{
    
}


@end
