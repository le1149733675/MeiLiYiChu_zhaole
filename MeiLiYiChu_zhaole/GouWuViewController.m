//
//  GouWuViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "GouWuViewController.h"
#import "HttpManager.h"
#import "GWCmodel.h"
#import "GouDetail.h"
#import "UIImageView+WebCache.h"
#import "ShoppingCarCell.h"
#import "ShoppingHeaderView.h"
#import "HttpManager.h"

@interface GouWuViewController ()<UITableViewDataSource,UITableViewDelegate,ShoppingCarCellDelegate,ShoppingHeaderViewDelegate,UIAlertViewDelegate>

{
    UITableView *_tableView;
    
    //总价
    UILabel *_totalPriceLabel;
    //节约的总价
    UILabel *_saveMoney;
}
//全选按钮
@property(nonatomic,retain)UICellButton *allSelectButton;

@property(nonatomic,retain)NSMutableArray *listArray;
@property(nonatomic,assign)CGFloat totalPrice;

//
@property(nonatomic,assign)CGFloat savePrice;

@end

@implementation GouWuViewController

-(void)viewWillAppear:(BOOL)animated{
    [HttpManager getGouWuCheRequestWithcountCompletionBlock:^(NSMutableArray *array) {
        //返回的区数目
        self.GouArray = array;
        
        [_tableView reloadData];
        
    }];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"购物车";
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 20, [UIScreen mainScreen].bounds.size.width-20, [UIScreen mainScreen].bounds.size.height-49) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    
    //小数组返回区的cell个数
    
    UIView *bottomview = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-49*2, 320, 49)];
    bottomview.backgroundColor = [[UIColor alloc]initWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
    bottomview.layer.borderWidth = 0.25;
    [self.view addSubview:bottomview];
    
    _allSelectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _allSelectButton.frame = CGRectMake(5, 10, 30, 30);
    [_allSelectButton setBackgroundImage:[UIImage imageNamed:@"待选择按钮"] forState:UIControlStateNormal];
    [_allSelectButton setBackgroundImage:[UIImage imageNamed:@"选择按钮"] forState:UIControlStateSelected];
    [_allSelectButton addTarget:self action:@selector(chonseBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bottomview addSubview:_allSelectButton];
    UILabel *Alllabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 15, 40, 20)];
    Alllabel.text = @"全选";
    Alllabel.textColor = [UIColor grayColor];
    [bottomview addSubview:Alllabel];
    
    UILabel *totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 5, 60, 20)];
    totalLabel.text = @"合计:";
    totalLabel.textColor = [UIColor redColor];
    [bottomview addSubview:totalLabel];
    
    _totalPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 8, 75, 20)];
    _totalPriceLabel.text = @"￥0.00";
    _totalPriceLabel.font = [UIFont systemFontOfSize:15];
    [bottomview addSubview:_totalPriceLabel];
    
    UILabel *saveLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 25, 60, 20)];
    saveLabel.text = @"节省:";
    saveLabel.textColor = [UIColor grayColor];
    [bottomview addSubview:saveLabel];
    
    _saveMoney = [[UILabel alloc]initWithFrame:CGRectMake(130, 28, 75, 20)];
    _saveMoney.text = @"¥0.00";
    _saveMoney.font = [UIFont systemFontOfSize:14];
    _saveMoney.textColor = [UIColor grayColor];
    [bottomview addSubview:_saveMoney];
    
    
    UIButton *jiesuanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    jiesuanBtn.frame = CGRectMake(230, 10, 80, 30);
    [jiesuanBtn setBackgroundImage:[UIImage imageNamed:@"去结算"] forState:UIControlStateNormal];
    [jiesuanBtn addTarget:self action:@selector(jiesuanBtn:) forControlEvents:UIControlEventTouchUpInside];
    [bottomview addSubview:jiesuanBtn];
    
    
}

-(void)jiesuanBtn:(UIButton *)jiesuanBtn{
    NSLog(@"去结算");
}

