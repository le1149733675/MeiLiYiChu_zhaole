//
//  DianPuViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "DianPuViewController.h"
#import "CustDBtn.h"
#import "DianPuCollectionViewCell.h"
#import "HttpManager.h"
#import "DianpuModel.h"
#import "UIImageView+WebCache.h"
#import "DetailBaobeiViewController.h"
@interface DianPuViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    UITableView *_tableView;
    NSArray *_Btnarray;
    NSArray *_imageArray;
    NSInteger _selectIndex;
    UICollectionView *_collectionView;
}
@end

@implementation DianPuViewController

-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.userInteractionEnabled = YES;
    [self.view addSubview:_tableView];
    
//得到零元数组action的"="两侧的数据,根据index取后面的id,此处不需要再分割了,在上一页面已经分割好了
//    self.lingTureID = [self.lingId componentsSeparatedByString:@"="];
//    NSLog(@"self.lingTureID[1]   %@",self.lingTureID[1]);
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(20, 40, 40, 40)];
    customView.userInteractionEnabled = YES;
    [self.view addSubview:customView];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"返回"];
    [customView addSubview:imageView];
    //返回按钮加一个手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(LeftBtn)];
    [customView addGestureRecognizer:tap];
    //灰色的分享
    UIImageView *shareimage = [[UIImageView alloc]initWithFrame:CGRectMake(260, 40, 40, 40)];
    shareimage.userInteractionEnabled = YES;
    shareimage.image = [UIImage imageNamed:@"灰色的分享"];
    [self.view addSubview:shareimage];
    UITapGestureRecognizer *shareTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ShareTap)];
    [shareimage addGestureRecognizer:shareTap];
    
