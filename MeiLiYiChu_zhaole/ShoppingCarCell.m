
//
//  ShoppingCarCell.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-19.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "ShoppingCarCell.h"

@interface ShoppingCarCell()



@end

@implementation ShoppingCarCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _selectButton = [UICellButton buttonWithType:UIButtonTypeCustom];
        _selectButton.frame = CGRectMake(5, 15, 30, 40);
        _selectButton.showsTouchWhenHighlighted = YES;
        [_selectButton setImage:[UIImage imageNamed:@"待选择按钮"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"选择按钮"] forState:UIControlStateSelected];
        [_selectButton addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_selectButton];
        
        _gouwuche_image = [[UIImageView alloc]initWithFrame:CGRectMake(43, 10, 50, 50)];
        [self addSubview:_gouwuche_image];
        
        _gouwuche_title = [[UILabel alloc]initWithFrame:CGRectMake(90, 10, 200, 40)];
        _gouwuche_title.font = [UIFont systemFontOfSize:15];
        _gouwuche_title.numberOfLines = 2;
        _gouwuche_title.textColor = [UIColor blackColor];
        [self addSubview:_gouwuche_title];
        
        _gouwuche_yanse1 = [[UILabel alloc]initWithFrame:CGRectMake(90, 60, 40, 20)];
        _gouwuche_yanse1.textColor = [UIColor grayColor];
        _gouwuche_yanse1.font = [UIFont systemFontOfSize:14];
        _gouwuche_yanse1.text = @"颜色:";
        [self addSubview:_gouwuche_yanse1];
        
        _gouwuche_yanse = [[UILabel alloc]initWithFrame:CGRectMake(130, 60, 60, 20)];
        _gouwuche_yanse.font = [UIFont systemFontOfSize:14];
        _gouwuche_yanse.textColor = [UIColor grayColor];
        [self addSubview:_gouwuche_yanse];
        
        _gouwuche_chima1 = [[UILabel alloc]initWithFrame:CGRectMake(190, 60, 40, 20)];
        _gouwuche_chima1.text = @";尺码";
        _gouwuche_chima1.font = [UIFont systemFontOfSize:14];
        _gouwuche_chima1.textColor = [UIColor grayColor];
        [self addSubview:_gouwuche_chima1];
        
        _gouwuche_chima = [[UILabel alloc]initWithFrame:CGRectMake(230, 60, 40, 20)];
        _gouwuche_chima.textColor = [UIColor grayColor];
        _gouwuche_chima.font = [UIFont systemFontOfSize:14];
        [self addSubview:_gouwuche_chima];
        
        _gouwuche_jiage1 = [[UILabel alloc]initWithFrame:CGRectMake(90, 80, 50, 20)];
        _gouwuche_jiage1.textColor = [UIColor blackColor];
        _gouwuche_jiage1.text = @"价格:¥";
        _gouwuche_jiage1.font = [UIFont systemFontOfSize:14];
        [self addSubview:_gouwuche_jiage1];
        
        _gouwuche_jiage = [[UILabel alloc]initWithFrame:CGRectMake(140, 80, 60, 20)];
        _gouwuche_jiage.textColor = [UIColor blackColor];
        _gouwuche_jiage.font = [UIFont systemFontOfSize:14];
        [self addSubview:_gouwuche_jiage];
        
        _gouwuche_yuanlaidejiage1 = [[UILabel alloc]initWithFrame:CGRectMake(195, 90, 55, 1)];
        _gouwuche_yuanlaidejiage1.backgroundColor = [UIColor grayColor];
        [self addSubview:_gouwuche_yuanlaidejiage1];
        
        _gouwuche_yuanlaidejiage = [[UILabel alloc]initWithFrame:CGRectMake(200, 80, 60, 20)];
        _gouwuche_yuanlaidejiage.textColor = [UIColor grayColor];
        _gouwuche_yuanlaidejiage.font = [UIFont systemFontOfSize:14];
        [self addSubview:_gouwuche_yuanlaidejiage];
        
        _gouwuche_btn_jian = [UIButton buttonWithType:UIButtonTypeCustom];
        _gouwuche_btn_jian.frame = CGRectMake(90, 110, 20, 20);
        [_gouwuche_btn_jian setBackgroundImage:[UIImage imageNamed:@"减去按钮1"] forState:UIControlStateNormal];
        [self addSubview:_gouwuche_btn_jian];
        
        _gouwuche_btn_jia = [UIButton buttonWithType:UIButtonTypeCustom];
        _gouwuche_btn_jia.frame = CGRectMake(150, 110, 20, 20);
        [_gouwuche_btn_jia setBackgroundImage:[UIImage imageNamed:@"添加按钮2"] forState:UIControlStateNormal];
        [self addSubview:_gouwuche_btn_jia];
        
        _gouwuche_shuliang = [[UILabel alloc]initWithFrame:CGRectMake(110, 110, 40, 20)];
        _gouwuche_shuliang.textColor = [UIColor redColor];
        _gouwuche_shuliang.font = [UIFont systemFontOfSize:15];
        _gouwuche_shuliang.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_gouwuche_shuliang];
        
        _gouwuche_btn_shanchu = [UIButton buttonWithType:UIButtonTypeCustom];
        _gouwuche_btn_shanchu.frame = CGRectMake(241, 110, 30, 30);
        [_gouwuche_btn_shanchu setBackgroundImage:[UIImage imageNamed:@"删除按钮"] forState:UIControlStateNormal];
        [self addSubview:_gouwuche_btn_shanchu];
        
        
        
    }
    return self;
}

- (void)reloadData
{
    
    if (self.itemData) {
        _selectButton.selected = self.itemData.isselected;
    }
}

//选择的按钮点击
- (void)selectAction:(UICellButton *)button
{
    if ([self.delegate respondsToSelector:@selector(carSelectButtonClicked:WithSectionIndexPath:WithIndexPath:)]) {
        [self.delegate carSelectButtonClicked:self.itemData WithSectionIndexPath:button.sectionTag WithIndexPath:button.rowTag];
    }
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
