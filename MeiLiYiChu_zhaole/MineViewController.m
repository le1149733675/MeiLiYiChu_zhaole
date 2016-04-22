//
//  MineViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "MineViewController.h"
#import "AllTableViewCell.h"
#import "TopTableViewCell.h"
#import "LoginViewController.h"
@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}
@end

@implementation MineViewController


-(void)viewWillAppear:(BOOL)animated{
    //解决屏幕上部有一条白线的问题
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    _tableView= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT-49) style: UITableViewStyleGrouped];
    
    //弹射效果
    //_tableView.bounces = NO;
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    //如果此表格分五个区,最上部的图片放在第一个区的区头里,则可以完美的解决白线问题和"全部订单"下部的灰线
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0 ) {
        return 0.1;
    }
    
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3 ) {
        return 20;
    }
    return 0.1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else if (section == 1)
    {
        return 7;
    }else if (section== 2)
    {
        return 3;
    }
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row == 0) {
            static NSString *cellID = @"cell";
            TopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (cell == nil) {
                cell = [[TopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            cell.topView.image = [UIImage imageNamed:@"topView"];
            cell.titLabel.text = @"登录美丽衣橱,有神秘惊喜哦!";
            [cell.loginButton setBackgroundImage:[UIImage imageNamed:@"title_login"] forState:UIControlStateNormal];
            [cell.loginButton addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
            return cell;
            
        }
        else  if (indexPath.row == 1) {
            static NSString *cellID = @"cell1";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            cell.imageView.image = [UIImage imageNamed:@"order"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"全部订单";
            
            return cell;
        }else if (indexPath.row == 2)
        {
            static NSString *cellID = @"cell2";
            AllTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (cell == nil) {
                cell = [[AllTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            return cell;
        }
    }else if (indexPath.section == 1)
    {
        NSMutableArray *titleArray1 = [NSMutableArray arrayWithObjects:@"我的收货地址",@"我的优惠券",@"我的钱包",@"我的美丽币",@"签到中心",@"我的宝贝",@"我的品牌" ,nil];
        
        static NSString *cellID = @"cell3";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(VIEWWIDTH-100, 0, 60, 44)];
            label1.tag = 1;
            label1.font = [UIFont systemFontOfSize:13];
            label1.textColor = RGB(91, 91, 91);
            [cell addSubview:label1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        
        UILabel *label1 = (UILabel*)[cell viewWithTag:1];
        if (indexPath.row == 2) {
            label1.text = @"可用余额0";
            label1.textAlignment = NSTextAlignmentRight;
        }else if (indexPath.row == 3)
        {
            label1.text = @"0枚";
            label1.textAlignment = NSTextAlignmentRight;
        }
        
        
        
        cell.textLabel.text = [titleArray1 objectAtIndex:indexPath.row];
        NSString *imageString1 = [NSString stringWithFormat:@"My-%ld",indexPath.row+1];
        cell.imageView.image = [UIImage imageNamed:imageString1];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
        
        
        
        
        
    }else if ( indexPath.section == 2)
    {
        NSMutableArray *titleArray2 = [NSMutableArray arrayWithObjects:@"我要加盟",@"关注官方公众号",@"给美丽衣橱打5分", nil];
        static NSString *cellID = @"cell4";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            
            UILabel *label2= [[UILabel alloc] initWithFrame:CGRectMake(VIEWWIDTH-100, 0, 60, 44)];
            label2.tag = 2;
            [cell addSubview:label2];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        UILabel *label2 =(UILabel*) [cell viewWithTag:2];
        if (indexPath.row == 1) {
            label2.text = @"开始赚钱";
            label2.textAlignment = NSTextAlignmentRight;
            label2.font = [UIFont systemFontOfSize:13];
            label2.textColor = RGB(91, 91, 91);
        }
        
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = [titleArray2 objectAtIndex:indexPath.row];
        NSString *imageString2 = [NSString stringWithFormat:@"join-%ld",indexPath.row+1];
        cell.imageView.image = [UIImage imageNamed:imageString2];
        return cell;
        
    }
    static NSString *cellID = @"cell5";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    cell.imageView.image = [UIImage imageNamed:@"Shezhi"];
    cell.textLabel.text = @"设置";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}
//点击登录注册页面
-(void)loginBtnClick{
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    loginVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:loginVC animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0 && indexPath.row == 0) {
        return 100;
    }
    return 44;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
