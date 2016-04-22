//
//  HttpManager.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "HttpManager.h"
#import "Scollermodel.h"
#import "LingYuan.h"
#import "PuBuLiu.h"
#import "Fenlei.h"
#import "FenRexiao.h"
#import "FenJiage.h"
#import "GWCmodel.h"
#import "DianpuModel.h"
#import "BaoBeiDetail.h"
#import "PinpaiMoel.h"
@implementation HttpManager

//获取滑动视图的数据
+(void)getBannerMessageCompletionBlock:(void (^) (NSMutableArray *bannerArray))block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://vapi.yuike.com/1.0/client/banner_list.php?mid=457465&sid=07641edd46c5708f048eab68cef319d6&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5127897" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dict objectForKey:@"data"];
        NSMutableArray *Array = [NSMutableArray array];
        for (NSDictionary *Dict in array) {
            Scollermodel *scoll = [Scollermodel parseBannerWithDictionary:Dict];
            [Array addObject:scoll];
        }
        
        block(Array);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

//零元数组
+(void)getshowMessageCompletionBlock:(void (^) (NSMutableArray *showArray))block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://vapi.yuike.com/1.0/home/model_list.php?mid=457465&sid=07641edd46c5708f048eab68cef319d6&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5127897" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",operation.responseString);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dict objectForKey:@"data"];
        NSMutableArray *Array = [NSMutableArray array];
        for (NSDictionary *Dict in array) {
            LingYuan *ling = [LingYuan parseShowMessageWithDictionary:Dict];
            
            [Array addObject:ling];
        }
        
        
        
        block (Array);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

//最底部的CollectionView数组
+(void)getWaterMeaasgeCompletionBlock:(void (^) (NSMutableArray *waterArray))block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://vapi.yuike.com/1.0/product/quality.php?count=40&cursor=0&mid=457465&sid=07641edd46c5708f048eab68cef319d6&type=choice&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5127897" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",operation.responseString);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dataDict = [dict objectForKey:@"data"];
        NSArray *array = [dataDict objectForKey:@"products"];
        NSMutableArray *Array = [NSMutableArray array];
        for (NSDictionary *productDict in array) {
            PuBuLiu *ppp = [PuBuLiu parseWaterMessageWithDict:productDict];
            [Array addObject:ppp];
        }
        block(Array);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

