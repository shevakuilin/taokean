//
//  RootViewController.h
//  Taokean
//
//  Created by shevchenko on 15/10/27.
//  Copyright © 2015年 shevchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

