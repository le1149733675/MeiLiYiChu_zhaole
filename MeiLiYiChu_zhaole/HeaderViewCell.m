//
//  HeaderViewCell.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "HeaderViewCell.h"

@implementation HeaderViewCell
-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier

{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _leftlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, VIEWWIDTH *0.3, 50)];
        _leftlabel.textColor = RGB(251, 55, 117);
        _leftlabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_leftlabel];
        
        _rightlabel = [[UILabel alloc] initWithFrame:CGRectMake(10+VIEWWIDTH *0.3+10, 20, VIEWWIDTH *0.5, 30)];
        _rightlabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_rightlabel];
    }
    
    
    
    return self;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
