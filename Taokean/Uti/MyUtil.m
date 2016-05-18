//
//  WPUtil.m
//  DLD
//
//  Created by Weibo on 14-9-5.
//  Copyright (c) 2014年 Chongqing Institute Of Engineering. All rights reserved.
//

#import "MyUtil.h"
#import "constant.h"
#import "MBProgressHUD.h"

@implementation MyUtil

+ (void)transformView:(UIView *)view withOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation
{
    CGFloat navigationBarOffset = oreintation == 1 ? 0 : 12;
    
    CGRect frame = view.frame;
    if (frame.origin.y < 0) {
        frame.origin.y += offset + navigationBarOffset;
    }else{
        frame.origin.y -= offset + navigationBarOffset;
    }
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = frame;
    }];
    
}

+ (void)transformView:(UIView *)view upWithOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation
{
    CGFloat navigationBarOffset = oreintation == 1 ? 0 : 12;
    CGRect frame = view.frame;
    if (frame.origin.y < 0) {
        return ;
    }else{
        frame.origin.y -= offset + navigationBarOffset;
    }
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = frame;
    }];
}

+ (void)transformView:(UIView *)view downWithOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation
{
    CGFloat navigationBarOffset = oreintation == 1 ? 0 : 12;
    
    CGRect frame = view.frame;
    if (frame.origin.y < 0) {
        frame.origin.y += offset + navigationBarOffset;
    }
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = frame;
    }];
}

+ (void)transformView:(UIView *)view downWithOffset:(CGFloat)offset andOreintation:(NSInteger)oreintation completion:(void (^)(BOOL finished))completion
{
    CGFloat navigationBarOffset = oreintation == 1 ? 0 : 12;
    
    CGRect frame = view.frame;
    if (frame.origin.y < 0) {
        frame.origin.y += offset + navigationBarOffset;
    }
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = frame;
    } completion:completion];
}

+ (void)hideKeyboardWithView:(UIView *)view
{
    [view endEditing:YES];
}

+ (BOOL)isNilOrEmpty:(id)string
{
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] && [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+ (void)setNextViewControllerBackButtonTitle:(UIViewController *)viewController
{
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
}

+ (BOOL)isValidMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[0-9]|7[0-9])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isValidEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)isValidPlate:(NSString *)plate
{
    NSString * plateRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]";
    NSPredicate * plateTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", plateRegex];
    return [plateTest evaluateWithObject:plate];
}

+ (NSDate *)getTodayMidNightTimeInterval
{
    NSDate * nowDate = [NSDate date];
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSString * dayString = [df stringFromDate:nowDate];
    
    NSString * newString = [NSString stringWithFormat:@"%@ 00:00:00", dayString];
    
    NSDateFormatter * df2 = [[NSDateFormatter alloc] init];
    [df2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * newDate = [df2 dateFromString:newString];
    return newDate;
}

+ (void)saveObject:(id)object forKey:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:object forKey:key];
    [userDefaults synchronize];
}

+ (id)getObjectForKey:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    id object = [userDefaults objectForKey:key];
    return object;
}

+ (void)saveBool:(BOOL)yesOrNo forKey:(NSString *)key;
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:yesOrNo forKey:key];
    [userDefaults synchronize];
}

+ (BOOL)getBoolForKey:(NSString *)key
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL yesOrNo = [userDefaults boolForKey:key];
    return yesOrNo;
}

+ (id)getViewControllerWithIdentifier:(NSString *)identifier storyboardName:(NSString *)storyboardName
{
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    return viewController;
}

+ (NSString *)getOrderStatusWithValue:(id)value
{
    NSString * string = @"";
    NSInteger status = [value integerValue];
    if (status == 0) {
        string = @"未取号";
    }else if (status == 1){
        string = @"已取号";
    }else{
        string = @"已取消";
    }
    return string;
}

+(NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim
{
    NSScanner *theScanner = [NSScanner scannerWithString:html];
    NSString *text = nil;
    
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:&text] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        
        html = [html stringByReplacingOccurrencesOfString:
                [ NSString stringWithFormat:@"%@>", text]
                                               withString:@""];
        html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    }
    
    return trim ? [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] : html;
}

+ (UIBarButtonItem *)backButtonWithTarget:(id)target action:(SEL)selector
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 20);
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 8)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -4, 0, 4)];
    [button setImage:[UIImage imageNamed:@"arrow_left"] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return barButtonItem;
}

+ (id)generateSaveObjectWithDictionary:(NSDictionary *)dict
{
    NSString * nameKey = @"name";
    NSString * idKey = @"id";
    NSDictionary * saveObject = @{nameKey:dict[nameKey], idKey:dict[idKey]};
    return saveObject;
}

