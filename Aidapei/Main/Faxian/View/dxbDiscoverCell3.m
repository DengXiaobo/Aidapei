//
//  dxbDiscoverCell3.m
//  Aidapei
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "dxbDiscoverCell3.h"
#import <UIColor+Hex.h>
@implementation dxbDiscoverCell3

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
        CGFloat between=10;
        CGFloat viewWidth=([UIScreen mainScreen].bounds.size.width-5*between)/4;
        CGFloat viewHeight=80;
        CGFloat labelHeight=20;
        
        NSArray *textArray=@[@"芭比粉",@"经典黑",@"天使白",@"裸色",@"蓝色",@"大红",@"柠檬黄",@"米色",@"优雅紫",@"高级灰",@"橙色",@"棕色",@"驼色",@"藏青",@"绿色",@"枣红",@"宝蓝",@"玫红"];
        for(int i=0;i<18;i++)
        {
            NSString *imageName=[NSString stringWithFormat:@"colour_%d%d",(i/4+1),(i%4+1)];
            
            UIView *view=[[UIView alloc]initWithFrame:CGRectMake(between+(between+viewWidth)*(i%4),(between+viewHeight+labelHeight)*(i/4), viewWidth, viewHeight)];
            [self.contentView addSubview:view];
            
            //按钮
            _button=[[UIButton alloc]initWithFrame:CGRectMake(0,0,viewHeight,viewHeight)];
            [_button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:_button];
            _button.tag=i+1;
            
            //文字
            _label=[[UILabel alloc]initWithFrame:CGRectMake(between/2,_button.frame.size.height,viewWidth,labelHeight)];
            _label.text=textArray[i];
            _label.font=[UIFont systemFontOfSize:15];
            _label.textAlignment=NSTextAlignmentCenter;
            _label.textColor=[UIColor colorWithCSS:@"a7a7a7"];
            [view addSubview:_label];
        }
    }
    return self;
}

-(void)buttonClick:(UIButton *)button
{
    if(_delegate&&[_delegate respondsToSelector:@selector(getWhichButtonInCell3:)])
    {
        [_delegate getWhichButtonInCell3:button];
    }
}

@end
