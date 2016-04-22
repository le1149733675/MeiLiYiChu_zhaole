//
//  SecVcViewController.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-15.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "SecVcViewController.h"
#import "HttpManager.h"
#import "BaoBeiDetail.h"
#import "ImageDetail.h"
#import "TitleImage.h"
#import "WenziDetail.h"
#import "QGBaoyou.h"
#import "GoumaiModel.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
@interface SecVcViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UITableView *_tableView;
    UIScrollView *_scrollView;
    UIPageControl *_pagecontrol;
    //记录上一次点击的按钮的tag值
    NSInteger _selectedIndex;
}
@end

@implementation SecVcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64-49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.userInteractionEnabled = YES;
    [self.view addSubview:_tableView];
    
    _tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT*0.3+60)];
//    _tableView.tableHeaderView.frame = CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT*0.3+60);此方法不行,无法为表头赋予位置

    //表头上的滑动视图(非自动滑动)
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT*0.3)];
    _pagecontrol = [[UIPageControl alloc]initWithFrame:CGRectMake(VIEWWIDTH/2-40, VIEWHEIGHT*0.25, 80, 30)];
    
    
//*****原来数据是在此处请求的,但是因为加在collectionView上面.滑动集合视图,数据根据重写的index方法发生改变.所以请求方法转移到重写index方法中***** 
    /*
//    [_tableView.tableHeaderView addSubview:_scrollView];
//    [HttpManager getBaobeiDetailRequestWithNumid:self.Taobaonum_id CompletionBlock:^(NSMutableArray *array) {
//        self.Allarray = array;
    
        //得到滑动视图的图片数组
//        BaoBeiDetail *detail = [self.Allarray objectAtIndex:0];
//        self.ScorllArray = detail.taobaotitleImageArray;
//        NSLog(@"  %@",self.Allarray);
//        
//        [_tableView reloadData];
//        
//        _scrollView.contentSize = CGSizeMake(VIEWWIDTH*self.ScorllArray.count, VIEWHEIGHT*0.3);
//        _scrollView.delegate = self;
//        _scrollView.pagingEnabled = YES;
//        
//        _pagecontrol.numberOfPages = self.ScorllArray.count;
//        _pagecontrol.pageIndicatorTintColor = [UIColor whiteColor];
//        _pagecontrol.currentPageIndicatorTintColor = [UIColor redColor];
//       
//        
//        for (int i = 0; i<self.ScorllArray.count; i++) {
//            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(VIEWWIDTH*i, 0, VIEWWIDTH, VIEWHEIGHT*0.3)];
//            TitleImage *title = [self.ScorllArray objectAtIndex:i];
//            [imageView sd_setImageWithURL:[NSURL URLWithString:title.url]];
//            [_scrollView addSubview:imageView];
//        }
//        
//        UILabel *symbolLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, VIEWHEIGHT*0.3, 10, 20)];
//        symbolLabel.text = detail.money_symbol;
//        symbolLabel.textColor = [UIColor redColor];
//        [_tableView.tableHeaderView addSubview:symbolLabel];
//        
//        UILabel *monylabel1 = [[UILabel alloc]initWithFrame:CGRectMake(80, VIEWHEIGHT*0.3, 60, 20)];
//        monylabel1.text = detail.taobao_promo_price;
//        monylabel1.textColor = [UIColor redColor];
//        [_tableView.tableHeaderView addSubview:monylabel1];
//        
//        UILabel *monylabel2 = [[UILabel alloc]initWithFrame:CGRectMake(150, VIEWHEIGHT*0.3, 60, 20)];
//        monylabel2.text = detail.taobao_price;
//        monylabel2.font = [UIFont systemFontOfSize:14];
//        monylabel2.textColor = [UIColor grayColor];
//        [_tableView.tableHeaderView addSubview:monylabel2];
//        
//        UILabel *taobaoTitle = [[UILabel alloc]initWithFrame:CGRectMake(20, VIEWHEIGHT*0.3+20, 280, 20)];
//        //自适应label文字大小
//        taobaoTitle.adjustsFontSizeToFitWidth = YES;
//        taobaoTitle.text = detail.taobao_title;
//        [_tableView.tableHeaderView addSubview:taobaoTitle];
//        
//        
//        
//        [_tableView.tableHeaderView addSubview:_scrollView];
//        [_tableView.tableHeaderView addSubview:_pagecontrol];
    
//    }];
    
     */
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _pagecontrol.currentPage = _scrollView.contentOffset.x/VIEWWIDTH;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //大数组
    BaoBeiDetail *detail = [self.Allarray objectAtIndex:0];
    
    
    if (indexPath.section == 0) {
        static NSString *resuID = @"cell1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:resuID];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(10, 10, 150, 20);
            [btn setTitle:@"生成二维码图片" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(ErWeiMabtn) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:btn];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(170, 10, 140, 20)];
            label.text = @"好友扫码购买";
            label.font = [UIFont systemFontOfSize:14];
            [cell addSubview:label];
        }
        
        return cell;
    }else if (indexPath.section == 1){
        
        static NSString *resuID = @"cell2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:resuID];
            //*****NSLog(@" 全国包邮 %@",detail.QGbaoyouArray);****此句写在cell的重用里面,打印不出数组,数组为空
            
        }
        for (int i= 0; i<detail.QGbaoyouArray.count; i++) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40+i*(40+30), 30, 40, 14)];
            UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(40+i*(40+30), 5, 40, 25)];
            QGBaoyou *baoyou = [detail.QGbaoyouArray objectAtIndex:i];
            [imageview sd_setImageWithURL:[NSURL URLWithString:baoyou.pic_url]];
            label.text = baoyou.title;
            label.adjustsFontSizeToFitWidth = YES;
            [cell addSubview:label];
            [cell addSubview:imageview];
        }
        
        
 //       NSLog(@" 全国包邮 %@",detail.QGbaoyouArray);
        return cell;
    }else if (indexPath.section == 2){
        
        static NSString *resuID = @"cell3";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:resuID];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 180, 20)];
        label1.adjustsFontSizeToFitWidth = YES;
        label1.textColor = [UIColor redColor];
        label1.text = detail.title;
        [cell addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(210, 10, 80, 20)];
        label2.adjustsFontSizeToFitWidth = YES;
        label2.text = @"更多热销宝贝";
        [cell addSubview:label2];
        
        return cell;
    }
    else if (indexPath.section == 3){
    static NSString *resuID = @"cell4";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuID];
