//
//  KeanMessageTableViewCell.h
//  Taokean
//
//  Created by shevchenko on 15/10/28.
//  Copyright © 2015年 shevchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeanMessageTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *heardImage;//头像
@property (strong, nonatomic) IBOutlet UILabel *nickName;//昵称
@property (strong, nonatomic) IBOutlet UILabel *level;//等级
@property (strong, nonatomic) IBOutlet UILabel *time;//时间
@property (strong, nonatomic) IBOutlet UILabel *messge;//内容
@property (strong, nonatomic) IBOutlet UIImageView *nodeImage;//节点图标

@property (strong, nonatomic) NSString * infoString;
- (CGFloat)heightForDownSrring:(NSString *)infoString;
@end