#pragma mark------全选按钮
-(void)chonseBtn:(UICellButton *)chonseBtn{
    
    chonseBtn.selected = !chonseBtn.selected;
    CGFloat allAmount = 0.00f;
    NSInteger allQuantity = 0;
    CGFloat allSave = 0.00f;
    for (GWCmodel *gouwu in self.GouArray) {
        CGFloat sectionAmount = 0.00f;
        NSInteger sectionQuantity = 0;
        CGFloat sectionSave = 0.00f;
      //  NSArray *array = gouwu.GWCarray;
        for (GouDetail *gou in gouwu.GWCarray) {
            NSString *isSale = [NSString stringWithFormat:@"%lu",gou.isSale];
            if ([isSale isEqualToString:@"1"]) {
               gou.isselected = chonseBtn.selected?YES:NO;
                if (chonseBtn.selected) {
                    CGFloat realPrice = [gou.taobao_selling_price floatValue];
                    NSInteger quantity = [gou.number integerValue];
                    CGFloat savePrice = [gou.taobao_price floatValue];
                    sectionAmount += realPrice * quantity;
                    sectionQuantity += quantity;
                    sectionSave += (savePrice-realPrice)*quantity;
                
                }else{
                    sectionQuantity = 0;
                    sectionAmount = 0.00f;
                    sectionSave = 0.00f;
                }
            }
            
        }
        
        //后补
        gouwu.price = [NSString stringWithFormat:@"%.2f",sectionAmount];
        gouwu.is_Seleted = chonseBtn.selected?YES:NO;
        gouwu.quantity = [NSString stringWithFormat:@"%ld",sectionQuantity];
        gouwu.save = [NSString stringWithFormat:@"%.2f",sectionSave];
        
        
        allAmount += sectionAmount;
        allQuantity += sectionQuantity;
        allSave += sectionSave;
    }
    _totalPriceLabel.text = [NSString stringWithFormat:@"¥%.2f",allAmount];
    _totalPrice = allAmount;
    _saveMoney.text = [NSString stringWithFormat:@"¥%.2f",allSave];
    _savePrice = allSave;
    [_tableView reloadData];
}

#pragma mark ---- shoppingHeaderViewDelegate
-(void)carSelectButtonClicked:(GWCmodel *)item WithIndexPathSection:(NSInteger)section WithIndexPathRow:(NSInteger)row{
    
    GWCmodel *gou = [self.GouArray objectAtIndex:section];
    BOOL sectionSelected = !gou.is_Seleted;
//    NSMutableArray * array = [gou.GWCarray objectAtIndex:row];
    CGFloat sectionAmount = 0.00f;
    NSInteger sectionQuantity = 0;
    CGFloat sectionSave = 0.00f;
    for (GouDetail *detail in gou.GWCarray) {
//        NSString *isSale = [NSString stringWithFormat:@"%ld",(long)detail.isSale];
//        if ([isSale isEqualToString:@"1"]) {
            detail.isselected = sectionSelected?YES:NO;
            if (sectionSelected) {
                CGFloat realPrice = [detail.taobao_selling_price floatValue];
                NSInteger quantity = [detail.number intValue];
                
                CGFloat savePrice = [detail.taobao_price integerValue];
                
                sectionAmount += realPrice * quantity;
                sectionQuantity += quantity;
                sectionSave += (savePrice - realPrice)*quantity;
                
            }else{
                sectionAmount = 0.00f;
                sectionQuantity = 0;
                sectionSave = 0.00f;
            }
        }
//    }
    CGFloat price = [gou.price floatValue];
    CGFloat currentSave = [gou.save floatValue];
    
    //后补上的
    gou.price = [NSString stringWithFormat:@"%.2f",sectionAmount];
    gou.quantity = [NSString stringWithFormat:@"%ld",sectionQuantity];
    gou.is_Seleted = sectionSelected;
    gou.save = [NSString stringWithFormat:@"%.2f",sectionSave];
    
    _totalPrice += sectionAmount - price;
    _totalPriceLabel.text = [NSString stringWithFormat:@"¥:%.2f",_totalPrice];
    _savePrice += sectionSave -currentSave;
    _saveMoney.text = [NSString stringWithFormat:@"¥:%.2f",_savePrice];
    
    if (sectionSelected) {
        BOOL allSelct = YES;
        for (GWCmodel*gou in self.GouArray) {
            BOOL sectSelected = gou.is_Seleted;
            allSelct = allSelct && sectSelected;
        }
        _allSelectButton.selected = allSelct;
    }else{
        _allSelectButton.selected = NO;
    }
    [_tableView reloadData];
}

