//
//  LDSelectCollectionViewCell.m
//  Aidapei
//
//  Created by Mr.Mac on 16/7/30.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "LDSelectCollectionViewCell.h"

@implementation LDSelectCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, CGRectGetMaxY(self.contentView.frame) - 23)];
    
    [self.contentView addSubview:_imageView];
    
    
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _leftButton.frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame), (self.contentView.frame.size.width / 2) - 20, 23);
    
    [_leftButton setImage:[UIImage imageNamed:@"dapei_like"] forState:UIControlStateNormal];
    
    [_leftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    _leftButton.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    
    _leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    _leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    
    [self.contentView addSubview:_leftButton];
    
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _rightButton.frame = CGRectMake(self.contentView.frame.size.width / 2, CGRectGetMaxY(_imageView.frame), (self.contentView.frame.size.width / 2) - 20, 23);
    
    [_rightButton setImage:[UIImage imageNamed:@"dapei_number"] forState:UIControlStateNormal];
    
    [_rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    _rightButton.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    
    _rightButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    _rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    
    [self.contentView addSubview:_rightButton];
    
    
    
    return self;
    
    
}









@end
