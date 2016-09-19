//
//  matchView.m
//  Aidapei
//
//  Created by Mr.Mac on 16/8/3.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "LDMatchView.h"

@implementation LDMatchView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    _topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 58, 60)];
    _topImageView.backgroundColor = [UIColor redColor];
    [self addSubview:_topImageView];
    
    
    _topLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_topImageView.frame), 0, 164, 30)];
    _topLabel.textAlignment = NSTextAlignmentLeft;
    _topLabel.text = @"123";
    _topLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_topLabel];
    
    
    _bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_topImageView.frame), 30, 150, 30)];
    _bottomLabel.text = @"￥188.0";
    _bottomLabel.textColor = [UIColor redColor];
    _bottomLabel.font = [UIFont systemFontOfSize:13];
    _bottomLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_bottomLabel];
    
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = frame;
    
    [_button setImage:[UIImage imageNamed:@"dapei_shangpin"] forState:UIControlStateNormal];
    
    [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_button];
    
    
    
    
    return self;
}

-(void)buttonClick:(UIButton *)sender{
    
    
    
    
}

@end
