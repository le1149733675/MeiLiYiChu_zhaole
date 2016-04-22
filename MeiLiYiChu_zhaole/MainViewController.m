//
//  MainViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "MainViewController.h"
#import "Scollermodel.h"
#import "CustomBtn.h"
#import "HttpManager.h"
#import "UIImageView+WebCache.h"
#import "LingYuan.h"
#import "Left.h"
#import "Right.h"
#import "PuBuLiu.h"
#import "HeaderView.h"
#import "HeaderViewCell.h"
#import "LingTableViewCell.h"
#import "LingYuanTableViewCell.h"
#import "ChunTableViewCell.h"
#import "UIButton+WebCache.h"
#import "ReMenTableViewCell.h"
#import "BiMaiTableViewCell.h"
#import "CollectionViewCell.h"
#import "SVPullToRefresh.h"
#import "DetailBaobeiViewController.h"
#import "SearchViewController.h"
#import "DianPuViewController.h"
#import "DetailBaobeiViewController.h"
#import "PinpaiPaihangViewController.h"

@interface MainViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pagecountrol;
    UITableView *_tableView;
    //返回顶部的按钮
    UIButton *goTopBtn;
    //记录点击的按钮的tag值
    NSInteger _selelectIndex;
}
@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated{
    
    //*****写导航条的时候,此页面方法与跳转的下一个页面的方法应该保持一致*****
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor = RGB(251, 55, 117);
    self.navigationController.navigationBar.alpha = 1.0;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"美丽衣橱";
    //自定义左边按钮
    CustomBtn *custom = [[CustomBtn alloc] init];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithCustomView:custom];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    //系统提供的方法右边按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemSearch target:self action:@selector(searchBtnClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //创建表
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, VIEWWIDTH, VIEWHEIGHT-64-49) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.userInteractionEnabled = YES;
    [self.view addSubview:_tableView];
    
    
    //表格主动触发刷新
    [_tableView triggerPullToRefresh];
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,VIEWWIDTH, VIEWHEIGHT *0.3)];
//    _tableView.tableHeaderView = _bannerScrollView;
    _pagecountrol= [[UIPageControl alloc] initWithFrame:CGRectMake(VIEWWIDTH/2-40, VIEWHEIGHT*0.25, 80, 30)];
    
    //表头的特性,可以直接等于想等于的那个控件,而不用重新给它赋予高度或者其他位置,因为它可以自适应高度
    _tableView.tableHeaderView = _scrollView;

    //轮播请求出来的数据
    [HttpManager  getBannerMessageCompletionBlock:^(NSMutableArray *Array) {
        self.ScrollArr = Array;
        
        _scrollView.contentSize = CGSizeMake(VIEWWIDTH*self.ScrollArr.count, VIEWHEIGHT *0.3);
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        
        
        _pagecountrol.numberOfPages = self.ScrollArr.count;
        _pagecountrol.pageIndicatorTintColor = [UIColor whiteColor];
        _pagecountrol.currentPageIndicatorTintColor = [UIColor redColor];
        [_tableView addSubview:_pagecountrol];
        
        
        for (int i = 0; i<self.ScrollArr.count; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(VIEWWIDTH*i, 0, VIEWWIDTH, VIEWHEIGHT*0.3)];
            Scollermodel *scller = [self.ScrollArr objectAtIndex:i];
            [imageView sd_setImageWithURL:[NSURL URLWithString:scller.pic_url]];
            [_scrollView addSubview:imageView];
        }
    } ];
    //定时器
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
    //零元数组数据
    [HttpManager getshowMessageCompletionBlock:^(NSMutableArray *showArray) {
        self.LingArr = showArray;
        [_tableView reloadData];
    }];
    
    //下部的集合视图数据
    [HttpManager getWaterMeaasgeCompletionBlock:^(NSMutableArray *waterArray) {
        self.PuBuLiuArr = waterArray;
        [_tableView reloadData];
    }];
    
    

    //显示网络刷新的
    MainViewController *otherVC = self;
    [_tableView addPullToRefreshWithActionHandler:^{
        
        [otherVC refresh];
    }];
    
    [_tableView addInfiniteScrollingWithActionHandler:^
     {
         [otherVC loadMore];
     }];

}

