//
//  CustomBtn.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "CustomBtn.h"

@implementation CustomBtn

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, 75, 25);
        [self setTitle:@"我要加盟" forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.layer.cornerRadius = 3;
        self.clipsToBounds = YES;
        [self setTitleColor:RGB(251, 55, 117) forState:UIControlStateNormal] ;
        self.backgroundColor = [UIColor whiteColor];
        
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
