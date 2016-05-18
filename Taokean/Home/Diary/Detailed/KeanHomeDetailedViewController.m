//
//  KeanHomeDetailedViewController.m
//  Taokean
//
//  Created by shevchenko on 15/10/30.
//  Copyright © 2015年 shevchenko. All rights reserved.
//

#import "KeanHomeDetailedViewController.h"
#import "KeanDetailedTableViewCell.h"
@interface KeanHomeDetailedViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation KeanHomeDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;//去掉tableview分割线
    [self.tableView registerNib:[UINib nibWithNibName:@"KeanDetailedTableViewCell" bundle:nil] forCellReuseIdentifier:@"keanCell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark - tableView属性
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KeanDetailedTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"keanCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.infoString = [NSString stringWithFormat:@"%@", self.theInfoArray];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    KeanDetailedTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"keanCell"];
    return [cell heightForDownSrring:[NSString stringWithFormat:@"%@", self.theInfoArray]];
}

@end