#pragma mark------ShoppingCarCellDelegate
-(void)carSelectButtonClicked:(GouDetail *)item WithSectionIndexPath:(NSInteger)section WithIndexPath:(NSInteger)row{
    GWCmodel *gou = [self.GouArray objectAtIndex:section];
    GouDetail *detail = [gou.GWCarray objectAtIndex:row];
    BOOL cellSelected = !detail.isselected;
    detail.isselected =cellSelected;
    BOOL sectionSeleted = YES;
    CGFloat currentSectionAmount = 0.00f;
    NSInteger currentSectionQuantity = 0;
    CGFloat currentSectionSave = 0.00f;
    for (GouDetail *goudetail in gou.GWCarray) {
        NSString *isSale = [NSString stringWithFormat:@"%lu",goudetail.isSale];
        if ([isSale isEqualToString:@"1"]) {
            BOOL selectedCell = goudetail.isselected;
            sectionSeleted = sectionSeleted && selectedCell;
            CGFloat realPrice = [goudetail.taobao_selling_price floatValue];
            NSInteger quantity = [goudetail.number integerValue];
            CGFloat savePrice = [goudetail.taobao_price integerValue];
            
            if (selectedCell) {
                currentSectionAmount += realPrice * quantity;
                currentSectionQuantity += quantity;
                currentSectionSave += (savePrice-realPrice)*quantity;
//                NSLog(@"currentSectionSave %f",currentSectionSave);
            }
            
        }
    }
    CGFloat currentSectionPrice = [gou.price floatValue];
    CGFloat currentSectionsaveMoner = [gou.save floatValue];
    //后补
    gou.price = [NSString stringWithFormat:@"%.2f",currentSectionAmount];
    gou.quantity = [NSString stringWithFormat:@"%ld",currentSectionQuantity];
    gou.is_Seleted = sectionSeleted;
    gou.save = [NSString stringWithFormat:@"%.2f",currentSectionSave];
    

    _totalPrice += currentSectionAmount - currentSectionPrice;
    _savePrice += currentSectionSave - currentSectionsaveMoner;
    _totalPriceLabel.text = [NSString stringWithFormat:@"¥:%.2f",_totalPrice];
    _saveMoney.text = [NSString stringWithFormat:@"¥:%.2f",_savePrice];
    if (sectionSeleted) {
        for (GWCmodel*gou in self.GouArray) {
            BOOL secSelect = gou.is_Seleted;
            sectionSeleted = sectionSeleted && secSelect;
        }
        _allSelectButton.selected = sectionSeleted;
    }
    else{
        _allSelectButton.selected = NO;
    }
    [_tableView reloadData];
    
}





-(void)addBaobei:(UIButton *)button{
    NSLog(@"添加一个宝贝");
}

-(void)removeBaobei:(UIButton *)button{
    NSLog(@"减去一个宝贝");
}

-(void)delectBaobei:(UIButton *)button{
    NSLog(@"删除宝贝");
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"确定要从购物车移除该宝贝吗" message:nil delegate:self cancelButtonTitle:@"移除" otherButtonTitles:@"保留", nil];
    
    self.removeID = [NSString stringWithFormat:@"%ld",(long)button.tag];
    
    [alertView show];
    
