//
//  KeanHomeViewController.m
//  Taokean
//
//  Created by shevchenko on 15/10/27.
//  Copyright © 2015年 shevchenko. All rights reserved.
//

#import "KeanHomeViewController.h"
#import "UINavigationBar+Awesome.h"
#import "constant.h"
#import "KeanMessageTableViewCell.h"
#import "KeanHomeDetailedViewController.h"
#define NAVBAR_CHANGE_POINT 50

@interface KeanHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray * infoArray;

@end

@implementation KeanHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //延迟线程进程3秒（目的为了延长LaunchImage的显示时间）
    [NSThread sleepForTimeInterval:3.0];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//去掉tableview分割线
    
    self.infoArray = [[NSArray alloc] init];
    self.infoArray = @[@"これ 以上 何 を 失 えば 心 は 许 されるの",@"どれほどの 痛 みならば もう 一度君 に 会 える",@"one more time 季节 よ うつろわないで,one more time ふざけあった 时间 よ",@"食 い 违 うときはいつも 仆 が 先 に 折 れたね,わがままな 性格 が なおさら 爱 しくさせた,one more chance 记忆 に 足 を 取 られて,one more chance 次 の 场所 を 选 べないlalalalalalalalllalalalalalalalalalalalalalalalllaalallalalalaalalalalalalala",@"いつでも 捜さ しているよ どっかに 君 の 姿 を",@"向 かいのホーム 路地裏 の 窓",@"こんなとこにいるはずもないのに",@"愿 いがもしも 叶 うなら 今 すぐ 君 のもとへ",@"できないことはもう 何 もない",@"全 てかけて 抱 きしめてみせるよ",@"寂しさ 纷 らすだけなら 谁 でもいいはずなのに",@"星 が 落 ちそうな 夜 だから 自分 を 伪 れない",@"いつでも 捜 しているよ どっかに 君 の 姿 を",@"奇迹 がもしも 起 こるなら 今 すぐ 君 に 见 せたい",@"夏 の 思 い 出 がまわる ふいに 消 えた 鼓动",@"いつでも 捜 しているよ どっかに 君 の 姿 を"];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;//去除tableView顶部空白
//    [WPUtil showTextWithView:self.view Text:@"最多只能选择三个"];
    
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
    UIColor * color = WPColor(0, 178, 145);
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}




#pragma mark - TableViewDataSouce

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"header";
//}

/*
 返回的数据数量
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.infoArray.count;
}

/*
 section数量
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/*
 cell显示
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * identify = @"Cell";
    
    KeanMessageTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    cell.infoString = [NSString stringWithFormat:@"%@", self.infoArray[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//点击cell时无色
   
    return cell;
}

/*
 cell高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identify = @"Cell";
    
    KeanMessageTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:identify];
    return [cell heightForDownSrring:[NSString stringWithFormat:@"%@", self.infoArray[indexPath.row]]];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    KeanHomeDetailedViewController * detailedVC = [MyUtil getViewControllerWithIdentifier:@"detailed" storyboardName:@"Main"];
    detailedVC.theInfoArray = self.infoArray[indexPath.row];
    
    [self.navigationController pushViewController:detailedVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
