//
//  KeanDetailedTableViewCell.h
//  Taokean
//
//  Created by shevchenko on 15/12/10.
//  Copyright © 2015年 shevchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeanDetailedTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *level;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *infoLabel;


@property (strong, nonatomic) NSString * infoString;
- (CGFloat)heightForDownSrring:(NSString *)infoString;

@end
