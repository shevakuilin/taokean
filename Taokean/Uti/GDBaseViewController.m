//
//  GDBaseViewController.m
//  GyhDoctor
//
//  Created by zdsoft on 16/2/16.
//  Copyright © 2016年 hrjkgs. All rights reserved.
//

#import "GDBaseViewController.h"
#import "constant.h"

@interface GDBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation GDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [MyUtil barButtonItemWithTitle:@"返回" target:self action:@selector(popBack)];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)popBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