+ (BOOL)isValidIdentityCard:(NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

+ (NSString *)dateStringFromObject:(id)object
{
    if (object) {
        double timeStamp = [object doubleValue];
        
        NSDate * date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
        
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM月dd日 HH:mm"];
        NSString * time = [formatter stringFromDate:date];
        return time;
        
    }
    return @"";
}

+ (NSString *)getMarriageStateWithObject:(id)obj
{
    NSInteger state = 0;
    if (![obj isKindOfClass:[NSNull class]]) {
        state = [obj integerValue];
    }
    NSString * marriageState = @"";
    switch (state) {
        case 0:
            marriageState = @"保密";
            break;
        case 1:
            marriageState = @"未婚";
            break;
        case 2:
            marriageState = @"已婚";
            break;
        case 3:
            marriageState = @"离异";
            break;
            
        default:
            marriageState = @"保密";
            break;
    }
    return marriageState;
}

+ (NSURL *)imageUrlWithString:(NSString *)string
{
    if ([string isKindOfClass:[NSNull class]]) {
        return [NSURL URLWithString:@""];
    }
    NSString * iconUrlString = @"";
    if ([string hasPrefix:@"http"]) {
        iconUrlString = string;
    }else{
        iconUrlString = [NSString stringWithFormat:@"%@%@", @"", string];
    }
    return [NSURL URLWithString:iconUrlString];
}

//+ (NSURL *)voiceUrlWithString:(NSString *)string
//{
//    if ([string isKindOfClass:[NSNull class]]) {
//        return [NSURL URLWithString:@""];
//    }
//    NSString * iconUrlString = @"";
//    if ([string hasPrefix:@"http"]) {
//        iconUrlString = string;
//    }else{
//        iconUrlString = [NSString stringWithFormat:@"%@%@", URL_IMAGE_PREFIX, string];
//    }
//    return [NSURL URLWithString:iconUrlString];
//}

+ (id)getNoneNillObject:(id)obj
{
    if ([obj isKindOfClass:[NSNull class]]) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@", obj];
}
+ (void)showTextWithView:(UIView*)view Text:(NSString*)text
{
    if(view == nil) return; // TODO:
    //    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //
    //    // Configure for text only and offset down
    //    hud.mode = MBProgressHUDModeText;
    //    hud.labelText = text;
    //    hud.margin = 10.f;
    //    hud.yOffset = 130.f;
    //
    //    hud.removeFromSuperViewOnHide = YES;
    //    hud.userInteractionEnabled = NO;
    //
    //    [hud hide:YES afterDelay:2];
    [view endEditing:YES];
    [HudUtil showHudWithText:text inView:view];
}
//保存到本地
+ (void) saveCenterProValue:(NSString*)valueStr key:(NSString *)keyStr{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:valueStr forKey:keyStr];
    [defaults synchronize];
}
+ (id)getCenterPro:(NSString*)identifier{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:identifier];
}
+(NSString *)getDate:(NSString *)str
{
    //  NSDate *date = [NSDate date];
    NSString * str1 = [str substringToIndex:10];
    NSDate *now = [NSDate date];
    //
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString * str2 = [[dateFormatter stringFromDate:now] substringToIndex:10];
    if ([str1 isEqualToString:str2]) {
        str1 = [str substringWithRange:NSMakeRange(10, 6)];
    }
    
    
    return str1;
    
}
+(NSString *)getBirthday:(NSString *)str
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //医生出生日期
    if ([MyUtil isNilOrEmpty:str]) {
        return @"";
    }
    NSString * str1 = [str substringToIndex:10];
    //现在的时间
    NSString * str2 = [[dateFormatter stringFromDate:[NSDate date]] substringToIndex:10];
    
    NSDate *date2 =[dateFormatter dateFromString:str2];
    NSDate *date1 =[dateFormatter dateFromString:str1];
    NSTimeInterval time=[date2 timeIntervalSinceDate:date1];
    int days=((int)time)/(3600*24);
    
    NSString *dateContent=[[NSString alloc] initWithFormat:@"%d",days/365];
    return dateContent;
    
}
+ (NSString *)getPhoneReserveStateStringWithState:(id)state
{
    NSString * string = @"";
    if ([state isKindOfClass:[NSNull class]]) {
        string = @"";
    }else{
        NSString * stateString = state[@"state"];
        NSInteger stateNumber = [stateString integerValue];
        if (stateNumber == -1) {
            string = @"患者不认可";
        }else if (stateNumber == 0){
            string = @"我已确认";
        }else if (stateNumber == 1){
            BOOL isExpire = NO;
            NSString * timeString = [NSString stringWithFormat:@"%@ %@", state[@"day"], state[@"times"]];
            NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyyMMdd HH:mm"];
            NSDate * orderDate = [dateFormatter dateFromString:timeString];
            NSTimeInterval seconds = [orderDate timeIntervalSinceNow];
            if (seconds < -60 * 60 * 3) {
                isExpire = YES;
            }
            if (isExpire) {
                string = @"预约已过期";
            }else{
                string = @"预约创建";
            }
        }else if (stateNumber == 2){
            string = @"医生已确认";
        }
    }
    return string;
}

