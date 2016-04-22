//
//  DetailBaobeiViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-13.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "DetailBaobeiViewController.h"
#import "DetailCollectionViewCell.h"
#import "SecVcViewController.h"
#import "HttpManager.h"
#import "PuBuLiu.h"
#import "BaoBeiDetail.h"
#import "GoumaiModel.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
@interface DetailBaobeiViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *_collection;
    //底部的View
    UIView *_bottomView;
    UIView *_topView;
    
    //记录当前所处的索引位置
    NSInteger _selctIndex;
    UIImageView *_imageView;
    
    NSInteger _chimaSelectIndex;
    NSInteger _yanseSelectIndex;
    //尺码按钮
    UIButton *btn;
    //颜色按钮
    UIButton *yanBtn;
    //添加
    NSInteger add;
    
    //筛选后的尺寸和颜色数组
    NSMutableArray *_newSizeArray;
    NSMutableArray *_newYanseArray;
   
}
@end

@implementation DetailBaobeiViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
//    topView.backgroundColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar addSubview:topView];
    
    
    
    self.navigationItem.title = @"宝贝详情";
//    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtn)];
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(40, 20, 40, 40)];
    customView.userInteractionEnabled = YES;
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageView1.userInteractionEnabled = YES;
    imageView1.image = [UIImage imageNamed:@"返回"];
    [customView addSubview:imageView1];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithCustomView:customView];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIView *customView2 = [[UIView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*0.7, 20, 40, 40)];
    customView2.userInteractionEnabled = YES;
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageView2.userInteractionEnabled = YES;
    imageView2.image = [UIImage imageNamed:@"购物车"];
    imageView2.tag = 1;
    [customView2 addSubview:imageView2];
    UIBarButtonItem *rightBtn1 = [[UIBarButtonItem alloc]initWithCustomView:customView2];
    
    UIView *customView3 = [[UIView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*0.85, 20, 40, 40)];
    customView3.userInteractionEnabled = YES;
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageView3.userInteractionEnabled = YES;
    imageView3.image = [UIImage imageNamed:@"分享宝贝"];
    imageView3.tag = 2;
    [customView3 addSubview:imageView3];
    UIBarButtonItem *rightBtn2 = [[UIBarButtonItem alloc]initWithCustomView:customView3];
    self.navigationItem.rightBarButtonItems = @[rightBtn1,rightBtn2];
    
    //点击导航条左侧按钮的手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backBtn)];
    [imageView1 addGestureRecognizer:tap];
    //导航条右侧的手势
    UITapGestureRecognizer *rightTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightBtn1)];
    [imageView2 addGestureRecognizer:rightTap1];
    UITapGestureRecognizer *rightTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightBtn2)];
    [imageView3 addGestureRecognizer:rightTap2];
    
    //下部的标签分页符
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-49, [UIScreen mainScreen].bounds.size.width, 49)];
    [self.view addSubview:bottomView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.25)];
    label.backgroundColor = [UIColor grayColor];
    [bottomView addSubview:label];
    
    UIButton *JMBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 20)];
    [JMBtn setBackgroundImage:[UIImage imageNamed:@"我要加盟"] forState:UIControlStateNormal];
    [JMBtn addTarget:self action:@selector(JMBtn) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:JMBtn];
    
    UIButton *LianxiBtn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/4+15, 10, 40, 40)];
    [LianxiBtn setBackgroundImage:[UIImage imageNamed:@"联系卖家"] forState:UIControlStateNormal];
    [LianxiBtn addTarget:self action:@selector(LianxiBtn) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:LianxiBtn];
    
    UIButton *GWCbtn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2+10, 10, 40, 40)];
    [GWCbtn setBackgroundImage:[UIImage imageNamed:@"加入购物车"] forState:UIControlStateNormal];
    [GWCbtn addTarget:self action:@selector(GWCbtn) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:GWCbtn];
    
    UIButton *LjgmBtn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*0.75+10, 13,60, 35)];
    [LjgmBtn setBackgroundImage:[UIImage imageNamed:@"立即购买"] forState:UIControlStateNormal];
    [LjgmBtn addTarget:self action:@selector(LjgmBtn) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:LjgmBtn];

