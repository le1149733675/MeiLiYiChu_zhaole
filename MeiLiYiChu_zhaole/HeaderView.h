//
//  HeaderView.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UITableViewHeaderFooterView
@property (nonatomic ,copy) UILabel *lastlabel;
-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier;
@end