#pragma mark 按钮
    _Btnarray = [NSArray arrayWithObjects:@"新品",@"热销",@"价格", nil];
    _imageArray = [NSArray arrayWithObjects:@"Xinpin1",@"Rexiao1",@"Jiage1", nil];
    
       

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        static NSString *reuseID = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if (!cell) {
            cell = [[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
            cell.userInteractionEnabled = YES;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //******for循环写在重用里面,否则,内存会狂飙******
        for (int i = 0; i<_Btnarray.count; i++) {
            CustDBtn *button = [CustDBtn buttonWithType:UIButtonTypeCustom];
            button.BtnView = [[UIImageView alloc]init];
            button.BtnView.frame = CGRectMake(80 + i*(60+30), 15, 20, 30);
            button.BtnView.image = [UIImage imageNamed:_imageArray[i]];
            button.frame = CGRectMake(30 + i*(60+30), 20, 60, 20);
            [button setTitle:[_Btnarray objectAtIndex:i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            button.tag = i+1;
            [cell addSubview:button];
            [cell addSubview:button.BtnView];
            if (i == 0) {
                button.selected = YES;
                _selectIndex = button.tag;
                button.BtnView.image = [UIImage imageNamed:@"Xinpin2"];
                
                    [HttpManager getDianpuRequestWithSearchBrandid:self.lingId WithSort:@"0" CompletionBlock:^(NSMutableArray *array) {
                    self.DianArray = array;
                    [_collectionView reloadData];
                    [_tableView reloadData];
                }];
                
                }
            }

        }
        return cell;
    }
    
    static NSString *reuseID2 = @"cell2";
//    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:reuseID2];
    
    //此处如果将单元格重用,则数据无法显示
    
//    if (!cell2) {
    
    
    UITableViewCell  *cell2 = [[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID2];
        cell2.userInteractionEnabled = YES;
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        //集合视图
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 2.5;
        layout.minimumLineSpacing = 5;
        layout.itemSize = CGSizeMake(150, 220);
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 20, 5);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 220*self.DianArray.count/2) collectionViewLayout:layout];
    
     //***控制控件是否能滚动,此处若不设置,则不能上下滑动***
        _collectionView.scrollEnabled = NO;
    
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.userInteractionEnabled = YES;
        [cell2 addSubview:_collectionView];
        [_collectionView registerNib:[UINib nibWithNibName:@"DianPuCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
//    }
    
    return cell2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.DianArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DianPuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    DianpuModel *dian = [self.DianArray objectAtIndex:indexPath.row];
    [cell.collection_image sd_setImageWithURL:[NSURL URLWithString:dian.taobao_pic_url]];
    cell.collection_title.text = dian.taobao_title;
    cell.collection_money.text = dian.taobao_selling_price;
    
    return cell;
}

//当宝贝被点击的时候
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailBaobeiViewController *baobeiVC = [[DetailBaobeiViewController alloc]init];
    baobeiVC.hidesBottomBarWhenPushed = YES;
    NSMutableArray *array = [NSMutableArray array];
    for (DianpuModel *dian  in self.DianArray) {
        [array addObject:dian.taobao_num_iid];
    }
    baobeiVC.idArray = array;
    baobeiVC.item = indexPath.item;
    [self.navigationController pushViewController:baobeiVC animated:YES];
    
}


-(void)buttonClick:(CustDBtn *)button {
    
    //***********************************************
    CustDBtn *lastBtn = (CustDBtn *)[self.view viewWithTag:_selectIndex];
    
    lastBtn.selected = NO;
    lastBtn.BtnView.image = [UIImage imageNamed:@"Xinpin1"];
    if (lastBtn.tag == 3) {
        lastBtn.BtnView.image = [UIImage imageNamed:@"Jiage1"];
    }
    button.selected = YES;
    button.BtnView.image = [UIImage imageNamed:@"Xinpin2"];
    static int i = 0;
    i++;
    //价格
    if (button.tag == 3) {
        if (i%2 == 0) {
            button.BtnView.image = [UIImage imageNamed:@"Jiage2"];
            
            
        }else{
            button.BtnView.image = [UIImage imageNamed:@"Jiage3"];
            
            
        }
        //热销
    }else if (button.tag == 2){
        
        //新品
    }else{
        
    }
    _selectIndex = button.tag;
    
    
}

    
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        DianpuModel *dian = [self.DianArray objectAtIndex:section];
        static NSString *reuseID = @"header";
        UITableViewCell *header = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if (!header) {
            header = [[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
            header.userInteractionEnabled = YES;
        }
        UIImageView *topView = [[UIImageView alloc]initWithFrame:CGRectMake(-20, -200, [UIScreen mainScreen].bounds.size.width+10, 350)];
        topView.userInteractionEnabled = YES;
        topView.image = [UIImage imageNamed:@"topView"];
        header.imageView.image = [UIImage imageNamed:@"topView"];
        header.imageView.userInteractionEnabled = YES;
        [header.imageView addSubview:topView];
        
        UIImageView *headerView = [[UIImageView alloc]initWithFrame:CGRectMake(120, 220, 80, 80)];
        headerView.layer.cornerRadius = 40;
        headerView.clipsToBounds = YES;
        [headerView sd_setImageWithURL:[NSURL URLWithString:dian.logo_url]];
        [topView addSubview:headerView];
        
        UILabel *Dianlael = [[UILabel alloc]initWithFrame:CGRectMake(115, 310, 95, 20)];
        Dianlael.text = dian.title;
        [topView addSubview:Dianlael];
        
        UIButton *LianxiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        LianxiBtn.frame = CGRectMake(30, 330, 100, 20);
        [LianxiBtn setTitle:@"联系卖家" forState:UIControlStateNormal];
        [LianxiBtn addTarget:self action:@selector(LianxiBtn) forControlEvents:UIControlEventTouchUpInside];
        [topView addSubview:LianxiBtn];
#warning 此处收藏按钮不能被点击//换手势
        UIButton *ShoucangBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        ShoucangBtn.frame = CGRectMake(210, 330, 100, 20);
        [ShoucangBtn setBackgroundImage:[UIImage imageNamed:@"收藏"] forState:UIControlStateNormal];
        [ShoucangBtn addTarget:self action:@selector(ShouBtn) forControlEvents:UIControlEventTouchUpInside];
        [topView addSubview:ShoucangBtn];
        
        return header;
    }
    static NSString *reuseID = @"header2";
    UITableViewCell *header = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!header) {
        header = [[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        header.userInteractionEnabled = NO;
    }
    
    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }
    return 225*self.DianArray.count/2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 150;
    }else{
        return 2;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(void)ShouBtn{
    NSLog(@"点击收藏");
}
-(void)LianxiBtn{
    NSLog(@"联系卖家");
}
-(void)ShareTap{
    NSLog(@"点击分享");
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