#pragma mark 创建一个大的集合视图
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = self.view.frame.size;
    //允许横向滑动
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    //上左下右
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    
    _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64-49) collectionViewLayout:layout];
    _collection.delegate = self;
    _collection.dataSource =self;
    [self.view addSubview:_collection];
    _collection.backgroundColor = [UIColor whiteColor];
    _collection.pagingEnabled = YES;
    [_collection registerNib:[UINib nibWithNibName:@"DetailCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    _collection.userInteractionEnabled = YES;
    

    //此处写数目,一共有上一个页面id数目个tableview
    for (int i = 0; i<self.idArray.count; i++) {
    
    SecVcViewController *secVC = [SecVcViewController new];
    [self addChildViewController:secVC];
        
   }
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.item inSection:0];
    [_collection scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    SecVcViewController *secVC = self.childViewControllers[self.item];
//    NSLog(@"secVC.Taobaonum_id %@",secVC.Taobaonum_id);
    
    //首次进去的时候,将所点击的那个淘宝id数组传递给下一个页面,根据index这个索引进行请求数据
    secVC.TaoIdarray = self.idArray;
    secVC.index = self.item;
    _selctIndex = self.item;
    add = 1;
    
}


//减速停止了时执行，手触摸时执行执行
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
    
    if (scrollView == _collection) {
        NSInteger a = scrollView.contentOffset.x/self.view.frame.size.width;
        SecVcViewController *secVc = self.childViewControllers[a];
        //停止滑动的时候,再次将淘宝id数组传递给下一页面以便获取最新页面的数据.利用index进行请求
        secVc.TaoIdarray = self.idArray;
        secVc.index = a;
        //*******_selctIndex记录当前最新一页的索引,在点击购买的时候,用来刷新数据******
        _selctIndex = a;
    }

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //移除所有子视图
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //添加新的
    SecVcViewController *secVC = [self.childViewControllers objectAtIndex:indexPath.row];
    secVC.view.frame = self.view.frame;
//    NSLog(@" secVC.Taobaonum_id %@",secVC.Taobaonum_id);
    [cell.contentView addSubview:secVC.view];
    add = 1;
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.childViewControllers.count;
}