//    
//    [HttpManager getRemoveBaobeiRequestWithSkuid:[NSString stringWithFormat:@"%ld",(long)button.tag] CompletionBlock:^(NSMutableArray *array) {
//    }];
//    [_tableView reloadData];

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 0:
        {
            [HttpManager getRemoveBaobeiRequestWithSkuid:self.removeID CompletionBlock:^(NSDictionary *dict) {
                
                
                [_tableView reloadData];
                [self viewWillAppear:YES];
                self.removedict = dict;//不获取最新的数据,上面的刷新表和viewViewAppear不执行
            }];
           
            
            
        }
            break;
            
        default:
            break;
    }
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *resuseID = @"cell";
    ShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseID];
    GWCmodel *gou = [self.GouArray objectAtIndex:indexPath.section];
    GouDetail *detail = [gou.GWCarray objectAtIndex:indexPath.row];
    //xib的cell,此处的重用机制要特别注意下,和其他的不一样
    if (!cell) {
        cell = [[ShoppingCarCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:resuseID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        }
        cell.userInteractionEnabled = YES;
        cell.layer.borderWidth = 0.5;
        cell.layer.borderColor = [[UIColor grayColor]CGColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    [cell.gouwuche_image sd_setImageWithURL:[NSURL URLWithString:detail.taobao_pic_url]];
    cell.gouwuche_title.text = detail.taobao_title;
    cell.gouwuche_chima.text = detail.size;
    cell.gouwuche_jiage.text = detail.taobao_selling_price;
    cell.gouwuche_shuliang.text = detail.number;
    cell.gouwuche_yanse.text = detail.style;
    cell.gouwuche_yuanlaidejiage.text = detail.taobao_price;
    
    //*
    cell.itemData = gou.GWCarray[indexPath.row];
    
    NSString *isSale = [NSString stringWithFormat:@"%ld",(long)detail.isSale];
    if ([isSale isEqualToString:@"2"]) {
        cell.selectButton.userInteractionEnabled = NO;
    }
    cell.selectButton.sectionTag = indexPath.section;
    cell.selectButton.rowTag = indexPath.row;
    
//    self.removeID = detail.sku_id;
//    cell.gouwuche_btn_shanchu.tag = [self.removeID integerValue];
    cell.gouwuche_btn_shanchu.tag = [detail.sku_id intValue];
    

    [cell.gouwuche_btn_jia addTarget:self action:@selector(addBaobei:) forControlEvents:UIControlEventTouchUpInside];
    [cell.gouwuche_btn_jian addTarget:self action:@selector(removeBaobei:) forControlEvents:UIControlEventTouchUpInside];
    [cell.gouwuche_btn_shanchu addTarget:self action:@selector(delectBaobei:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell reloadData];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    GWCmodel *gou = [self.GouArray objectAtIndex:section];

    static NSString *HeaderID = @"header";
    ShoppingHeaderView*headerView = [tableView dequeueReusableCellWithIdentifier:HeaderID];
    if (!headerView) {
        headerView = [[ShoppingHeaderView alloc]initWithReuseIdentifier:HeaderID];
        headerView.layer.borderWidth = 0.5;
        headerView.layer.borderColor = [[UIColor grayColor]CGColor];
    }
    
    headerView.sectionData = [self.GouArray objectAtIndex:section];
    headerView.selectButton.sectionTag = section;
    headerView.delegate = self;
    [headerView.selectButton setBackgroundImage:[UIImage imageNamed:@"待选择按钮"] forState:UIControlStateNormal];
    [headerView.selectButton setBackgroundImage:[UIImage imageNamed:@"选择按钮"] forState:UIControlStateSelected];
    
    headerView.titleLable.text = gou.brand_title;
//    [headerView.selectButton addTarget:self action:@selector(DianpuBaobei:) forControlEvents:UIControlEventTouchUpInside];
    
    [headerView reloadData];
    return headerView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.GouArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    GWCmodel *gou = [self.GouArray objectAtIndex:section];
    return gou.GWCarray.count;
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
