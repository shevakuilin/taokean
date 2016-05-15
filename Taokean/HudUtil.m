//
//  HudUtil.m
//  WebViewDemo
//
//  Created by teebag on 15/5/27.
//  Copyright (c) 2015年 zdsoft. All rights reserved.
//

#import "HudUtil.h"
#import "MBProgressHUD.h"

@implementation HudUtil

+ (void)showHudWithText:(NSString *)text inView:(UIView *)view
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = text;
    hud.dimBackground = YES;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

@end