-(void)LjgmBtn{
    NSLog(@"立即购买");
}
-(void)GWCbtn{
    
    [HttpManager getBaobeiDetailRequestWithNumid:self.idArray[_selctIndex] CompletionBlock:^(NSMutableArray *array) {
        
        self.numberArray = array;
        BaoBeiDetail *baobei = [self.numberArray objectAtIndex:0];
        GoumaiModel *goumai = [baobei.JRGWCarray objectAtIndex:0];
        
    
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
    
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _topView.backgroundColor = [UIColor clearColor];
    
    UIButton *topBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
    [topBtn addTarget:self action:@selector(topBtm) forControlEvents:UIControlEventTouchUpInside];
    topBtn.backgroundColor = [UIColor grayColor];
    topBtn.alpha = 0.8;
    [self.view addSubview:_topView];
    [_topView addSubview:topBtn];
    //在屏幕底部创建一个iamgeView
    _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2+100)];
    _bottomView.backgroundColor = [UIColor clearColor];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2+100)];
    _imageView.backgroundColor = [UIColor whiteColor];
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_bottomView];
    [_bottomView addSubview:_imageView];
    
        //开始加载各种数据
        UIImageView *baobeiImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        baobeiImage.backgroundColor = [UIColor redColor];
        [baobeiImage sd_setImageWithURL:[NSURL URLWithString:goumai.taobao_pic_url]];
        [_imageView addSubview:baobeiImage];
    
        UILabel *Titlelabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, 200, 20)];
        Titlelabel.text = goumai.taobao_title;
        [_imageView addSubview:Titlelabel];
    
        UILabel *moneylabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 40,80, 20)];
        moneylabel.text = goumai.taobao_price;
        moneylabel.textColor = [UIColor redColor];
        [_imageView addSubview:moneylabel];
    
        UILabel *shuliangLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 70, 40, 20)];
        shuliangLabel.text = @"库存:";
        shuliangLabel.textColor = [UIColor grayColor];
        [_imageView addSubview:shuliangLabel];
    
        //
        
        
        
        UIButton *removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        removeBtn.frame = CGRectMake(270, 10, 40, 40);
        [removeBtn setBackgroundImage:[UIImage imageNamed:@"docomment_ic_colse"] forState:UIControlStateNormal];
        [removeBtn addTarget:self action:@selector(topBtm) forControlEvents:UIControlEventTouchUpInside];
        [_imageView addSubview:removeBtn];
    
        UIButton *jianBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        jianBtn.frame = CGRectMake(190, 50, 20, 20);
        [jianBtn setBackgroundImage:[UIImage imageNamed:@"减去按钮2"] forState:UIControlStateNormal];
        [jianBtn addTarget:self action:@selector(jianBtn) forControlEvents:UIControlEventTouchUpInside];
        [_imageView addSubview:jianBtn];
    
        UILabel *labelnumber = [[UILabel alloc]initWithFrame:CGRectMake(210, 50, 30, 20)];
        labelnumber.text=@"1";
        labelnumber.textAlignment = NSTextAlignmentCenter;
        labelnumber.backgroundColor = [UIColor redColor];
        [_imageView addSubview:labelnumber];
    
        UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        addBtn.frame = CGRectMake(240, 50, 20, 20);
        [addBtn setBackgroundImage:[UIImage imageNamed:@"添加按钮2"] forState:UIControlStateNormal];
        [addBtn addTarget:self action:@selector(addBtn) forControlEvents:UIControlEventTouchUpInside];
        [_imageView addSubview:addBtn];
    
        //
        UILabel *Chimalabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, 40, 20)];
        Chimalabel.text = @"尺码";
        [_imageView addSubview:Chimalabel];
        
        
        //for循环创建button
        NSMutableArray *sizeArray = [NSMutableArray array];
        for (GoumaiModel *gou in baobei.JRGWCarray) {
            [sizeArray addObject:gou.size];
            //*****去掉数组中重复的数据*****
            _newSizeArray = [NSMutableArray array];
            for (int a = 0; a< sizeArray.count; a++) {
                if ([_newSizeArray containsObject:[sizeArray objectAtIndex:a]]==NO) {
                    [_newSizeArray addObject:[sizeArray objectAtIndex:a]];
          
        for (int i = 0; i<_newSizeArray.count; i++) {
           btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i+1;

            btn.frame = CGRectMake(5+(i%6)*(40+10),150+(i/6) *20, 40, 10);
            //设置button字体大小
            //btn.titleLabel.adjustsFontSizeToFitWidth = YES;
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            btn.layer.borderWidth = 0.5;
            [btn setTitle:_newSizeArray[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(sizeBtn:) forControlEvents:UIControlEventTouchUpInside];
            [_imageView addSubview:btn];
        }
                }
            }
        }
    
        //
        UILabel *yanseLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, 40, 20)];
        yanseLabel.text = @"颜色";
        [_imageView addSubview:yanseLabel];
        //for循环创建button
        NSMutableArray *yanseArray = [NSMutableArray array];
        for (GoumaiModel *goumai in baobei.JRGWCarray) {
            [yanseArray addObject:goumai.style];
            _newYanseArray = [NSMutableArray array];
            for (int i = 0; i<yanseArray.count; i++) {
                if ([_newYanseArray containsObject:[yanseArray objectAtIndex:i]]==NO) {
                    [_newYanseArray addObject:[yanseArray objectAtIndex:i]];
                   for (int i = 0; i<_newYanseArray.count; i++ ) {
                      yanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                       yanBtn.frame = CGRectMake(5+i*(50+10), 230, 50, 10);
                       yanBtn.titleLabel.font = [UIFont systemFontOfSize:12];
                       [yanBtn setTitle:_newYanseArray[i] forState:UIControlStateNormal];
                       yanBtn.tag = i +1;
                       yanBtn.layer.borderWidth = 0.5;
                       [yanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                       [yanBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
                       [yanBtn addTarget:self action:@selector(yanseBtn:) forControlEvents:UIControlEventTouchUpInside];
                       //_yanseSelectIndex = yanBtn.tag;
                       [_imageView addSubview:yanBtn];
                   }
                }
            }
        }
    
        
        
        UIButton *quedingBtn = [UIButton buttonWithType:    UIButtonTypeCustom];
        quedingBtn.frame = CGRectMake(120 , 300, 80, 40);
        [quedingBtn setBackgroundImage:[UIImage imageNamed:@"yuike_nav_button_ok"] forState:UIControlStateNormal];
        [quedingBtn addTarget:self action:@selector(quedingBtn) forControlEvents:UIControlEventTouchUpInside];
        [_imageView addSubview:quedingBtn];


        //先做一个UI动画
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        _bottomView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height/2-50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64);
        [UIView commitAnimations];
    
    }];
}
-(void)quedingBtn{
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [_topView removeFromSuperview];
    [_bottomView removeFromSuperview];
    
    BaoBeiDetail *baobei = [self.numberArray objectAtIndex:0];
    
    self.size = [_newSizeArray objectAtIndex:_chimaSelectIndex];
    self.yanse = [_newYanseArray objectAtIndex:_yanseSelectIndex];
    for (GoumaiModel *goumai in baobei.JRGWCarray) {
        //来判断记录点击的颜色和尺寸
        if ([self.size isEqualToString:goumai.size] && [self.yanse isEqualToString:goumai.style]&& btn.selected == YES&&yanBtn.selected == YES) {
            
    
    [HttpManager getAddGouwucheRequestWithSkuid:goumai.sku_id Withnumber:[NSString stringWithFormat:@"%ld",(long)add] CompletionBlock:^(NSMutableArray *array) {
        
    }];
        }
    }
    
}

