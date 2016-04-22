//
//  ChunTableViewCell.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "ChunTableViewCell.h"

@implementation ChunTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _leftBigBtn = [[UIButton alloc] initWithFrame:CGRectMake(VIEWWIDTH/5, 10, VIEWWIDTH/6, 200*0.4)];
        [self addSubview:_leftBigBtn];
        _leftBigLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200*0.4+5, VIEWWIDTH *0.4, 60)];
        _leftBigLabel.font = [UIFont systemFontOfSize:14];
        _leftBigLabel.textColor = RGB(91, 91, 91);
        _leftBigLabel.numberOfLines = 0;
        [self addSubview:_leftBigLabel];
        
        _label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 200*0.4+5+50+5+5, 60, 1)];
        _label1.backgroundColor = [UIColor grayColor];
        _label1.alpha = 0.8;
        [self addSubview:_label1];
        _leftgrayLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 200*0.4+5+40+5+5, 60, 20)];
        _leftgrayLabel.font = [UIFont systemFontOfSize:14];
        _leftgrayLabel.textColor = RGB(81, 81, 81);
        [self addSubview:_leftgrayLabel];
        _leftredlabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 200*0.4+70+5+5, 60, 20)];
        _leftredlabel.font = [UIFont systemFontOfSize:14];
        _leftredlabel.textColor = RGB(251, 55, 117);
        [self addSubview:_leftredlabel];
        
        _rightTopBtn = [[UIButton alloc] initWithFrame:CGRectMake(VIEWWIDTH/2+10, 10, VIEWWIDTH/10+10, 200*0.35)];
        [self addSubview:_rightTopBtn];
        
        _label2 = [[UILabel alloc]initWithFrame:CGRectMake(VIEWWIDTH/2+20+VIEWWIDTH/10, 60, 60, 1)];
        _label2.backgroundColor = [UIColor grayColor];
        _label2.alpha = 0.8;
        [self addSubview:_label2];
        _rightTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEWWIDTH/2+20+VIEWWIDTH/10, 5, VIEWWIDTH*0.32, 49)];
        _rightTopLabel.textColor = RGB(91, 91, 91);
        _rightTopLabel.font = [UIFont systemFontOfSize:14];
        _rightTopLabel.numberOfLines = 0;
        [self addSubview:_rightTopLabel];
        
        _rightTopgraylabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEWWIDTH/2+25+VIEWWIDTH/10, 50, 60, 20)];
        _rightTopgraylabel.textColor = RGB(91, 91, 91);
        _rightTopgraylabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_rightTopgraylabel];
        
        _rightTopredlabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEWWIDTH/2+25+VIEWWIDTH/10,70, 60, 20)];
        _rightBottomredlabel.font = [UIFont systemFontOfSize:14];
        _rightTopredlabel.textColor = RGB(251, 55, 117);
        [self addSubview:_rightTopredlabel];
        
        _label3 = [[UILabel alloc]initWithFrame:CGRectMake(VIEWWIDTH/2+23+VIEWWIDTH/10, 160, 65, 1)];
        _label3.backgroundColor = [UIColor grayColor];
        _label3.alpha = 0.8;
        [self addSubview:_label3];
        
        _rightBottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(VIEWWIDTH/2+10, 115, VIEWWIDTH/10+10, 200*0.35)];
        [self addSubview:_rightBottomBtn];
        _rightBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEWWIDTH/2+20+VIEWWIDTH/10, 110, VIEWWIDTH*0.32, 40)];
        _rightBottomLabel.font = [UIFont systemFontOfSize:14];
        _rightBottomLabel.numberOfLines = 0;
        _rightBottomLabel.textColor = RGB(91, 91, 91);
        [self addSubview:_rightBottomLabel];
        _rightBottomgraylabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEWWIDTH/2+28+VIEWWIDTH/10, 150, 60, 20)];
        _rightTopgraylabel.font = [UIFont systemFontOfSize:14];
        _rightBottomgraylabel.textColor = RGB(91, 91, 91);
        
        [self addSubview:_rightBottomgraylabel];
        _rightBottomredlabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEWWIDTH/2+25+VIEWWIDTH/10, 175, 60, 15)];
        _rightBottomredlabel.font = [UIFont systemFontOfSize:14];
        _rightBottomredlabel.textColor = RGB(251, 55, 117);
        [self addSubview:_rightBottomredlabel];
        
        
        _label4 = [[UILabel alloc]initWithFrame:CGRectMake(VIEWWIDTH/2, 0, 1, 200)];
        _label4.backgroundColor = [UIColor grayColor];
        _label4.alpha = 0.8;
        [self addSubview:_label4];
        
        _label5 = [[UILabel alloc]initWithFrame:CGRectMake(VIEWWIDTH/2, 100, VIEWWIDTH/2, 1)];
        _label5.backgroundColor = [UIColor grayColor];
        _label5.alpha = 0.8;
        [self addSubview:_label5];
        
        
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
