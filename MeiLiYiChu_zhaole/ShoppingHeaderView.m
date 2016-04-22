//
//  ShoppingHeaderView.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-19.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "ShoppingHeaderView.h"

@implementation ShoppingHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _selectButton = [UICellButton buttonWithType:UIButtonTypeCustom];
        _selectButton.frame = CGRectMake(8, 5, 30, 40);
        _selectButton.showsTouchWhenHighlighted = YES;
        [_selectButton setImage:[UIImage imageNamed:@"待选择按钮"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"选择按钮"] forState:UIControlStateSelected];
        [_selectButton addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_selectButton];
        
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 200, 20)];
        [self addSubview:_titleLable];
        
        
    }
    return self;
}

- (void)reloadData
{
    if (self.sectionData) {
        
        _selectButton.selected = self.sectionData.is_Seleted;
    }
}


- (void)selectAction:(id)sender
{
    UICellButton *button = (UICellButton *)sender;
    if ([self.delegate respondsToSelector:@selector(carSelectButtonClicked:WithIndexPathSection:WithIndexPathRow:)]) {
        [self.delegate carSelectButtonClicked:self.sectionData WithIndexPathSection:button.sectionTag WithIndexPathRow:button.rowTag];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
