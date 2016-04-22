//
//  AllTableViewCell.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllTableViewCell : UITableViewCell
@property (nonatomic,copy)UIButton *personButton;
@property (nonatomic,copy)UILabel *personlabel;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