-(void)yanseBtn:(UIButton *)button{
    
//    _yanseSelectIndex = button.tag;
//    UIButton *lastBtn = (UIButton *)[_imageView viewWithTag:_yanseSelectIndex];
//    
//    lastBtn.selected = NO;
//    
//    [lastBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    lastBtn.layer.borderColor = [[UIColor grayColor]CGColor];
//    
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
//    button.layer.borderColor = [[UIColor redColor]CGColor];
//    button.selected = YES;
//    _yanseSelectIndex = button.tag;
   
    
    if (button != yanBtn) {
        yanBtn.selected = NO;
        [yanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        yanBtn.layer.borderColor = [[UIColor grayColor]CGColor];
        yanBtn = button;
        [yanBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        yanBtn.layer.borderColor = [[UIColor redColor]CGColor];
    }else{
        [yanBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        yanBtn.layer.borderColor = [[UIColor redColor]CGColor];
    }
    yanBtn.selected = YES;
    _yanseSelectIndex = yanBtn.tag-1;
    
    BaoBeiDetail *baobei = [self.numberArray objectAtIndex:0];
    GoumaiModel *goumai = [baobei.JRGWCarray objectAtIndex:_yanseSelectIndex];
    if (btn.selected == YES &&yanBtn.selected == YES) {
        UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 40, 20)];
        numberLabel.textColor = [UIColor blackColor];
        numberLabel.text = goumai.quantity;
        [_imageView addSubview:numberLabel];
    }
}
-(void)sizeBtn:(UIButton *)button{
    //不能用index记录被点击的那个按钮,因为按钮在for循环创建,index在for循环中始终指向最后一个按钮(默认点击第一个按钮的时候可以记录)
    
    if (button != btn) {
    btn.selected = NO;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.borderColor = [[UIColor grayColor]CGColor];
    btn = button;
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    btn.layer.borderColor = [[UIColor redColor]CGColor];
    }else{
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        btn.layer.borderColor = [[UIColor redColor]CGColor];
    }
    btn.selected = YES;
    _chimaSelectIndex = btn.tag - 1;
    
    BaoBeiDetail *baobei = [self.numberArray objectAtIndex:0];
    GoumaiModel *goumai = [baobei.JRGWCarray objectAtIndex:_chimaSelectIndex];
    if (btn.selected == YES &&yanBtn.selected == YES) {
        UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 40, 20)];
        numberLabel.textColor = [UIColor blackColor];
        numberLabel.text = goumai.quantity;
        [_imageView addSubview:numberLabel];
    }
}

-(void)addBtn{
    BaoBeiDetail *baobei = [self.numberArray objectAtIndex:0];
    GoumaiModel *goumai = [baobei.JRGWCarray objectAtIndex:0];
    add++;
    if (add > [goumai.quantity intValue]) {
        add = [goumai.quantity intValue];
    }
    UILabel *labelnumber = [[UILabel alloc]initWithFrame:CGRectMake(210, 50, 30, 20)];
    labelnumber.text=[NSString stringWithFormat:@"%ld",(long)add];
    labelnumber.textAlignment = NSTextAlignmentCenter;
    labelnumber.backgroundColor = [UIColor redColor];
    [_imageView addSubview:labelnumber];
}

-(void)jianBtn{
    add--;
    if (add == 0) {
        add = 1;
    }
    UILabel *labelnumber = [[UILabel alloc]initWithFrame:CGRectMake(210, 50, 30, 20)];
    labelnumber.text=[NSString stringWithFormat:@"%ld",(long)add];
    labelnumber.textAlignment = NSTextAlignmentCenter;
    labelnumber.backgroundColor = [UIColor redColor];
    [_imageView addSubview:labelnumber];
}
-(void)topBtm{
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [_topView removeFromSuperview];
    [_bottomView removeFromSuperview];
}

-(void)LianxiBtn{
    NSLog(@"联系卖家");
}

-(void)JMBtn{
    NSLog(@"我要加盟");
}
-(void)rightBtn1{
    NSLog(@"点击加入购物车");
    
}
-(void)rightBtn2{
    NSLog(@"点击分享");
}

-(void)backBtn{
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
