//
//  CollectionViewCell.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *collection_image;
@property (weak, nonatomic) IBOutlet UILabel *collection_title;
@property (weak, nonatomic) IBOutlet UILabel *collection_RMB;
@property (weak, nonatomic) IBOutlet UILabel *collection_Monry;
@property (weak, nonatomic) IBOutlet UIImageView *collection_tagImage;

@end
