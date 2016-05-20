//
//  KeanMyCenterViewController.m
//  Taokean
//
//  Created by shevchenko on 15/10/28.
//  Copyright © 2015年 shevchenko. All rights reserved.
//

#import "KeanMyCenterViewController.h"
#import "UINavigationBar+Awesome.h"
#import "constant.h"
#import "KeanMyInfoTableViewCell.h"
#import "KeanMyMangeTableViewCell.h"
#define NAVBAR_CHANGE_POINT 50

@interface KeanMyCenterViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation KeanMyCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"KeanMyInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyInfo"];
    [self.tableView registerNib:[UINib nibWithNibName:@"KeanMyMangeTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyMange"];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 判断移动tableView的改变量
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //设置navigation颜色
    UIColor * color = MyColor(0, 178, 145);
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}

#pragma mark -
#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 3;
    } else if (section == 2) {
        return 9;
    }
    else {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        KeanMyInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyInfo"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    } else if (indexPath.section == 1) {
        KeanMyMangeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyMange"];
        if (indexPath.row == 0) {
            cell.typeImageView.image = [UIImage imageNamed:@"lv"];
            cell.typeTitleLabel.text = @"等级";
        } else if (indexPath.row == 1) {
            cell.typeImageView.image = [UIImage imageNamed:@"shuxing"];
            cell.typeTitleLabel.text = @"属性/能力值";
        } else {
            cell.typeImageView.image = [UIImage imageNamed:@"xunzhang"];
            cell.typeTitleLabel.text = @"勋章墙";
        }
        return cell;
    } else if (indexPath.section == 2) {
        KeanMyMangeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyMange"];
        if (indexPath.row == 0) {
            cell.typeImageView.image = [UIImage imageNamed:@"yigui"];
            cell.typeTitleLabel.text = @"衣柜";
        } else if (indexPath.row == 1) {
            cell.typeImageView.image = [UIImage imageNamed:@"hauzhuangpin"];
            cell.typeTitleLabel.text = @"化妆品";
        } else if (indexPath.row == 2) {
            cell.typeImageView.image = [UIImage imageNamed:@"xiezi"];
            cell.typeTitleLabel.text = @"鞋子";
        } else if (indexPath.row == 3) {
            cell.typeImageView.image = [UIImage imageNamed:@"yinshi"];
            cell.typeTitleLabel.text = @"饮食结构/规律";
        } else if (indexPath.row == 4) {
            cell.typeImageView.image = [UIImage imageNamed:@"shugui"];
            cell.typeTitleLabel.text = @"书柜";
        } else if (indexPath.row == 5) {
            cell.typeImageView.image = [UIImage imageNamed:@"qianbao"];
            cell.typeTitleLabel.text = @"钱包";
        } else if (indexPath.row == 6) {
            cell.typeImageView.image = [UIImage imageNamed:@"xingcheng"];
            cell.typeTitleLabel.text = @"行程";
        } else if (indexPath.row == 7) {
            cell.typeImageView.image = [UIImage imageNamed:@"tianqi"];
            cell.typeTitleLabel.text = @"天气";
        } else {
            cell.typeImageView.image = [UIImage imageNamed:@"rili"];
            cell.typeTitleLabel.text = @"日历";
        }
        
        return cell;
    }
    else {
        KeanMyMangeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyMange"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 155;
    } else {
        return 45;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    } else {
        return 20;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    [headerView setBackgroundColor:MyColor(237, 236, 242)];
    return headerView;
}



@end
