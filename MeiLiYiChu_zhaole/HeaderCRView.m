//
//  HeaderCRView.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-17.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "HeaderCRView.h"

@implementation HeaderCRView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 20)];
        [self addSubview:_label];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