//下拉刷新
-(void)refresh{
    NSString *sinceID = nil;
    
    // 第一次进来
    if (self.PuBuLiuArr == nil ||self.LingArr == nil || self.ScrollArr == nil)
    {
        sinceID = @"0";
    }
    else
    {
        [_tableView.pullToRefreshView stopAnimating];

    }
}
//上拉加载
-(void)loadMore{
    
}
//点击返回顶部
-(void)goTopBtnClick{
    
    //表的偏移量
    _tableView.contentOffset = CGPointMake(0, -64);
    //此方法只能到达表的第一个cell
//    [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition: UITableViewScrollPositionTop animated:YES];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 2 ) {
        LingYuan *ling = [self.LingArr objectAtIndex:1];
        static NSString *headerID = @"header";
        HeaderViewCell *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
        if ( !headerView) {
            headerView = [[HeaderViewCell alloc] initWithReuseIdentifier:headerID];
            headerView.leftlabel.text = ling.title;
            headerView.rightlabel.text = ling.sub_title;
            headerView.rightlabel.textColor = [UIColor grayColor];
            headerView.rightlabel.alpha = 0.5;
            
        }
        return headerView;
    }else if (section == 3 ) {
        LingYuan *ling = [self.LingArr objectAtIndex:2];
        static NSString *headerID = @"header1";
        HeaderViewCell *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
        if ( !headerView) {
            headerView = [[HeaderViewCell alloc] initWithReuseIdentifier:headerID];
            headerView.leftlabel.text = ling.title;
            headerView.rightlabel.text = ling.sub_title;
            headerView.rightlabel.textColor = [UIColor grayColor];
            headerView.rightlabel.alpha = 0.5;
        }
        return headerView;
    }else if (section == 4){
        LingYuan *ling = [self.LingArr objectAtIndex:3];
        static NSString *headerID = @"header2";
        HeaderViewCell *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
        if ( !headerView) {
            headerView = [[HeaderViewCell alloc] initWithReuseIdentifier:headerID];
            headerView.leftlabel.text = ling.title;
            headerView.rightlabel.text = ling.sub_title;
            headerView.rightlabel.textColor = [UIColor grayColor];
            headerView.rightlabel.alpha = 0.5;
        }
        return headerView;
        
    }else if (section == 5)
    {
        static NSString *headerID = @"header3";
        HeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
        if (!headerView) {
            headerView = [[HeaderView alloc] initWithReuseIdentifier:headerID];
            headerView.lastlabel.text = @"热门商品";
        }
        
        return headerView;
    }
    static NSString *headerID = @"header4";
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    if ( !headerView) {
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:headerID];
        
        
    }
    return headerView;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *cellID = @"mainCell";
        LingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell= [[LingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.userInteractionEnabled = YES;
        }
        //******找到放在cell上的按钮,自定义方法的时候必须用viewwithtag来寻找******
        UIButton *button = (UIButton *)[cell viewWithTag:1];
        [button addTarget:self action:@selector(PinpaiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        //这样得到的是for循环之后的最后一个button
        //[cell.mainButton addTarget:self action:@selector(PinpaiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }else if (indexPath.section == 1)
    {
        static NSString *cellID = @"showCell";
        LingYuanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        LingYuan *ling = [self.LingArr objectAtIndex:0];
        if (cell == nil) {
            cell = [[LingYuanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        [cell.showImageView sd_setImageWithURL:[NSURL URLWithString:ling.pic_url]];
        return cell;
    }else if(indexPath.section == 2 )
    {
        static NSString *cellID = @"shopCell";
        ChunTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        LingYuan *ling = [self.LingArr objectAtIndex:indexPath.section-1];
        Left *left = [ling.leftArray objectAtIndex:0];
        Right *right1 = [ling.rightArray objectAtIndex:0];
        
        if (cell == nil) {
            cell = [[ChunTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        [cell.leftBigBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:left.taobao_pic_url] forState:UIControlStateNormal];
        cell.leftBigLabel.text = left.taobao_title;
        cell.leftgrayLabel.text = left.taobao_price;
        cell.leftredlabel.text = left.taobao_promo_price;
        
        [cell.rightTopBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:right1.taobao_pic_url] forState:UIControlStateNormal];
        cell.rightTopLabel.text = right1.taobao_title;
        cell.rightTopgraylabel.text = right1.taobao_price;
        cell.rightTopredlabel.text = right1.taobao_promo_price;
        
        Right *right2 = [ling.rightArray objectAtIndex:1];
        [cell.rightBottomBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:right2.taobao_pic_url] forState:UIControlStateNormal];
        cell.rightBottomLabel.text = right2.taobao_title;
        cell.rightBottomgraylabel.text = right2.taobao_price;
        cell.rightBottomredlabel.text = right2.taobao_promo_price;
        [cell.leftBigBtn addTarget:self action:@selector(ShopBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.rightTopBtn addTarget:self action:@selector(ShopBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.rightBottomBtn addTarget:self action:@selector(ShopBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.leftBigBtn.tag = 1;
        cell.rightTopBtn.tag = 2;
        cell.rightBottomBtn.tag = 3;
        
        return cell;
    }else if (indexPath.section == 3)
    {
        static NSString *cellID = @"hotCell";
        ReMenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        LingYuan *ling = [self.LingArr objectAtIndex:2];
        Left *left1 = [ling.leftArray objectAtIndex:0];
        Left *left2 = [ling.leftArray objectAtIndex:1];
        
        Right *right1 = [ling.rightArray objectAtIndex:0];
        Right *right2 = [ling.rightArray objectAtIndex:1];
        if (cell == nil) {
            cell = [[ReMenTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.userInteractionEnabled = YES;
            goTopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            goTopBtn.frame = CGRectMake(VIEWWIDTH-60, VIEWHEIGHT-64-49, 60, 60);
            [goTopBtn setBackgroundImage:[UIImage imageNamed:@"go-top-btn"] forState:UIControlStateNormal];
            [goTopBtn addTarget:self action:@selector(goTopBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:goTopBtn];

            
        }
        cell.backgroundColor = [UIColor lightGrayColor];
        [cell.btn1 sd_setBackgroundImageWithURL:[NSURL URLWithString:left1.pic_url] forState:UIControlStateNormal];
        [cell.btn2 sd_setBackgroundImageWithURL:[NSURL URLWithString:right1.pic_url] forState:UIControlStateNormal];
        [cell.btn3 sd_setBackgroundImageWithURL:[NSURL URLWithString:left2.pic_url] forState:UIControlStateNormal];
        [cell.btn4 sd_setBackgroundImageWithURL:[NSURL URLWithString:right2.pic_url] forState:UIControlStateNormal];
        [cell.btn1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn4 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.btn1.tag = 1;
        cell.btn3.tag = 2;
        cell.btn2.tag = 3;
        cell.btn4.tag = 4;
        return cell;
    }else if (indexPath.section == 4)
    {
        static NSString *cellID = @"buyCell";
        BiMaiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        LingYuan *ling = [self.LingArr objectAtIndex:3];
        Left *left = [ling.leftArray objectAtIndex:0];
        
        Right *right1 = [ling.rightArray objectAtIndex:0];
        Right *right2 = [ling.rightArray objectAtIndex:1];
        
        if (cell == nil) {
            cell = [[BiMaiTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID
                    ];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.userInteractionEnabled = YES;

        }
        cell.backgroundColor = [UIColor lightGrayColor];
        [cell.rightBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:left.pic_url] forState:UIControlStateNormal];
        [cell.leftBtn1 sd_setBackgroundImageWithURL:[NSURL URLWithString:right1.pic_url] forState:UIControlStateNormal];
        [cell.leftBtn2 sd_setBackgroundImageWithURL:[NSURL URLWithString:right2.pic_url] forState:UIControlStateNormal];
        [cell.rightBtn addTarget:self action:@selector(BiMaiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.leftBtn1 addTarget:self action:@selector(BiMaiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.leftBtn2 addTarget:self action:@selector(BiMaiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.rightBtn.tag = 1;
        cell.leftBtn1.tag = 2;
        cell.leftBtn2.tag = 3;
        return cell;
        
    }
    static NSString *cellID = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.userInteractionEnabled = YES;
            cell.backgroundColor = RGB(235, 235, 241);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
     //***********在cell里创建其他的控件的时候,如collectionView,如果涉及到重用,那么一定要把这个控件加到if判断即重用池中.否则,内存会逐步飙升***********
            
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumInteritemSpacing = 5;
            layout.minimumLineSpacing = 5;
            layout.itemSize = CGSizeMake(150, 220);
            layout.sectionInset = UIEdgeInsetsMake(0, 2.5, 2.5, 5);
            
            UICollectionView *  collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH, 220*self.PuBuLiuArr.count/2+100) collectionViewLayout:layout];
            collectionView.backgroundColor = [UIColor clearColor];
            collectionView.delegate = self;
            collectionView.dataSource = self;
            
            [collectionView reloadData];
            [collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
            [cell addSubview:collectionView];
            
        }
        
        return cell;
}
//************品牌排行**************
-(void)PinpaiBtnClick:(UIButton *)button{
    PinpaiPaihangViewController *pinpaiVC = [[PinpaiPaihangViewController alloc]init];
    
    pinpaiVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:pinpaiVC animated:YES];
}


//******************春装上新*************
-(void)ShopBtnClick:(UIButton *)button{
    LingYuan *ling = [self.LingArr objectAtIndex:1];
    if (button.tag == 1) {
        Left *left = [ling.leftArray objectAtIndex:button.tag - 1];
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:left.taobao_num_iid];
        DetailBaobeiViewController *baobeiVC = [[DetailBaobeiViewController alloc]init];
        baobeiVC.idArray = array;
        baobeiVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:baobeiVC animated:YES];
    }else if(button.tag == 2){
        Right *right = [ling.rightArray objectAtIndex:button.tag - 2];
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:right.taobao_num_iid];
        DetailBaobeiViewController *baobeiVC = [[DetailBaobeiViewController alloc]init];
        baobeiVC.idArray = array;
        baobeiVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:baobeiVC animated:YES];
    }else if(button.tag == 3){
        Right *right = [ling.rightArray objectAtIndex:button.tag - 2];
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:right.taobao_num_iid];
        DetailBaobeiViewController *baobeiVC = [[DetailBaobeiViewController alloc]init];
        baobeiVC.idArray = array;
        baobeiVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:baobeiVC animated:YES];
    }
    
}
//***************// 热门市场 *******************
-(void)buttonClick:(UIButton*)button{

    LingYuan *ling = [self.LingArr objectAtIndex:2];
    if (button.tag == 1 || button.tag == 2) {
        Left *left = [ling.leftArray objectAtIndex:button.tag-1];
        NSString *string = left.action;
        
//      得到零元数组action的"="两侧的数据,根据index取后面的id
        NSArray *array = [string componentsSeparatedByString:@"="];
        NSString * actionString = [array objectAtIndex:1];
        DianPuViewController *DianVC = [[DianPuViewController alloc] init];
        DianVC.hidesBottomBarWhenPushed = YES;
        DianVC.lingId = actionString;
//        NSLog(@" 左边 DianVC.lingId %@",DianVC.lingId);
        [self.navigationController pushViewController:DianVC animated:YES];
    }else {
        Right *right = [ling.rightArray objectAtIndex:button.tag-3];
        NSString *string = right.action;
        NSArray *array = [string componentsSeparatedByString:@"="];
        NSString * actionString = [array objectAtIndex:1];
        DianPuViewController  *shopVC = [[DianPuViewController alloc] init];
        shopVC.hidesBottomBarWhenPushed = YES;
        shopVC.lingId = actionString;
//        NSLog(@" 右边 DianVC.lingId %@",shopVC.lingId);
        [self.navigationController pushViewController:shopVC animated:YES];
    }

}

//****************必买清单**************
-(void)BiMaiBtnClick:(UIButton *)button{
    
    LingYuan *ling = [self.LingArr objectAtIndex:3];
    if (button.tag == 1) {
        Left *left = [ling.leftArray objectAtIndex:button.tag - 1 ];
        NSString *string = left.action;
//        NSLog(@"left.action %@",left.action);
        DianPuViewController *dianVC = [[DianPuViewController alloc]init];
        NSArray *array = [string componentsSeparatedByString:@"="];
        NSString * actionString = [array objectAtIndex:1];
        dianVC.hidesBottomBarWhenPushed = YES;
        dianVC.lingId = actionString;
        [self.navigationController pushViewController:dianVC animated:YES];
    }else{
        Right *right = [ling.rightArray objectAtIndex:button.tag - 2];
        NSString *string = right.action;
        DianPuViewController *DianVC = [[DianPuViewController alloc]init];
 //       NSLog(@"right.action %@",right.action);
        NSArray *array = [string componentsSeparatedByString:@"="];
        NSString * actionString = [array objectAtIndex:1];
        DianVC.hidesBottomBarWhenPushed = YES;
        DianVC.lingId = actionString;
        [self.navigationController pushViewController:DianVC animated:YES];
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        DianPuViewController *dianVC = [[DianPuViewController alloc]init];
        LingYuan *ling = [self.LingArr objectAtIndex:indexPath.row];
//        得到零元数组action的"="两侧的数据,根据index取后面的id
        NSArray *array = [ling.action componentsSeparatedByString:@"="];
        NSString * actionString = [array objectAtIndex:1];
        dianVC.lingId = actionString;
        dianVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dianVC animated:YES];
    }
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    PuBuLiu *ppp = [self.PuBuLiuArr objectAtIndex:indexPath.item];
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = RGB(235, 235, 241);
    
    [cell.collection_image sd_setImageWithURL:[NSURL URLWithString:ppp.taobao_pic_url]];
    [cell.collection_tagImage sd_setImageWithURL:[NSURL URLWithString:ppp.tag_url]];
    cell.collection_title.text = ppp.taobao_title;
    cell.collection_Monry.text = ppp.taobao_price;
    
    return cell;
    
}

//点击collectionView的时候
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailBaobeiViewController *detailVC = [[DetailBaobeiViewController alloc]init];
    detailVC.hidesBottomBarWhenPushed = YES;
    
//    PuBuLiu *ppp = [self.PuBuLiuArr objectAtIndex:indexPath.row];
    
    //遍历下部总的数组,得到所有淘宝id数据,用一个数组装起来 传递到下个页面
    NSMutableArray *array = [NSMutableArray array];
    for (PuBuLiu*pu in self.PuBuLiuArr) {
        [array addObject: pu.taobao_num_iid];
    }
    detailVC.idArray = array;
    
//    detailVC.num_id = ppp.taobao_num_iid;
    detailVC.item = indexPath.item;
    [self.navigationController pushViewController:detailVC animated:YES];

}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewFlowLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.PuBuLiuArr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }else if (indexPath.section == 1 || indexPath.section == 3)
    {
        return 150;
    }else if (indexPath.section == 2 || indexPath.section == 4)
    {
        return 200;
    }
    
    return 225*self.PuBuLiuArr.count/2;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if (section == 0 || section == 1 ) {
        return 0.1;
    }
    return 50;
};
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
    
}


-(void)onTimer{
    static int a = 1;
    _pagecountrol.currentPage += a;
    [_scrollView setContentOffset:CGPointMake(_pagecountrol.currentPage*VIEWWIDTH, 0) animated:YES];
    if (_pagecountrol.currentPage== self.ScrollArr.count-1|| _pagecountrol.currentPage == 0) {
        a = -a;
    }

}

-(void)searchBtnClick{
    SearchViewController *searVC = [[SearchViewController alloc]init];
    searVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searVC animated:YES];
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