+ (NSString *)getOnDoorReserveStateStringWithState:(id)state
{
    NSString * string = @"";
    if ([state isKindOfClass:[NSNull class]]) {
        string = @"";
    }else{
        NSInteger stateNumber = [state integerValue];
        switch (stateNumber) {
            case 0:
            {
                string = @"已发起";
            }
                break;
            case 1:
            {
                string = @"已同意";
            }
                break;
            case 2:
            {
                string = @"不同意";
            }
                break;
            case 3:
            {
                string = @"已关闭";
            }
                break;
            case 4:
            {
                string = @"已确认";
            }
                break;
            case 5:
            {
                string = @"未确认";
            }
                break;
                
            default:
                break;
        }
    }
    return string;
}

//+ (NSString *)getWeekdayWithDate:(NSDate *)date
//{
//    NSString * weekday = @"";
//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//    NSDateComponents *comps = [[NSDateComponents alloc] init];
//    NSInteger unitFlags =NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit | NSWeekdayCalendarUnit |
//    NSHourCalendarUnit |NSMinuteCalendarUnit | NSSecondCalendarUnit;
//    comps = [calendar components:unitFlags fromDate:date];
//    DLog(@"Weekday: %@", @(comps.weekday));
//    switch (comps.weekday) {
//        case 1:
//        {
//            weekday = @"星期日";
//        }
//            break;
//        case 2:
//        {
//            weekday = @"星期一";
//        }
//            break;
//        case 3:
//        {
//            weekday = @"星期二";
//        }
//            break;
//        case 4:
//        {
//            weekday = @"星期三";
//        }
//            break;
//        case 5:
//        {
//            weekday = @"星期四";
//        }
//            break;
//        case 6:
//        {
//            weekday = @"星期五";
//        }
//            break;
//        case 7:
//        {
//            weekday = @"星期六";
//        }
//            break;
//            
//        default:
//            break;
//    }
//    return weekday;
//}

+ (NSString *)getNoneNilString:(id)obj
{
    NSString * string = @"";
    if (!obj) {
        return string;
    }
    if (![obj isKindOfClass:[NSNull class]]) {
        string = [NSString stringWithFormat:@"%@", obj];
    }
    return string;
}

+ (NSString *)getLevelWithId:(id)levelId
{
    if ([levelId isKindOfClass:[NSNull class]]) {
        return @"";
    }
    NSInteger levelNumber = [levelId integerValue];
    NSString * string = @"";
    switch (levelNumber) {
        case 1:
        {
            string = @"较满意";
        }
            break;
        case 2:
        {
            string = @"满意";
        }
            break;
        case 3:
        {
            string = @"较满意";
        }
            break;
        case 4:
        {
            string = @"非常满意";
        }
            break;
        case 5:
        {
            string = @"非常满意";
        }
            break;
            
        default:
            break;
    }
    return string;
}

+ (void)jumpToLoginIfNeededWithViewController:(UIViewController *)viewController responseObject:(id)obj
{
    NSString * tipString = obj[@"data"][@"msg"];
    if ([@"请登录" isEqualToString:tipString]) {
        UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        UINavigationController * navigationController = [sb instantiateViewControllerWithIdentifier:@"loginNavigation"];
        [viewController presentViewController:navigationController animated:YES completion:^{
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"SS_LOGIN_KEY"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }];
    }
}

+ (NSInteger)getAgeWithDateString:(NSString *)dateString andDateFormate:(NSString *)format
{
    if ([dateString isKindOfClass:[NSNull class]]) {
        return 0;
    }
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate * pastDate = [dateFormatter dateFromString:dateString];
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:pastDate];
    NSInteger age = timeInterval / (60 * 60 * 24 * 365);
    return age;
}

