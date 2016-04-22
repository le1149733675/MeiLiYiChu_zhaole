//
//  SearchViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-14.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "SearchViewController.h"
#import "FenleiDetailViewController.h"
@interface SearchViewController ()
{
    UILabel *_phoneLabel;
    UITextField *_phoneNumber;
}
@end

@implementation SearchViewController

-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationItem.title = @"搜索";
    
    self.view.userInteractionEnabled = YES;
    //添加一个返回按钮
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
    customView.userInteractionEnabled = YES;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"返回"];
    [customView addSubview:imageView];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithCustomView:customView];
    self.navigationItem.leftBarButtonItem = leftBtn;
    //返回按钮加一个手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(LeftBtn)];
    [customView addGestureRecognizer:tap];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //搜索框
    _phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, [UIScreen mainScreen].bounds.size.width-80, 30)];
    _phoneLabel.backgroundColor = [[UIColor alloc]initWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
    _phoneLabel.layer.borderWidth = 0.25;
    _phoneLabel.layer.borderColor = [[UIColor grayColor]CGColor];
    [self.view addSubview:_phoneLabel];
    
    _phoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(40, 70, [UIScreen mainScreen].bounds.size.width-80, 30)];
    _phoneNumber.borderStyle = UITextBorderStyleNone;
    _phoneNumber.placeholder = @" 搜索你喜欢的宝贝";
    [self.view addSubview:_phoneNumber];
    UIImageView *phoneImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 70, 25, 30)];
    phoneImageView.image = [UIImage imageNamed:@"Search-btn"];
    [self.view addSubview:phoneImageView];
    
    //搜索按钮
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-65, 70, 60, 30);
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtn:) forControlEvents:UIControlEventTouchUpInside];
    searchBtn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:searchBtn];
    
}
-(void)searchBtn:(UIButton *)searchBtn{
    
    if ([_phoneNumber.text isEqualToString:@""]) {
        NSLog(@"搜索内容不能为空");
    }else{
    FenleiDetailViewController *detailVC = [[FenleiDetailViewController alloc]init];
    detailVC.searchString = _phoneNumber.text;
    detailVC.isSearch = NO;
    [self.navigationController pushViewController:detailVC animated:YES];
    }
    

}


-(void)LeftBtn{
    [self.navigationController popViewControllerAnimated:YES];
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
