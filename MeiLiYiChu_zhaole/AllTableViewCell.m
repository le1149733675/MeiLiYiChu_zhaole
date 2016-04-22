//
//  AllTableViewCell.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "AllTableViewCell.h"

@implementation AllTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"待付款",@"待发货",@"待收货",@"已收货",@"退款中", nil];
    if (self) {
        for (int i = 0; i<5; i++) {
            _personButton = [UIButton buttonWithType:UIButtonTypeCustom];
            _personButton.frame = CGRectMake(20+VIEWWIDTH/5*i, 0, VIEWWIDTH/5-40, 30);
            NSString *imageString = [NSString stringWithFormat:@"menu-%d",i+1];
            [_personButton setBackgroundImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
            [self addSubview:_personButton];
            
            _personlabel = [[UILabel alloc] init];
            _personlabel.font = [UIFont systemFontOfSize:13];
            _personlabel.textAlignment = NSTextAlignmentCenter;
            _personlabel.frame = CGRectMake(10+VIEWWIDTH/5*i, 30, VIEWWIDTH/5-40+20, 10);
            _personlabel.text = [array objectAtIndex:i];
            [self addSubview:_personlabel];
            
        }
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
