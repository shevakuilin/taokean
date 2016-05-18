//
//  constant.h
//  MicroHospital
//
//  Created by teebag on 14-11-24.
//  Copyright (c) 2014年 teebag. All rights reserved.
//

#ifndef SoulSPA_constant_h
#define SoulSPA_constant_h

#define DEBUG_OUTPUT 1

#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif


#define OS_VERSION [[[UIDevice currentDevice] systemVersion] integerValue]
#define SCREEN_FRAME [[UIScreen mainScreen] bounds]

#ifdef DEBUG_OUTPUT
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#define WPALERT(title,msg) [[[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show]

#import "WPUtil.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "HudUtil.h"

#define WPColor(x, y, z)            [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:1]
#define WPFont(x)                   [UIFont systemFontOfSize:x]
#define WPImage(x)                  [UIImage imageNamed:x]
#define WPNib(x)                    [UINib nibWithNibName:x bundle:nil]

#define STATUS_KEY                  @"status"
#define DATA_KEY                    @"data"
#define CODE_KEY                    @"code"
#define LIST_KEY                    @"list"
#define MESSAGE_KEY                 @"msg"

#define PARAMETER_FIRST_INDEX       @"firstIndex"
#define PARAMETER_LAST_INDEX        @"lastIndex"

/**
 *  错误KEY
 */
#define ERROR_KEY                   @"error"
#define ERROR_MSG_KEY               @"errorMsg"
#define ALERTVIEW_TITLE             @"提示"
#define NOT_OPEN_TIP                @"即将上线，敬请期待！"

/**
 *  网络错误的宏定义
 */
#define NETWORK_ERROR_TITLE         @"网络连接失败"
#define NETWORK_ERROR_MESSAGE       @"网络连接错误，请稍后再试"


#define APPLICATION_NOT_FIRST_LOAD          @"APPLICATION_NOT_FIRST_LOAD"

#define IDENTIFIER     @"Cell"
#define IDENTIFIER2     @"Cell2"
#define ALL_KEY             @"全部"

#define DEFAULT_PLACEHODER          [UIImage imageNamed:@"default_placeholder"]
#define DEFAULT_AVATAR              [UIImage imageNamed:@"avatar_default"]

#define APP_CONTENT_HEIGHT          [[UIScreen mainScreen] bounds].size.height - 80 - 49

#endif





