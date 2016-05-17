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
//    mainItem.selectedImage = [UIImage imageNamed:@"春.jpg"];
    mainItem.image = [UIImage imageNamed:@"shouyehui"];
    mainItem.selectedImage = [UIImage imageNamed:@"shouyelan"];
    
    UITabBarItem * myCenterItem = self.tabBar.items[1];
    myCenterItem.title = @"个人中心";
    myCenterItem.image = [UIImage imageNamed:@"gerenzhongxinhui"];
    myCenterItem.selectedImage = [UIImage imageNamed:@"gerenzhongxinlan"];
    
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
