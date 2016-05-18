//
//  KeanTabBarViewController.m
//  Taokean
//
//  Created by shevchenko on 15/10/28.
//  Copyright © 2015年 shevchenko. All rights reserved.
//

#import "KeanTabBarViewController.h"
#import "constant.h"
@interface KeanTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation KeanTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationController * mainNavigationController = [WPUtil getViewControllerWithIdentifier:@"mainNavigation" storyboardName:@"Main"];
    
    UINavigationController * myCenterNavigationController = [WPUtil getViewControllerWithIdentifier:@"myCenter" storyboardName:@"MyCenter"];
    
    self.viewControllers = @[mainNavigationController,myCenterNavigationController];
    
    //底部tabBarItem
    UITabBarItem * mainItem = self.tabBar.items[0];
    mainItem.title = @"首页";
    mainItem.image = [[UIImage imageNamed:@"clover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mainItem.selectedImage = [[UIImage imageNamed:@"clover-s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem * saveItem = self.tabBar.items[1];
    saveItem.title = @"开销";
    saveItem.image = [[UIImage imageNamed:@"mapleleaf"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    saveItem.selectedImage = [[UIImage imageNamed:@"mapleleaf-s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//    UITabBarItem * addItem = self.tabBar.items[2];
//    addItem.title = @"记点什么";
//    addItem.image = [[UIImage imageNamed:@"record"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    addItem.selectedImage = [[UIImage imageNamed:@"record-s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    UITabBarItem * grassItem = self.tabBar.items[3];
//    grassItem.title = @"种草";
//    grassItem.image = [[UIImage imageNamed:@"grass"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    grassItem.selectedImage = [[UIImage imageNamed:@"grass-s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    UITabBarItem * myCenterItem = self.tabBar.items[4];
//    myCenterItem.title = @"个人中心";
//    myCenterItem.image = [[UIImage imageNamed:@"me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    myCenterItem.selectedImage = [[UIImage imageNamed:@"me-s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
