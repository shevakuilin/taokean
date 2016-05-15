//
//  KeanMessageTableViewCell.m
//  Taokean
//
//  Created by shevchenko on 15/10/28.
//  Copyright © 2015年 shevchenko. All rights reserved.
//

#import "KeanMessageTableViewCell.h"

@implementation KeanMessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.nodeImage.backgroundColor=[UIColor orangeColor];//设置节点的颜色
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];//这个函数是当cell被点击的时候调用的方法,最好不要用作初始化的地方


    // Configure the view for the selected state
}


- (void)setInfoString:(NSString *)infoString{
    _infoString = infoString;
    self.messge.text = infoString;
}


-(void)drawRect:(CGRect)rect{//这个方法可以当作在自定义的cell中做初始化的地方
    //设置头像和节点图标的圆角属性
    self.heardImage.layer.masksToBounds = YES;
    self.nodeImage.layer.masksToBounds = YES;
    self.heardImage.layer.cornerRadius = self.heardImage.bounds.size.height/2;
    self.nodeImage.layer.cornerRadius = self.nodeImage.bounds.size.height/2;
}

- (CGFloat)heightForDownSrring:(NSString *)infoString{
    self.messge.text = infoString;
    CGSize size = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1;
}




@end
