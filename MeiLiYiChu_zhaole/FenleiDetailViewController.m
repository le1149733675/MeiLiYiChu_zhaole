//
//  FenleiDetailViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-13.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "FenleiDetailViewController.h"
#import "HttpManager.h"
#import "RexiaoCollectionViewCell.h"
#import "FenRexiao.h"
#import "UIImageView+WebCache.h"
#import "CusBtn.h"
#import "DetailBaobeiViewController.h"
@interface FenleiDetailViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSInteger _selectedIndex;
    UIView *_bottomView;
    UICollectionView *_collectionView;
    
}
@end

@implementation FenleiDetailViewController

//为了在点击宝贝详情之后显示自定义的返回按钮
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    self.view.userInteractionEnabled = YES;
    
    UIView *view1 = [[UIView alloc]init];
    view1.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
    view1.backgroundColor = [UIColor whiteColor];
    view1.layer.borderWidth = 0.5;
    view1.userInteractionEnabled = YES;
    [self.view addSubview:view1];
    //添加一个返回按钮
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(130, 35, 100, 20)];
    label.text = self.title;
    [view1 addSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"返回"];
    [view1 addSubview:imageView];
    
    
    //返回按钮加一个手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(LeftBtn)];
    [imageView addGestureRecognizer:tap];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //集合视图
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 2.5;
    layout.minimumLineSpacing = 5;
    layout.itemSize = CGSizeMake(150, 220);
    layout.sectionInset = UIEdgeInsetsMake(120, 5, 20, 5);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    _collectionView.delegate =self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    //    collectionView.alwaysBounceVertical = YES;
    [self.view addSubview:_collectionView];
    [_collectionView registerNib:[UINib nibWithNibName:@"RexiaoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    
    
   
    
    _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 60)];
    _bottomView.layer.borderWidth = 0.25;
    _bottomView.backgroundColor = [UIColor whiteColor];
    _bottomView.userInteractionEnabled = YES;
    [self.view addSubview:_bottomView];

    
    
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"新品",@"热销",@"价格", nil];
    NSArray *imageArray = [NSArray arrayWithObjects:@"Xinpin1",@"Rexiao1",@"Jiage1", nil];
    for (int i = 0; i<titleArray.count; i++) {
        CusBtn *button = [CusBtn buttonWithType:UIButtonTypeCustom];
        button.Btnimage = [[UIImageView alloc]init];
        button.Btnimage.frame = CGRectMake(80 + i*(60+30), 15, 20, 30);
        button.Btnimage.image = [UIImage imageNamed:imageArray[i]];
        button.frame = CGRectMake(30 + i*(60+30), 20, 60, 20);
        [button setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        button.tag = i+1;
        [_bottomView addSubview:button];
        [_bottomView addSubview:button.Btnimage];
        if (i == 0) {
            button.selected = YES;
            _selectedIndex = button.tag;
            button.Btnimage.image = [UIImage imageNamed:@"Xinpin2"];
            
//******判断是不是自己点击的时候,不能直接在上面声明一个全局的bool变量.否则,非常容易出现bug而崩溃,而是应该在传入此页面的时候将其yes或no设置好******
            
            if (_isSearch == YES) {
                [HttpManager getXinpinRequestWithCid:self.cid WithSort:@"0" CompletionBlock:^(NSMutableArray *array) {
                    
                self.JiageArray = array;
                [_collectionView reloadData];
            }];
            }else{
                [HttpManager getSearchRquestWithSearchString:self.searchString WithSort:@"0" CompletionBlock:^(NSMutableArray *array) {
                    self.searchArray = array;
                    [_collectionView reloadData];
                }];
            }
        }
        [_collectionView reloadData];
    }
    
}



