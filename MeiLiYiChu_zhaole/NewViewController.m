//
//  NewViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-13.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"注册";
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
    
    UITextField *mimaNumber = [[UITextField alloc]initWithFrame:CGRectMake(40, 130, [UIScreen mainScreen].bounds.size.width-150, 30)];
    mimaNumber.borderStyle = UITextBorderStyleNone;
    mimaNumber.placeholder = @" 密码";
    [self.view addSubview:mimaNumber];
    UIImageView *miamImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 130, 25, 30)];
    miamImageView.image = [UIImage imageNamed:@"密码"];
    [self.view addSubview:miamImageView];
    
    UILabel *yanzhengLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 170, [UIScreen mainScreen].bounds.size.width-130, 30)];
    yanzhengLabel.backgroundColor = [[UIColor alloc]initWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
    yanzhengLabel.layer.borderWidth = 0.5;
    [self.view addSubview:yanzhengLabel];
    UITextField *YanzhengNumber = [[UITextField alloc]initWithFrame:CGRectMake(40, 170, [UIScreen mainScreen].bounds.size.width-130, 30)];
    YanzhengNumber.borderStyle = UITextBorderStyleNone;
    YanzhengNumber.placeholder = @" 验证码";
    [self.view addSubview:YanzhengNumber];
    UIImageView *YanzhengImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 170, 25, 30)];
    YanzhengImageView.image = [UIImage imageNamed:@"验证码"];
    [self.view addSubview:YanzhengImageView];
    UIButton *yanzhnegBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    yanzhnegBtn.frame = CGRectMake(200, 170, 110, 30);
    [yanzhnegBtn setBackgroundImage:[UIImage imageNamed:@"获取验证码"] forState:UIControlStateNormal];
    [yanzhnegBtn addTarget:self action:@selector(yanzhengBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yanzhnegBtn];
    
    UIButton *ZhuceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ZhuceBtn.frame = CGRectMake(10, 300, [UIScreen mainScreen].bounds.size.width-20, 35);
    [ZhuceBtn setBackgroundImage:[UIImage imageNamed:@"注册"] forState:UIControlStateNormal];
    [ZhuceBtn addTarget:self action:@selector(ZhuceBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ZhuceBtn];
    
    UIButton *YinsiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    YinsiBtn.frame = CGRectMake(230, 270, 80, 30);
    [YinsiBtn setTitle:@"隐私条款>>" forState:UIControlStateNormal];
    [YinsiBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    YinsiBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [YinsiBtn addTarget:self action:@selector(YinsiBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:YinsiBtn];
    
    
}

-(void)ZhuceBtn{
    NSLog(@"确认注册");
}
-(void)YinsiBtn{
    NSLog(@"点击阅读隐私条款");
}
-(void)yanzhengBtn{
    NSLog(@"获取验证码");
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
