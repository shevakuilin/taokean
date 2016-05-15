//
//  KeanDetailedTableViewCell.m
//  Taokean
//
//  Created by shevchenko on 15/12/10.
//  Copyright © 2015年 shevchenko. All rights reserved.
//

#import "KeanDetailedTableViewCell.h"

@implementation KeanDetailedTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setInfoString:(NSString *)infoString{
    _infoString = infoString;
    self.infoLabel.text = infoString;
}


- (void)drawRect:(CGRect)rect{
    self.headImage.layer.masksToBounds = YES;
    self.headImage.layer.cornerRadius = self.headImage.bounds.size.height/2;
}

- (CGFloat)heightForDownSrring:(NSString *)infoString{
    self.infoLabel.text = infoString;
    CGSize size = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1;
}

@end
