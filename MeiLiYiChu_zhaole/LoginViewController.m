//
//  LoginViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-13.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "LoginViewController.h"
#import "NewViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"登录";
    //添加一个返回按钮
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(40, 20, 40, 40)];
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
    
    UILabel *phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 90, [UIScreen mainScreen].bounds.size.width-20, 30)];
    phoneLabel.backgroundColor = [[UIColor alloc]initWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
    phoneLabel.layer.borderWidth = 0.15;
    
    [self.view addSubview:phoneLabel];
    
    UITextField *phoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(40, 90, [UIScreen mainScreen].bounds.size.width-20, 30)];
    phoneNumber.borderStyle = UITextBorderStyleNone;
    phoneNumber.placeholder = @" 手机号";
    [self.view addSubview:phoneNumber];
    UIImageView *phoneImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 90, 25, 30)];
    phoneImageView.image = [UIImage imageNamed:@"手机号"];
    [self.view addSubview:phoneImageView];
    
    UILabel *mimaLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 130, [UIScreen mainScreen].bounds.size.width-20, 30)];
    mimaLabel.backgroundColor = [[UIColor alloc]initWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
    mimaLabel.layer.borderWidth = 0.5;
    [self.view addSubview:mimaLabel];
    
    UIButton *mimaBtn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*0.7, 130, 80, 30)];
    [mimaBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [mimaBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    mimaBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [mimaBtn addTarget:self action:@selector(mimaBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mimaBtn];
    
    UITextField *mimaNumber = [[UITextField alloc]initWithFrame:CGRectMake(40, 130, [UIScreen mainScreen].bounds.size.width-150, 30)];
    mimaNumber.borderStyle = UITextBorderStyleNone;
    mimaNumber.placeholder = @" 密码";
    [self.view addSubview:mimaNumber];
    UIImageView *miamImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 130, 25, 30)];
    miamImageView.image = [UIImage imageNamed:@"密码"];
    [self.view addSubview:miamImageView];
    
    UIButton *dengBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dengBtn.frame = CGRectMake(10, 200, [UIScreen mainScreen].bounds.size.width-20, 35);
    [dengBtn setBackgroundImage:[UIImage imageNamed:@"登录图片"] forState:UIControlStateNormal];
    [dengBtn addTarget:self action:@selector(dengBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dengBtn];
    
    UIButton *zhuCeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    zhuCeBtn.frame = CGRectMake(10, 250, [UIScreen mainScreen].bounds.size.width-20, 35);
    [zhuCeBtn setBackgroundImage:[UIImage imageNamed:@"新用户注册"] forState:UIControlStateNormal];
    [zhuCeBtn addTarget:self action:@selector(zhuCeBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zhuCeBtn];
    
    UILabel *QitaLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 350, [UIScreen mainScreen].bounds.size.width-20, 35)];
    QitaLabel.text = @"第三方登录";
    QitaLabel.textColor = [UIColor grayColor];
    QitaLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:QitaLabel];
    
    UIButton *weixinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    weixinBtn.frame = CGRectMake(130, 390, 40, 40);
    [weixinBtn setBackgroundImage:[UIImage imageNamed:@"微信"] forState:UIControlStateNormal];
    [weixinBtn addTarget:self action:@selector(weixinBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weixinBtn];
}
-(void)weixinBtn{
    NSLog(@"去微信登录");
}
-(void)zhuCeBtn{
    NewViewController *newVC = [[NewViewController alloc]init];
    [self.navigationController pushViewController:newVC animated:YES];
}
-(void)dengBtn{
    NSLog(@"点击登录");
}
-(void)mimaBtn{
    NSLog(@"忘记密码?");
    
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