//分类的数据
+(void)getFenleifyMessageCompletionBlock:(void (^) (NSMutableArray *classfyArray))block{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://vapi.yuike.com/1.0/category/list.php?sid=190119e76b585ecf7343472285ddc97d&yk_pid=3&yk_appid=1&yk_cc=yuikemall&yk_cvc=303&mid=457465" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",operation.responseString);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dict objectForKey:@"data"];
        NSMutableArray *DetailArray = [NSMutableArray array];
        for (NSDictionary *ddd in array) {
            Fenlei *fen = [Fenlei parseWaterMessageWithDict:ddd];
            [DetailArray addObject:fen];
        }
        block(DetailArray);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


//新品商品(分类详情)
+(void)getXinpinRequestWithCid:(NSString *)cid WithSort:(NSString *)sort  CompletionBlock:(void(^)(NSMutableArray *array ))block{

    NSString* uel = [NSString stringWithFormat:@"http://vapi.yuike.com/1.0/search/search.php?type=product&keyword=%E9%A1%B9%E9%93%BE&taobao_cid=%@&method=0&cursor=0&count=40&sort=%@&sid=cbd7752f1863efac0b39fcaebbe64ada&yk_pid=3&yk_appid=1&yk_cc=yuikemall&yk_cvc=303&mid=457465",cid,sort];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:uel parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",operation.responseString);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [[dict objectForKey:@"data"]objectForKey:@"products"];
        NSMutableArray *XINPArr = [NSMutableArray array];
        for (NSDictionary *ddd in array) {
            FenRexiao *rexiao = [FenRexiao parseWaterMessageWithDict:ddd];
            [XINPArr addObject:rexiao];
        }
        block(XINPArr);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    
    
}


//购物车
+(void)getGouWuCheRequestWithcountCompletionBlock:(void(^)(NSMutableArray *array))block{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger GET:@"http://vapi.yuike.com/1.0/cart/list.php?sid=75d8a5af30fddd1c29b2be5b1343b267&yk_pid=3&yk_appid=1&yk_cc=yuikemall&yk_cvc=303&mid=457465" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",operation.responseString);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [[dict objectForKey:@"data"]objectForKey:@"cart_groups"];
        NSMutableArray *GWCarray = [NSMutableArray array];
        for (NSDictionary *ddd in array) {
            GWCmodel *gou = [GWCmodel parseWaterMessageWithDict:ddd];
            [GWCarray addObject:gou];
        }
        
        block(GWCarray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

//搜索数据
+(void)getSearchRquestWithSearchString:(NSString *)searchString WithSort:(NSString *)sort CompletionBlock:(void(^)(NSMutableArray *array))block{
    NSString *url = [NSString stringWithFormat:@"http://vapi.yuike.com/1.0/search/search.php?count=40&cursor=0&keyword=%@&method=1&mid=457465&sid=95811d3a2eaad13e665b54c6f1136bbd&sort=%@&taobao_cid=0&type=product&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5128663",[searchString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],sort];
    AFHTTPRequestOperationManager *mange = [AFHTTPRequestOperationManager manager];
    [mange GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [[dict objectForKey:@"data"]objectForKey:@"products"];
        NSMutableArray *searchArr = [NSMutableArray array];
        for (NSDictionary *ddd in array) {
            FenRexiao *rexiao = [FenRexiao parseWaterMessageWithDict:ddd];
            [searchArr addObject:rexiao];
        }
        block(searchArr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

//每日零元
+(void)getDianpuRequestWithSearchBrandid:(NSString *)SearchBrandid WithSort:(NSString *)sort CompletionBlock:(void(^)(NSMutableArray *array))block{
    NSString *url = [NSString stringWithFormat:@"http://vapi.yuike.com/1.0/search/search.php?brand_id=%@&count=40&cursor=0&mid=457465&sid=3582afff5e0d2368b0d91a2a130ee083&sort=%@&type=product&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5128810",[SearchBrandid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],sort];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@" 零元 %@",operation.responseString);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [[dict objectForKey:@"data"]objectForKey:@"products"];
        NSMutableArray *dianArray = [NSMutableArray array];
        for (NSDictionary *ddd in array) {
            DianpuModel *dian = [DianpuModel parseDianpuMessageWithDict:ddd];
            [dianArray addObject:dian];
        }
        block(dianArray);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}

#pragma mark 这个数据的解析很特别 解析到的都是字典,不用遍历,直接把字典传出来
//宝贝详情
+(void)getBaobeiDetailRequestWithNumid:(NSString *)Numid CompletionBlock:(void(^)(NSMutableArray *array))block{
    NSString *url = [NSString stringWithFormat:@"http://vapi.yuike.com/1.0/product/detail.php?mid=457465&sid=07641edd46c5708f048eab68cef319d6&taobao_num_iid=%@&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5127897",[Numid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",operation.responseString);
                
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *ddd = [dict objectForKey:@"data"];
        NSMutableArray *BBarray = [NSMutableArray array];
     BaoBeiDetail *baobei = [BaoBeiDetail paresGetmessageWithDict:ddd];
        [BBarray addObject:baobei];
        
        block(BBarray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
//品牌排行
+(void)getPinpaiPaihangRequestWithCompletionBlock:(void(^)(NSMutableArray *array))block{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger GET:@"http://vapi.yuike.com/1.0/brand/ranking_list.php?sid=75d8a5af30fddd1c29b2be5b1343b267&yk_pid=3&yk_appid=1&yk_cc=yuikemall&yk_cvc=303&mid=457465" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",operation.responseString);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dict objectForKey:@"data"];
        NSMutableArray *pinpaiArray = [NSMutableArray array];
        for (NSDictionary *ddd in array) {
            PinpaiMoel *pin = [PinpaiMoel parseRequestMessageWithDict:ddd];
            [pinpaiArray addObject:pin];
        }
        block(pinpaiArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
//加入购物车
+(void)getAddGouwucheRequestWithSkuid:(NSString *)skuid Withnumber:(NSString *)number CompletionBlock:(void(^)(NSMutableArray *array))block{
    NSString *url = [NSString stringWithFormat:@"http://vapi.yuike.com/1.0/cart/add.php?sku_id=%@&number=%@&sid=75d8a5af30fddd1c29b2be5b1343b267&yk_pid=3&yk_appid=1&yk_cc=yuikemall&yk_cvc=303&mid=457465",skuid,number];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

//删除宝贝
+(void)getRemoveBaobeiRequestWithSkuid:(NSString *)skuid CompletionBlock:(void(^)(NSDictionary *dict))block{
    NSString *url = [NSString stringWithFormat:@"http://vapi.yuike.com/1.0/cart/remove.php?sku_id=%@&sid=75d8a5af30fddd1c29b2be5b1343b267&yk_pid=3&yk_appid=1&yk_cc=yuikemall&yk_cvc=303&mid=457465",skuid];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@" 删除 %@",operation.responseString);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        block(dict);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

@end
