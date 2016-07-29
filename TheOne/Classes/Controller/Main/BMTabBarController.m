//
//  BMTabBarController.m
//  TheOne
//
//  Created by 黄斌民 on 16/7/28.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMTabBarController.h"
#import "BMNavigationController.h"
#import "BMHomeViewController.h"
#import "BMReadViewController.h"
#import "BMMusicViewController.h"
#import "BMMovieViewController.h"

@interface BMTabBarController ()

@end

@implementation BMTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupAllChildViewController];
}

- (void)setupAllChildViewController
{
    BMHomeViewController *home = [[BMHomeViewController alloc] init];
    [self setupOneChildViewController:home image:@"tab_home_normal" selectedImage:@"tab_home_selected" title:@"首页"];
    
    BMReadViewController *read = [[BMReadViewController alloc] init];
    [self setupOneChildViewController:read image:@"tab_read_normal" selectedImage:@"tab_read_selected" title:@"阅读"];
    
    BMMusicViewController *music = [[BMMusicViewController alloc] init];
    [self setupOneChildViewController:music image:@"tab_music_normal" selectedImage:@"tab_music_selected" title:@"音乐"];
    
    BMMovieViewController *movie = [[BMMovieViewController alloc] init];
    [self setupOneChildViewController:movie image:@"tab_movie_normal" selectedImage:@"tab_movie_selected" title:@"电影"];
}

- (void)setupOneChildViewController:(UIViewController *)vc image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    BMNavigationController *nav = [[BMNavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.image = [UIImage imageNamed:image];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    nav.tabBarItem.title = title;
    [self addChildViewController:nav];
}


@end
