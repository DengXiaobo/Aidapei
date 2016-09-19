//
//  dxbTableViewCell3.m
//  Aidapei
//
//  Created by mac on 16/7/30.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "dxbTableViewCell2.h"
#import <UIColor+Hex.h>

#import "dxbNetwroking.h"
#import "Const.h"

@implementation dxbTableViewCell2

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        CGFloat between=2;
        CGFloat viewHeight=200;
        CGFloat viewWidth=([UIScreen mainScreen].bounds.size.width-4*between)/2;
        CGFloat labelHeight=30;
        CGFloat bottomHeight=20;
        
        //leftView
        UIView *leftView=[[UIView alloc]initWithFrame:CGRectMake(between,between, viewWidth, viewHeight)];
        leftView.tag=10001;
        leftView.backgroundColor=[UIColor colorWithCSS:@"aaaaaa"];
        [self.contentView addSubview:leftView];
        
        //leftTap
        UITapGestureRecognizer *leftTap=[UITapGestureRecognizer new];
        [leftTap addTarget:self action:@selector(tapToGetView:)];
        [leftView addGestureRecognizer:leftTap];
        
        //leftImage
        _leftImage=[[UIImageView alloc]initWithFrame:CGRectMake(between, between,leftView.frame.size.width-2*between, viewHeight-between-labelHeight-bottomHeight)];
        [leftView addSubview:_leftImage];
        
        //leftUplabel
        _leftLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,leftView.frame.size.height-labelHeight-bottomHeight, leftView.frame.size.width,labelHeight)];
        _leftLabel.backgroundColor=[UIColor whiteColor];
        _leftLabel.font=[UIFont systemFontOfSize:12];
        _leftLabel.textAlignment=NSTextAlignmentCenter;
        _leftLabel.numberOfLines=0;
        [leftView addSubview:_leftLabel];
        
        //leftBottom
        UIView *leftBottom=[[UIView alloc]initWithFrame:CGRectMake(0, leftView.frame.size.height-bottomHeight,leftView.frame.size.width, bottomHeight)];
        [leftView addSubview:leftBottom];
        leftBottom.backgroundColor=[UIColor whiteColor];
        _Loriginal=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, leftBottom.frame.size.width/4, leftBottom.frame.size.height)];
        _Loriginal.font=[UIFont systemFontOfSize:13];
        _Loriginal.textColor=[UIColor colorWithCSS:@"e897bb"];
        [leftBottom addSubview:_Loriginal];
        _Lcurrent=[[UILabel alloc]initWithFrame:CGRectMake(_Loriginal.frame.size.width, 0, leftBottom.frame.size.width/5*2, leftBottom.frame.size.height)];
        _Lcurrent.font=[UIFont systemFontOfSize:12];
        [leftBottom addSubview:_Lcurrent];
        UILabel *Llabel=[[UILabel alloc]initWithFrame:CGRectMake(150, 0, leftBottom.frame.size.width/5, leftBottom.frame.size.height)];
        Llabel.textColor=[UIColor colorWithCSS:@"aaaaaa"];
        Llabel.font=[UIFont systemFontOfSize:12];
        Llabel.text=@"包邮";
        [leftBottom addSubview:Llabel];
        
        
        
        //rightView
        UIView *rightView=[[UIView alloc]initWithFrame:CGRectMake(leftView.frame.size.width+3*between, between, viewWidth, viewHeight)];
        rightView.tag=10086;
        rightView.backgroundColor=[UIColor colorWithCSS:@"aaaaaa"];
        [self.contentView addSubview:rightView];
        
        //rightTap
        UITapGestureRecognizer *rightTap=[UITapGestureRecognizer new];
        [rightTap addTarget:self action:@selector(tapToGetView:)];
        [rightView addGestureRecognizer:rightTap];
        
        //rightImage
        _rightImage=[[UIImageView alloc]initWithFrame:CGRectMake(between, between,rightView.frame.size.width-2*between, viewHeight-between-labelHeight-bottomHeight)];
        [rightView addSubview:_rightImage];
        
        //rightLabel
        _rightLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,rightView.frame.size.height-labelHeight-bottomHeight, leftView.frame.size.width,labelHeight)];
        _rightLabel.font=[UIFont systemFontOfSize:12];
        _rightLabel.textAlignment=NSTextAlignmentCenter;
        _rightLabel.numberOfLines=0;
        _rightLabel.backgroundColor=[UIColor whiteColor];
        [rightView addSubview:_rightLabel];
        
        //rightBottm
        UIView *rightBottom=[[UIView alloc]initWithFrame:CGRectMake(0, leftView.frame.size.height-bottomHeight,leftView.frame.size.width, bottomHeight)];
        _Roriginal=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, rightBottom.frame.size.width/4, rightBottom.frame.size.height)];
        rightBottom.backgroundColor=[UIColor whiteColor];
        _Roriginal.font=[UIFont systemFontOfSize:13];
        _Roriginal.textColor=[UIColor colorWithCSS:@"e897bb"];
        [rightBottom addSubview:_Roriginal];
        _Rcurrent=[[UILabel alloc]initWithFrame:CGRectMake(_Roriginal.frame.size.width, 0, rightBottom.frame.size.width/5*2, rightBottom.frame.size.height)];
        _Rcurrent.font=[UIFont systemFontOfSize:12];
        
//        NSMutableAttributedString *Ratt=[[NSMutableAttributedString alloc]initWithString:_Rcurrent.text];
//        [Ratt addAttribute:NSStrikethroughStyleAttributeName value:
//         @(NSUnderlineStyleSingle) range:NSMakeRange(0,1)];
//        _Rcurrent.attributedText=Ratt;
        
        [rightBottom addSubview:_Rcurrent];
        UILabel *Rlabel=[[UILabel alloc]initWithFrame:CGRectMake(150, 0, rightBottom.frame.size.width/5, rightBottom.frame.size.height)];
        Rlabel.font=[UIFont systemFontOfSize:12];
        Rlabel.textColor=[UIColor colorWithCSS:@"aaaaaa"];
        Rlabel.text=@"包邮";
        [rightBottom addSubview:Rlabel];
        [rightView addSubview:rightBottom];
    }
    return self;
}

#pragma mark    --------获取点击的view传值到ZhidemaiController--------

-(void)tapToGetView:(UIGestureRecognizer *)tap
{
    if(_delegate&&[_delegate respondsToSelector:@selector(getViewFromCell:)])
    {
        [_delegate getViewFromCell:tap.view];
    }
}



@end
