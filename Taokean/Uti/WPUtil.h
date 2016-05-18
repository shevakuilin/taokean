//
//  WPUtil.h
//  DLD
//
//  Created by Weibo on 14-9-5.
//  Copyright (c) 2014年 Chongqing Institute Of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#define UM_SHARE_APP_KEY         @"5549891967e58ed0b800603a"
                                    // JYB key @"54abcfc0fd98c5b44f001241"
#define WEIXIN_APPID        @"wxf90581581a843592"
#define WEIXIN_SECRET       @"5f8a1cb0db143f52afca96c953e7b25b"
#define SHARE_URL           @"http://fir.im/sspa"
#define USER_USERNAME       @"USER_USERNAME"
#define USER_PASSWORD       @"USER_PASSWORD"
#define USER_USERINFO       @"USER_USERINFO"
#define AUTHID @"authID"
#define IF_OPEN_LISTERNER @"ifOpenListerner"

#define MY_IMNAME @"username"
#define MY_IMPASSWORD @"pwd"

#define WPColor(x, y, z)            [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:1]


@interface WPUtil : NSObject

//调节view高度；参数：需要调节的view，需要调节的偏移量，视图的方向
+ (void)transformView:(UIView *)view withOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation;

+ (void)transformView:(UIView *)view upWithOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation;
+ (void)transformView:(UIView *)view downWithOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation;

+ (void)transformView:(UIView *)view downWithOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation completion:(void (^) (BOOL finished))completion;

+ (void)hideKeyboardWithView:(UIView *)view;

//判断给定的对象是否为空
+ (BOOL)isNilOrEmpty:(id)string;

//设置视图下一级标题为返回
+ (void)setNextViewControllerBackButtonTitle:(UIViewController *)viewController;

//判断是否有效的手机号码
+ (BOOL)isValidMobile:(NSString *)mobileNum;

+ (BOOL)isValidEmail:(NSString *)email;

+ (BOOL)isValidPlate:(NSString *)plate;

+ (NSDate *)getTodayMidNightTimeInterval;

+ (void)saveObject:(id)object forKey:(NSString *)key;

+ (id)getObjectForKey:(NSString *)key;

+ (void)saveBool:(BOOL)yesOrNo forKey:(NSString *)key;

+ (BOOL)getBoolForKey:(NSString *)key;

/**
 *  @Author Pang Weibo, 14-12-26 09:12
 *
 *  通过Storyboard Name和Identifier获取视图
 *
 *  @param identifier     identifier
 *  @param storyboardName storyboard name
 *
 *  @return 对应的视图
 */
+ (id)getViewControllerWithIdentifier:(NSString *)identifier storyboardName:(NSString *)storyboardName;

+ (NSString *)getOrderStatusWithValue:(id)value;

/**
 *  去掉字符串中的HTML标签
 *
 *  @param html 需要去掉HTML标签的字符串
 *  @param trim 是否需要去掉HTML标签
 *
 *  @return 去掉HTML标签后的字符串
 */
+(NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim;

+ (id)getNoneNillObject:(id)obj;

+ (UIBarButtonItem *)backButtonWithTarget:(id)target action:(SEL)selector;

+ (id)generateSaveObjectWithDictionary:(NSDictionary *)dict;

/**
 *  判断是否有效的身份证号
 *
 *  @param identityCard 要判断的字符串
 *
 *  @return 是否有效
 */
+ (BOOL)isValidIdentityCard:(NSString *)identityCard;

+ (NSString *)dateStringFromObject:(id)object;

+ (NSString *)getMarriageStateWithObject:(id)obj;

+ (NSURL *)imageUrlWithString:(NSString *)string;
//提示框
+ (void)showTextWithView:(UIView*)view Text:(NSString*)text;
//保存到本地
+ (void) saveCenterProValue:(NSString*)valueStr key:(NSString *)keyStr;
+ (id)getCenterPro:(NSString*)identifier;
//转换时间
+(NSString *)getDate:(NSString *)str;
//转换生日

+(NSString *)getBirthday:(NSString *)str;
+ (NSString *)getPhoneReserveStateStringWithState:(id)state;

+ (NSString *)getOnDoorReserveStateStringWithState:(id)state;

+ (NSString *)getWeekdayWithDate:(NSDate *)date;

+ (NSString *)getNoneNilString:(id)obj;

+ (NSString *)getLevelWithId:(id)levelId;

+ (void)jumpToLoginIfNeededWithViewController:(UIViewController *)viewController responseObject:(id)obj;

+ (NSInteger)getAgeWithDateString:(NSString *)dateString andDateFormate:(NSString *)format;

+ (void)jumpToLoginWithViewController:(UIViewController *)viewController;

+ (NSString *)getCertificateName:(NSDictionary *)dict;

+ (NSString *)getTimeStringWithString:(NSString *)string;

+ (NSString *)getStateWithNumber:(id)number;

+ (void)login;

+ (NSString *)getMessageTime:(NSString *)string;

@end
