//
//  HeaderViewCell.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderViewCell : UITableViewHeaderFooterView
@property (nonatomic,copy)UILabel *leftlabel;
@property (nonatomic,copy)UILabel * rightlabel;
-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier;
@end