+ (void)jumpToLoginWithViewController:(UIViewController *)viewController
{
    UINavigationController * loginNavigationController = [MyUtil getViewControllerWithIdentifier:@"loginNavigation" storyboardName:@"Login"];
    [viewController presentViewController:loginNavigationController animated:YES completion:^{
        
    }];
}

+ (NSString *)getCertificateName:(NSDictionary *)dict
{
    NSString * work = [MyUtil getNoneNilString:dict[@"work"]];
    NSString * profession_auth = [MyUtil getNoneNilString:dict[@"profession_auth"]];
    NSString * firstString = [NSString stringWithFormat:@"%@%@", work, profession_auth];
    
    NSString * school = [MyUtil getNoneNilString:dict[@"school"]];
    NSString * major = [MyUtil getNoneNilString:dict[@"major"]];
    NSString * degree = [MyUtil getNoneNilString:dict[@"degree"]];
    NSString * secondString = [NSString stringWithFormat:@"%@%@%@", school, major, degree];
    
    if ([MyUtil isNilOrEmpty:firstString] && [MyUtil isNilOrEmpty:secondString]) {
        return @"暂无";
    }
    
    if ([MyUtil isNilOrEmpty:firstString]) {
        return secondString;
    }
    if ([MyUtil isNilOrEmpty:secondString]) {
        return firstString;
    }
    return [NSString stringWithFormat:@"%@,%@", firstString, secondString];
}

+ (NSString *)getTimeStringWithString:(NSString *)string
{
    NSString * time = [string substringWithRange:NSMakeRange(6, 10)];
    double timeInterval = [time doubleValue];
    NSDate * orderDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:orderDate];
}

+ (NSString *)getMessageTime:(NSString *)string
{
    NSString * time = [string substringWithRange:NSMakeRange(6, 10)];
    double timeInterval = [time doubleValue];
    NSDate * orderDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    return [dateFormatter stringFromDate:orderDate];
}

+ (NSString *)getStateWithNumber:(id)number
{
    NSInteger state = [number integerValue];
    NSString * string = @"";
    // (1:未付款，2:已付款，3:已发货，4:已收货，5:已关闭)
    switch (state) {
        case 1:
        {
            string = @"未付款";
        }
            break;
        case 2:
        {
            string = @"已提交";
        }
            break;
        case 3:
        {
            string = @"已发货";
        }
            break;
        case 4:
        {
            string = @"已收货";
        }
            break;
        case 5:
        {
            string = @"已关闭";
        }
            break;
            
        default:
        {
            
        }
            break;
    }
    return string;
}

//+ (void)login
//{
//    NSString *url= [NSString stringWithFormat:@"%@%@%@",SERVER_IP,NewLogin_API,API_KEY];
//    
//    NSString * username = [WPUtil getObjectForKey:wpUserName];
//    NSString * password = [WPUtil getObjectForKey:wpPassword];
//    if (![WPUtil isNilOrEmpty:username]) {
//        NSDictionary * parameters = @{@"phoneType":@"1", @"shouJiHao":username, @"huiYuanPass":password};
//        [WTRequestCenter postWithURL:url parameters:parameters finished:^(NSURLResponse *response, NSData *data) {
//            NSDictionary *dic = [WTRequestCenter JSONObjectWithData:data];
//            if(!(dic[@"data"]==nil) ){
//                if([dic[@"result"] isEqualToString:@"ok"]){
//                    
//                    if ([dic[@"data"][@"Address"] isEqual:[NSNull null]]) {
//                        
//                    }else{
//                        //登陆后保存数据
//                        [[NSUserDefaults standardUserDefaults] setObject:dic[@"data"][@"Address"] forKey:kAddress];
//                        [[NSUserDefaults standardUserDefaults] setObject:dic[@"data"][@"Name"] forKey:kCustomer];
//                        [[NSUserDefaults standardUserDefaults] setObject:dic[@"data"][@"Mobile"] forKey:kUserPhone];
//                        id sellerId = dic[DATA_KEY][@"SellerId"];
//                        if ([sellerId isKindOfClass:[NSNull class]]) {
//                            [WPUtil saveBool:NO forKey:LS_IS_CUSTOM_USER];
//                        }else{
//                            NSInteger number = [sellerId integerValue];
//                            if (number > 0) {
//                                [WPUtil saveBool:YES forKey:LS_IS_CUSTOM_USER];
//                            }else{
//                                [WPUtil saveBool:NO forKey:LS_IS_CUSTOM_USER];
//                            }
//                        }
//                    }
//                    
//                }
//            }
//        } failed:^(NSURLResponse *response, NSError *error) {
//            
//        }];
//        
//    }


//}

@end
