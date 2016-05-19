//
//  KeanMyInfoTableViewCell.m
//  Taokean
//
//  Created by huiren on 16/5/19.
//  Copyright © 2016年 shevchenko. All rights reserved.
//

#import "KeanMyInfoTableViewCell.h"

@implementation KeanMyInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.editButton.selected = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHeadImageView:(UIImageView *)headImageView
{
    _headImageView = headImageView;
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.cornerRadius = self.headImageView.layer.frame.size.height / 2;
    self.headImageView.layer.borderColor = [UIColor orangeColor].CGColor;
    self.headImageView.layer.borderWidth = 0.5;
    self.headImageView.layer.backgroundColor = [UIColor whiteColor].CGColor;
}

- (IBAction)editButton:(id)sender {
    if (self.editButton.selected == NO) {
        self.editButton.selected = YES;
        return;
        
    } else {
        self.editButton.selected = NO;
        return;
    }
}

@end
