//
//  FenleiViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "FenleiViewController.h"
#import "HttpManager.h"
#import "Fenlei.h"
#import "FenleiCollectionViewCell.h"
#import "FenleiDetail.h"
#import "UIImageView+WebCache.h"
#import "FenleiDetailViewController.h"
#import "SearchViewController.h"

@interface FenleiViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UIView *_LeftView;
    UIView *_smallView;
    NSInteger _titleBtn;
    UICollectionView *_collectionView;
    UIImageView *_imageView;
}
@end

@implementation FenleiViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 64);
//    [self.navigationController.navigationBar addSubview:view];
    [self.view addSubview:view];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"搜索宝贝"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(5, 5, [UIScreen mainScreen].bounds.size.width-10, 40);
    [btn addTarget:self action:@selector(Searchbtn) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    _LeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 80, [UIScreen mainScreen].bounds.size.height-49)];
    _LeftView.userInteractionEnabled = YES;
    _LeftView.backgroundColor = RGB(245, 245, 245);
    [self.view addSubview:_LeftView];
    
    //集合视图
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    layout.itemSize = CGSizeMake(60, 100);
    layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(80, 64, [UIScreen mainScreen].bounds.size.width-80, [UIScreen mainScreen].bounds.size.height-64-49) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"FenleiCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    
    [HttpManager getFenleifyMessageCompletionBlock:^(NSMutableArray *classfyArray) {
        self.FenLeiArr = classfyArray;

        for (int i = 0; i<self.FenLeiArr.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            Fenlei *fen = [self.FenLeiArr objectAtIndex:i];
            button.frame = CGRectMake(20, 20+i*(40+20), 40, 20);
            [button setTitle:fen.category_title forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            button.tag = i+1;
            [_LeftView addSubview:button];
            if (i == 0) {
                button.selected = YES;
                _selectedIndex = button.tag;
            }
            [_collectionView reloadData];
        }
        
    }];
    
    _smallView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, 3, 40)];
    _smallView.backgroundColor = [UIColor redColor];
    [_LeftView addSubview:_smallView];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(70, 10, 13, 40)];
    _imageView.image = [UIImage imageNamed:@"ZHIDING"];
    _imageView.backgroundColor = [UIColor whiteColor];
    [_LeftView addSubview:_imageView];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    Fenlei *fen = [self.FenLeiArr objectAtIndex:_titleBtn];
    return fen.categoryArray.count;
}

-(void)buttonClick:(UIButton *)button{
    UIButton *lastBtn = (UIButton *)[_LeftView viewWithTag:_selectedIndex];
    lastBtn.selected = NO;
    button.selected = YES;
    _selectedIndex = button.tag;
    
    //
    _titleBtn = button.tag-1;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    _smallView.frame = CGRectMake(0, 5+(button.tag-1)*(40+20), 3, 40);
    _imageView.frame = CGRectMake(70, (button.tag -1)*(20+40), 13, 40);
    [UIView commitAnimations];
    
    
    
    [_collectionView reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FenleiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    Fenlei *fen = [self.FenLeiArr objectAtIndex:_titleBtn];
    FenleiDetail *detail = [fen.categoryArray objectAtIndex:indexPath.row];
    [cell.Fenlei_image sd_setImageWithURL:[NSURL URLWithString:detail.pic_url]];
    cell.Fenlei_image.layer.borderWidth = 0.25;
//    cell.Fenlei_image.layer.borderColor = (__bridge CGColorRef)(/Users/a123/Desktop/MeiLiYiChu_zhaole/MeiLiYiChu_zhaole.xcodeproj[UIColor blackColor]);
    
    cell.Fenlei_label.text = detail.taobao_title;
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FenleiDetailViewController *VC = [[FenleiDetailViewController alloc]init];
    Fenlei *fen = [self.FenLeiArr objectAtIndex:_titleBtn];
    FenleiDetail *fenlei = [fen.categoryArray objectAtIndex:indexPath.row];
    VC.cid = fenlei.taobao_cid;
//    NSLog(@"VC.cid  %@",VC.cid);
    VC.isSearch = YES;
    VC.title = fenlei.taobao_title;
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
    
}

-(void)Searchbtn{
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    searchVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVC animated:YES];
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
