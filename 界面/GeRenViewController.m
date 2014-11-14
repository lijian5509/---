//
//  GeRenViewController.m
//  快递兔-终
//
//  Created by kuaiditu on 14-11-10.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import "GeRenViewController.h"
#import "HeadView.h"
#import "GeRenTableViewCell.h"
#import "SheZhiViewController.h"
#import "ShareViewController.h"
#import "TabBarViewController.h"
#import "NoMoneyViewController.h"

@interface GeRenViewController ()
{
    HeadView *_headView;
    NSArray *_cellImagesArray;
    NSArray *_cellTitleArray;
}
@end

@implementation GeRenViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _cellImagesArray=@[@"个人中心_06",@"个人中心_09",@"个人中心_11",@"个人中心_13"];
        _cellTitleArray = @[@"我的余额",@"分享有惊喜",@"意见反馈",@"设置"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showUI];
    [self creatHeadView];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    TABLEVIEWBACKVIEW;
    self.tableView.scrollEnabled=NO;
}
#pragma mark - 创建一个头视图
-(void)creatHeadView{
    _headView=[[[NSBundle mainBundle]loadNibNamed:@"HeadView" owner:self options:nil]lastObject] ;
    self.tableView.tableHeaderView=_headView;
}
#pragma mark - 摆UI界面
- (void)showUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"订单详情_11"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
    self.title=@"个人中心";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"cellId";
    GeRenTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellId]
    ;
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"GeRenTableViewCell" owner:self options:nil]lastObject];
    }
    cell.titleLabel.text=_cellTitleArray[indexPath.row];
    if (indexPath.row==1) {
        cell.titleLabel.textColor=[UIColor orangeColor];
    }
    if (indexPath.row==3) {
        cell.lineLabel.hidden=YES;
    }
    cell.rightView.image=[UIImage imageNamed:_cellImagesArray[indexPath.row]];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
//设置分区头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    view.backgroundColor=GRAYCOLOR;
    return view;
}

#pragma mark - 单元格选中后
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.hidesBottomBarWhenPushed=YES;
    switch (indexPath.row) {
        case 0://我的余额
        {
            NoMoneyViewController *money=[[NoMoneyViewController alloc]init];
            [self.navigationController pushViewController:money animated:YES];
            
        }
            break;
        case 1://分享有惊喜
        {
            ShareViewController *share=[[ShareViewController alloc]init];
            [self.navigationController pushViewController:share animated:YES];
        }
            break;
        case 2://意见反馈
        {
            
        }
            break;
        case 3://设置
        {
            SheZhiViewController *shezhi=[[SheZhiViewController alloc]init];
            [self.navigationController pushViewController:shezhi animated:YES];
        }
            break;
            
        default:
            break;
    }
    self.hidesBottomBarWhenPushed=NO;
    
}

/*
// Override to support conditional edi
 ting of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
