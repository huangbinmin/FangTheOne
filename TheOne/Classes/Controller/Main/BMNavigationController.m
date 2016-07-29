//
//  BMNavigationController.m
//  TheOne
//
//  Created by 黄斌民 on 16/7/28.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMNavigationController.h"

@interface BMNavigationController ()

@end

@implementation BMNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationBar.tintColor = [UIColor lightGrayColor];
    
    NSDictionary *attrs = @{
                            NSForegroundColorAttributeName : BMColor(78, 92, 108)
                            };
    self.navigationBar.titleTextAttributes = attrs;
}

@end
