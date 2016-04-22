//
//  HeaderView.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _lastlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, VIEWWIDTH *0.3, 50)];
        _lastlabel.textColor = RGB(251, 55, 117);
        _lastlabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_lastlabel];
        
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
