//
//  ViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "MineViewController.h"
#import "FenleiViewController.h"
#import "GouWuViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    FenleiViewController *classVC = [[FenleiViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:classVC];
    
    GouWuViewController *chartVC = [[GouWuViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:chartVC];
    
    MineViewController *personVC = [[MineViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:personVC];
    
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    tabBarVC.viewControllers = @[nav1,nav2,nav3,nav4];
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    window.rootViewController = tabBarVC;
    
    UITabBar *tabbar = tabBarVC.tabBar;
    
    UITabBarItem *item1 = [tabbar.items objectAtIndex:0];
    UITabBarItem *item2 = [tabbar.items objectAtIndex:1];
    UITabBarItem *item3 = [tabbar.items objectAtIndex:2];
    UITabBarItem *item4 = [tabbar.items objectAtIndex:3];
    
    item1.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    item2.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    item3.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    item4.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    
    item1.selectedImage = [[UIImage imageNamed:@"Main-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"Main-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item2.selectedImage = [[UIImage imageNamed:@"Class-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"Class-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item3.selectedImage = [[UIImage imageNamed:@"Chart-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = [[UIImage imageNamed:@"Chart-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item4.selectedImage = [[UIImage imageNamed:@"Person-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item4.image = [[UIImage imageNamed:@"Person-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