//        for (UIImageView *imageView  in [cell.contentView class])
//        {
//            [imageView removeFromSuperview];
//        }
//        [[cell viewWithTag:5]removeFromSuperview];
        
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:resuID];
        
        
  //把本区所有的其他label数据放到重用池外面,暂时无bug,否则会出现严重的重用问题
    }
        if (detail.sizeArray == nil) {
            
            //文字
        for (int i = 0; i<detail.DetailArray.count; i++) {
            WenziDetail*wenzi = [detail.DetailArray objectAtIndex:indexPath.row];
            UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 10, 100, 20)];
            UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(130, 10, 200, 20)];
            label2.text = wenzi.vname;
            label2.font = [UIFont systemFontOfSize:14];
            label1.font = [UIFont systemFontOfSize:14];
            label1.textColor = [UIColor grayColor];
            label1.text = wenzi.pname;
            [cell addSubview:label1];
            [cell addSubview:label2];
            }
        }else{
            
            //直接把传过来的数组数据解析成详情中的排布情况,即将array数组转换为string字符串
            //  NSString *string = [[self.receiveArray componentsJoinedByString:@""] stringByReplacingOccurrencesOfString:@"\t" withString:@""];
            //当详情里有尺寸数组的时候
            
            if (0<=indexPath.row&&indexPath.row<detail.sizeArray.count) {
          
                NSArray *array = [detail.sizeArray objectAtIndex:indexPath.row];
                static NSString *cellId = @"cell14";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
                if (!cell) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
                   } 
                    for (int i = 0; i<array.count; i++) {
                        UILabel *lable = [[UILabel alloc] init];
                        lable.tag = i + 1;
                        [cell.contentView addSubview:lable];
                    
                    
                
                for (int i = 0; i<array.count; i++) {
                    NSString *strUrl = [[array objectAtIndex:i] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                    //  NSString *strUrl1 = [strUrl stringByReplacingOccurrencesOfString:@"  " withString:@""];
                    NSString *strUrl1 = [strUrl stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                    //  NSLog(@"******************%@",strUrl1);
                    UILabel *label1 = (UILabel *)[cell.contentView viewWithTag:i+1];
                    label1.frame = CGRectMake(320/array.count*i, 5, 320/array.count, 30);
                    // label1.backgroundColor = [UIColor orangeColor];
                    label1.textAlignment = NSTextAlignmentCenter;
                    label1.font = [UIFont systemFontOfSize:12];
                    label1.text = strUrl1;
                }
            }
                return cell;
                
            }else if(detail.sizeArray.count<indexPath.row&&indexPath.row<detail.sizeArray.count+detail.DetailArray.count){
                static NSString *cellId = @"cell24";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
                if (!cell) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
                //文字
                for (int i = 0; i<detail.DetailArray.count; i++) {
                    WenziDetail*wenzi = [detail.DetailArray objectAtIndex:indexPath.row-detail.sizeArray.count];
                    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 10, 100, 20)];
                    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(130, 10, 200, 20)];
                    label2.text = wenzi.vname;
                    label2.font = [UIFont systemFontOfSize:14];
                    label1.font = [UIFont systemFontOfSize:14];
                    label1.textColor = [UIColor grayColor];
                    label1.text = wenzi.pname;
                    [cell addSubview:label1];
                    [cell addSubview:label2];
                }
            }
            return cell;
           }
            
            
        }
