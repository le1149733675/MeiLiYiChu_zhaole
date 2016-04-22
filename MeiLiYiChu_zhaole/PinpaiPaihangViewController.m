//
//  PinpaiPaihangViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-17.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "PinpaiPaihangViewController.h"
#import "HttpManager.h"
#import "PinpaiMoel.h"
#import "NvzhuangModel.h"
#import "PinpaiCollectionViewCell.h"
#import "HeaderCRView.h"
#import "UIImageView+WebCache.h"
#import "DianPuViewController.h"
@interface PinpaiPaihangViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collection;
}
@end

@implementation PinpaiPaihangViewController

-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;//与下一级页面的方法一致
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationItem.title = @"品牌详情";
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(40, 20, 40, 40)];
    customView.userInteractionEnabled = YES;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"返回"];
    [customView addSubview:imageView];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithCustomView:customView];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(LeftBtn)];
    [imageView addGestureRecognizer:tap];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [HttpManager getPinpaiPaihangRequestWithCompletionBlock:^(NSMutableArray *array) {
        self.PinpaiArray = array;
        
        [_collection reloadData];
        
    }];
    
    //创建集合视图
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //分割线设置太小,有时会显示不出来
    layout.minimumInteritemSpacing = 0.5;
    layout.minimumLineSpacing = 0.5;
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/4.05, 40);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(1, 0, 1, 0);
    layout.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 20);
    layout.footerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 0.5);
    
    _collection = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    _collection.delegate = self;
    _collection.dataSource = self;
    _collection.backgroundColor = [[UIColor alloc]initWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
    [self.view addSubview:_collection];
    [_collection registerNib:[UINib nibWithNibName:@"PinpaiCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];

    //自定义的话，header子类要继承自 UICollectionReusableView。
    [_collection registerClass:[HeaderCRView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}

//自定义集合视图的表头  参考文章:http://www.jianshu.com/p/c70cf501f75a
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"header";
    //从缓存中获取 Headercell
    HeaderCRView *cell = (HeaderCRView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    PinpaiMoel *pinpai = [self.PinpaiArray objectAtIndex:indexPath.section];
    cell.label.text = pinpai.group_name;
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 20);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PinpaiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    PinpaiMoel *pinpai = [self.PinpaiArray objectAtIndex:indexPath.section];
    NvzhuangModel *nvzhaung = [pinpai.NvYifuArray objectAtIndex:indexPath.row];
    [cell.pinpai_image sd_setImageWithURL:[NSURL URLWithString:nvzhaung.logo_url]];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    PinpaiMoel *pinpai = [self.PinpaiArray objectAtIndex:section];
    if (section == 0) {
        return pinpai.NvYifuArray.count;
    }else if(section == 1){
        return pinpai.NvYifuArray.count;
    }else if (section == 2){
        return pinpai.NvYifuArray.count;
    }else if (section == 3){
        return pinpai.NvYifuArray.count;
    }else{
        return pinpai.NvYifuArray.count;
    }
}
-(NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}

//此处调到店铺详情,需要传递id,与之前的不同,这个id传递到下一页的时候不要进行"="分割,加载的时候需要判断
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"店铺被点击了");
    DianPuViewController *dianVC = [[DianPuViewController alloc]init];
    PinpaiMoel *model = [self.PinpaiArray objectAtIndex:indexPath.section];
    NvzhuangModel *nvzhuang = [model.NvYifuArray objectAtIndex:indexPath.row];
    //把整形数字转成字符串
    NSString *string = [NSString stringWithFormat:@"%ld",(long)nvzhuang.dianId];
    dianVC.lingId = string;
    dianVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dianVC animated:YES];
    
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