-(void)buttonClick:(CusBtn *)button{
    
    CusBtn *lastBtn = (CusBtn *)[_bottomView viewWithTag:_selectedIndex];
    lastBtn.selected = NO;
    lastBtn.Btnimage.image = [UIImage imageNamed:@"Xinpin1"];
    if (lastBtn.tag == 3) {
        lastBtn.Btnimage.image = [UIImage imageNamed:@"Jiage1"];
    }
    button.selected = YES;
    button.Btnimage.image = [UIImage imageNamed:@"Xinpin2"];
    
    //分别点击各个按钮
    //点击按钮三
    static int i = 0;
    i++;
    if (button.tag == 3) {
        //价格高-->低
        if (i%2 == 0) {
            button.Btnimage.image = [UIImage imageNamed:@"Jiage2"];
            if (_isSearch == YES) {
                [HttpManager getXinpinRequestWithCid:self.cid WithSort:@"6" CompletionBlock:^(NSMutableArray *array) {
                self.JiageArray = array;
                [_collectionView reloadData];
            }];
            }else{
                [HttpManager getSearchRquestWithSearchString:self.searchString WithSort:@"6" CompletionBlock:^(NSMutableArray *array) {
                    self.searchArray = array;
                    [_collectionView reloadData];
                }];
            }
        
        }
        //价格低-->高
        else{
            button.Btnimage.image = [UIImage imageNamed:@"Jiage3"];
            if (_isSearch == YES) {
                [HttpManager getXinpinRequestWithCid:self.cid WithSort:@"5" CompletionBlock:^(NSMutableArray *array) {
                self.JiageArray = array;
                [_collectionView reloadData];
            }];
            }else{
                [HttpManager getSearchRquestWithSearchString:self.searchString WithSort:@"5" CompletionBlock:^(NSMutableArray *array) {
                    self.searchArray = array;
                    [_collectionView reloadData];
                }];
            }
        }
        //点击热销
    }else if (button.tag == 2){
        if (_isSearch == YES) {
            [HttpManager getXinpinRequestWithCid:self.cid WithSort:@"1" CompletionBlock:^(NSMutableArray *array) {
            self.JiageArray = array;
            [_collectionView reloadData];
        }];
        }else{
            [HttpManager getSearchRquestWithSearchString:self.searchString WithSort:@"1" CompletionBlock:^(NSMutableArray *array) {
                self.searchArray = array;
                [_collectionView reloadData];
            }];
        }
    
        
        
    }//点击新品
    else{
        if (_isSearch == YES) {
            [HttpManager getXinpinRequestWithCid:self.cid WithSort:@"0" CompletionBlock:^(NSMutableArray *array) {
            self.JiageArray = array;
            [_collectionView reloadData];
        }];
        }else{
            [HttpManager getSearchRquestWithSearchString:self.searchString WithSort:@"0" CompletionBlock:^(NSMutableArray *array) {
                self.searchArray = array;
                [_collectionView reloadData];
            }];
        }
    
    }
    
    _selectedIndex = button.tag;

}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (_isSearch == YES) {
            return self.JiageArray.count;
    }else{
        return self.searchArray.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_isSearch == YES) {
        RexiaoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    FenRexiao *rexiao = [self.JiageArray objectAtIndex:indexPath.row];
    [cell.Remen_bigImage sd_setImageWithURL:[NSURL URLWithString:rexiao.taobao_pic_url]];
    [cell.Rexiao_smallImage sd_setImageWithURL:[NSURL URLWithString:rexiao.tag_url]];
    cell.Rexiao_title.text = rexiao.taobao_title;
    cell.Rexiao_money.text = rexiao.taobao_promo_price;
    
    return cell;

    }else{
        RexiaoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        FenRexiao *rexiao = [self.searchArray objectAtIndex:indexPath.row];
        [cell.Remen_bigImage sd_setImageWithURL:[NSURL URLWithString:rexiao.taobao_pic_url]];
        [cell.Rexiao_smallImage sd_setImageWithURL:[NSURL URLWithString:rexiao.tag_url]];
        cell.Rexiao_title.text = rexiao.taobao_title;
        cell.Rexiao_money.text = rexiao.taobao_promo_price;
        
        return cell;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailBaobeiViewController *baobeiVC = [[DetailBaobeiViewController alloc]init];
    baobeiVC.hidesBottomBarWhenPushed = YES;
    NSMutableArray *array = [NSMutableArray array];
    for (FenRexiao *rexiao in self.JiageArray) {
        [array addObject:rexiao.taobao_num_iid];
    }
    baobeiVC.idArray = array;
    baobeiVC.item = indexPath.item;
    [self.navigationController pushViewController:baobeiVC animated:YES];
    
    
}
//返回按钮的手势
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