//    }
    
    return cell;
    }else if (indexPath.section == 4){
        static NSString *resuID = @"cell5";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:resuID];
            UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 100, 20  )];
            label1.text = @"小编说:";
            label1.font = [UIFont systemFontOfSize:14];
            [cell addSubview:label1];
            
        }
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(5, 20, 220, 20 )];
            label2.text = detail.taobao_title;
            label2.textColor  = [UIColor blackColor];
            label2.adjustsFontSizeToFitWidth = YES;
            label2.font = [UIFont systemFontOfSize:14];
            [cell addSubview:label2];
        
        return cell;
    }else
    {
        static NSString *resuID = @"cell6";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:resuID];
            //******这个图片数组放到重用池中,会引起重用******
            //        for (int i = 0; i<detail.ImagedetailArray.count; i++) {
            //
            //        }
        }
        UIImageView*imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
        ImageDetail *imgDetail = detail.ImagedetailArray[indexPath.row];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imgDetail.content]];
        [cell addSubview:imageView];
        return cell;

    }
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 3) {
        static NSString *headerID = @"header1";
        UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:headerID];
        if (!headerView) {
            headerView = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headerID];
            
            NSMutableArray *titleArray = [NSMutableArray arrayWithObjects:@"图文详情",@"购物须知", nil];
            for (int i = 0; i<2; i++) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake(i*[UIScreen mainScreen].bounds.size.width/2, 0, [UIScreen mainScreen].bounds.size.width/2, 44);
                [btn setTitle:titleArray[i] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
                headerView.backgroundColor = [[UIColor alloc]initWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
                [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
                btn.tag = i+1;
                [headerView addSubview:btn];
                
                if (i == 0) {
                    btn.selected = YES;
                    _selectedIndex = btn.tag;
                    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
                    btn.backgroundColor = [UIColor whiteColor];
                }
                
            }
            
            
        }
        
        return headerView;
    }
    static NSString *headerID = @"header2";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:headerID];
    if (!headerView) {
        headerView = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headerID];
    }
    return headerView;
    
}

