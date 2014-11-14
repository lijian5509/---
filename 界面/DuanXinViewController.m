//
//  DuanXinViewController.m
//  快递兔-终
//
//  Created by kuaiditu on 14-11-11.
//  Copyright (c) 2014年 kuaiditu. All rights reserved.
//

#import "DuanXinViewController.h"
#import "FootView.h"
#import "HistoryViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showUI];
    //给桌面增加一个手势
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.tableView addGestureRecognizer:tap];
    [self setFootView];
    
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
    self.title=@"短信通知";
    UIButton *btn=[MyControl creatButtonWithFrame:CGRectMake(0, 0, 60, 44) target:self sel:@selector(historyBtn) tag:99 image:nil title:@"历史记录"];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem=rightItem;
    //设置头视图
    _editView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
    _editView.userInteractionEnabled=YES;
    _textView=[[UITextView alloc]initWithFrame:CGRectMake(10, 10, 300, 100)];
    _textView.delegate=self;
    _textView.text=@"请输入短信内容!";
    _textView.layer.borderWidth=1;
    _textView.keyboardType=UIKeyboardTypeDefault;
    _textView.font=[UIFont systemFontOfSize:20];
    [_editView addSubview:_textView];
    self.tableView.tableHeaderView=_editView;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor=[UIColor whiteColor];
    //设置脚视图
//    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
//    view.userInteractionEnabled=YES;
//    UIButton *btn=[MyControl creatButtonWithFrame:CGRectMake(220, 5, 90, 40) target:self sel:@selector(btnClicked:) tag:101 image:nil title:@"➕添加联系人"];
//    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
//    [view addSubview:btn];
//    UIButton *btn1=[MyControl creatButtonWithFrame:CGRectMake(10, 50, 300, 40) target:self sel:@selector(btnClicked:) tag:102 image:nil title:@"确定"];
//    btn1.backgroundColor=[UIColor orangeColor];
//    [view addSubview:btn1];
//    self.tableView.tableFooterView=view;
    
//    _footView=[[FootView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
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
    _footView.oneBtn.layer.borderWidth=1;
    _footView.oneBtn.backgroundColor=[UIColor whiteColor];
    _footView.twoBtn.layer.cornerRadius=10;
    _footView.twoBtn.layer.borderWidth=1;
    _footView.twoBtn.backgroundColor=[UIColor whiteColor];
    _footView.threebtn.layer.cornerRadius=10;
    _footView.threebtn.layer.borderWidth=1;
    _footView.threebtn.backgroundColor=[UIColor whiteColor];
    _footView.imageView.layer.borderWidth=1;
    
}
//切换到历史记录的界面
-(void)historyBtn{
    HistoryViewController *history=[[HistoryViewController alloc]init];
    [self.navigationController pushViewController:history animated:YES];
}

#pragma mark - btn被点击
-(void)btnClicked:(UIButton *)btn{
    if (btn.tag==101) {
        cellNumber++;
        [self.tableView reloadData];
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
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    cell.textDelegate=self;
    cell.deleteBtn.tag=indexPath.row;
    return cell;
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
