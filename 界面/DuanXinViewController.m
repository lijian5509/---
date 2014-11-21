//
//  DuanXinViewController.m
//  快递兔-终
//
//  Created by kuaiditu on 14-11-11.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import "DuanXinViewController.h"
#import "FootView.h"
//#import "HistoryViewController.h"
//#import "WaitViewController.h"
//#import "FillMessageViewController.h"
//#import "LogInViewController.h"
//#import "AppDelegate.h"
//#import "FialViewController.h"


@interface DuanXinViewController ()
{
    NSMutableArray *_dataArray;
    UITextView *_textView;//文本框
    UIView *_editView;//文本框底层视图
    FootView *_footView;
    
}
@end

@implementation DuanXinViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _dataArray =[[NSMutableArray alloc]init];
    }
    return self;
}
//单元格数目
static NSInteger cellNumber=1;

- (void)viewWillAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed=YES;
    GET_PLISTdICT
    //如果用户是否登录后退出
    NSString *exit=dictPlist[@"exit"];
    if ([exit isEqualToString:@"2"]) {
        [self showAlertViewWithMaessage:@"您还没有登录,请登录！" title:@"登录提示" otherBtn:@"登录"];
        return;
    }
    CHECKSTATUS
    self.hidesBottomBarWhenPushed=NO;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showUI];
    //给桌面增加一个手势
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.tableView addGestureRecognizer:tap];
    
}
#pragma mark -实现单元格输入协议
-(void)addTextField:(DuanXinViewCell *)message{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    [_dataArray addObject:message];
    cellNumber++;
    [self.tableView reloadData];
    
}
-(void)removeTextViewWith:(DuanXinViewCell *)message{
    if (_dataArray.count!=0) {
        for (DuanXinViewCell *dcell in _dataArray) {
            if (dcell.deleteBtn.tag==message.deleteBtn.tag) {
                [_dataArray removeObject:dcell];
            }
        }
    }
    cellNumber--;
    [self.tableView reloadData];
}

#pragma mark - 摆UI界面
- (void)showUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"订单详情_11"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
    self.title=@"发送短信";
    GET_PLISTdICT
    //查看是否退出登录
    NSString *exit=dictPlist[@"exit"];
    if ([exit isEqualToString:@"1"]) {
        UIButton *btn=[MyControl creatButtonWithFrame:CGRectMake(0, 0, 60, 44) target:self sel:@selector(historyBtn) tag:99 image:nil title:@"历史记录"];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont boldSystemFontOfSize:15];
        UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
        self.navigationItem.rightBarButtonItem=rightItem;
        [self setFootView];
    }
    //设置头视图
    _editView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 130)];
    _editView.userInteractionEnabled=YES;
    _textView=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    _textView.delegate=self;
    _textView.text=@"请输入短信内容!";
    _textView.keyboardType=UIKeyboardTypeDefault;
    _textView.font=[UIFont systemFontOfSize:17];
    [_editView addSubview:_textView];
    self.tableView.tableHeaderView=_editView;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    TABLEVIEWBACKVIEW;
}
-(void)setFootView{
    _footView=[[[NSBundle mainBundle]loadNibNamed:@"FootView" owner:self options:nil]lastObject];
    [_footView.oneBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_footView.twoBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_footView.threebtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_footView.sureBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_footView.addPerson addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView=_footView;
    _footView.oneBtn.layer.cornerRadius=10;
    _footView.oneBtn.backgroundColor=[UIColor whiteColor];
    _footView.twoBtn.layer.cornerRadius=10;
    _footView.twoBtn.backgroundColor=[UIColor whiteColor];
    _footView.threebtn.layer.cornerRadius=10;
    _footView.threebtn.backgroundColor=[UIColor whiteColor];
    
}
//切换到历史记录的界面
-(void)historyBtn{
    self.hidesBottomBarWhenPushed=YES;
    HistoryViewController *history=[[HistoryViewController alloc]init];
    [self.navigationController pushViewController:history animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

#pragma mark - btn被点击
-(void)btnClicked:(UIButton *)btn{

    if (btn.tag==101) {
        if (_dataArray.count==cellNumber) {
            cellNumber++;
            [self.tableView reloadData];
        }else{
            [self showAlertViewWithMaessage:@"手机号不能为空" title:@"提示" otherBtn:@"ok"];
        }
       
    }
}

#pragma mark -收键盘
-(void)tap{
    [_textView resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.text.length >=11) {
        cellNumber++;
        [_dataArray addObject:textField.text];
        [self.tableView reloadData];
        return NO;
    }
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    textField.placeholder=nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return cellNumber;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"dunaxin";
    DuanXinViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"DuanXinViewCell" owner:self options:nil]lastObject];
    }
    if (_dataArray.count==0&&indexPath.row==0) {
        cell.deleteBtn.hidden=YES;
    }
    if (indexPath.row <_dataArray.count) {
        DuanXinViewCell *Dcell=_dataArray[indexPath.row];
        if (Dcell.deleteBtn.tag==indexPath.row) {
             cell.textField.text=Dcell.textField.text;
        }
    }
//    if (_dataArray.count!=0&&indexPath.row==cellNumber&&((DuanXinViewCell *)_dataArray.lastObject).deleteBtn.tag==indexPath.row-1 ) {
//        [cell.textField becomeFirstResponder];
//    }
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    cell.textDelegate=self;
    cell.deleteBtn.tag=indexPath.row;
    return cell;
}
#pragma mark - 警告框及实现警告协议
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
        {
            return;  
        }
            break;
        case 1:
        {
            LogInViewController *log=[[LogInViewController alloc]init];
            UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:log];
            UIApplication *app=[UIApplication sharedApplication];
            AppDelegate *app2=app.delegate;
            app2.window.rootViewController=nil;
            app2.window.rootViewController=nav;
        }
            break;
            
        default:
            break;
    }
    
}

//显示警告框
- (void) showAlertViewWithMaessage:(NSString *)message title:(NSString *)title otherBtn:(NSString *)btnT {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:btnT, nil];
    [alert show];
}


/*
// Override to support conditional editing of the table view.
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