-(void)buttonClick:(UIButton *)btn{
    UIButton *lastBtn = (UIButton *)[self.view viewWithTag:_selectedIndex];
    lastBtn.selected = NO;
    lastBtn.backgroundColor = [[UIColor alloc]initWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
    btn.selected = YES;
    
    if (btn.tag == 1) {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        btn.backgroundColor = [UIColor whiteColor];
    }else if(btn.tag == 2){
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        btn.backgroundColor = [UIColor whiteColor];
    }
    
    _selectedIndex = btn.tag;
    
}


//重写set方法
-(void)setIndex:(NSInteger)index{
    _index = index;
    
    [HttpManager getBaobeiDetailRequestWithNumid:self.TaoIdarray[index] CompletionBlock:^(NSMutableArray *array) {
        self.Allarray = array;

        //得到滑动视图的图片数组
        BaoBeiDetail *detail = [self.Allarray objectAtIndex:0];
        self.ScorllArray = detail.taobaotitleImageArray;
        
        [_tableView reloadData];
        
        _scrollView.contentSize = CGSizeMake(VIEWWIDTH*self.ScorllArray.count, VIEWHEIGHT*0.3);
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        
        _pagecontrol.numberOfPages = self.ScorllArray.count;
        _pagecontrol.pageIndicatorTintColor = [UIColor whiteColor];
        _pagecontrol.currentPageIndicatorTintColor = [UIColor redColor];
        
        
        for (int i = 0; i<self.ScorllArray.count; i++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(VIEWWIDTH*i, 0, VIEWWIDTH, VIEWHEIGHT*0.3)];
            TitleImage *title = [self.ScorllArray objectAtIndex:i];
            [imageView sd_setImageWithURL:[NSURL URLWithString:title.url]];
            [_scrollView addSubview:imageView];
        }
        
        UILabel *symbolLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, VIEWHEIGHT*0.3, 10, 20)];
        symbolLabel.text = detail.money_symbol;
        symbolLabel.textColor = [UIColor redColor];
        [_tableView.tableHeaderView addSubview:symbolLabel];
        
        UILabel *monylabel1 = [[UILabel alloc]initWithFrame:CGRectMake(80, VIEWHEIGHT*0.3, 60, 20)];
        monylabel1.text = detail.taobao_promo_price;
        monylabel1.textColor = [UIColor redColor];
        [_tableView.tableHeaderView addSubview:monylabel1];
        
        UILabel *monylabel2 = [[UILabel alloc]initWithFrame:CGRectMake(150, VIEWHEIGHT*0.3, 60, 20)];
        monylabel2.text = detail.taobao_price;
        monylabel2.font = [UIFont systemFontOfSize:14];
        monylabel2.textColor = [UIColor grayColor];
        [_tableView.tableHeaderView addSubview:monylabel2];
        
        UILabel *taobaoTitle = [[UILabel alloc]initWithFrame:CGRectMake(20, VIEWHEIGHT*0.3+20, 280, 20)];
        //自适应label文字大小
        taobaoTitle.adjustsFontSizeToFitWidth = YES;
        taobaoTitle.text = detail.taobao_title;
        [_tableView.tableHeaderView addSubview:taobaoTitle];
        
        
        
        [_tableView.tableHeaderView addSubview:_scrollView];
        [_tableView.tableHeaderView addSubview:_pagecontrol];

        
        [_tableView reloadData];
    }];
    
//    NSLog(@"index ==== %ld",(long)_index);
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0||section == 2) {
        return 10;
    }
    return 0.5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0||section == 1||section ==2||section == 4||section==5) {
        return 0.5;
    }
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 5) {
        return 200;
    }
    return 44;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0||section == 1||section == 2) {
        return 1;
    }else  if(section == 3){
        BaoBeiDetail *detail = [self.Allarray objectAtIndex:0];
        if (detail.sizeArray == nil) {
            return detail.DetailArray.count;
        }
        else{
            return detail.DetailArray.count+detail.sizeArray.count;
        }
        
    }else if (section == 4){
        return 1;
    }else{
        BaoBeiDetail *detail = [self.Allarray objectAtIndex:0];
        return detail.ImagedetailArray.count;
    }
}

-(void)ErWeiMabtn{
    NSLog(@"生成二维码");
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
