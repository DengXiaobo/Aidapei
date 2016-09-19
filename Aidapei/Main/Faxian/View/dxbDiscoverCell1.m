//
//  dxbDiscoverCell1.m
//  Aidapei
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "dxbDiscoverCell1.h"
#import <UIColor+Hex.h>

@implementation dxbDiscoverCell1

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
        
        NSArray *textArray=@[@"连衣裙",@"T恤",@"衬衫",@"毛衣",@"毛针织衫",@"雪纺蕾丝衫",@"短外套",@"卫衣",@"棉衣",@"风衣",@"皮衣",@"西装",@"羽绒服",@"毛呢外套",@"马甲",@"皮草",@"套装"];
        for(int i=0;i<17;i++)
        {
            NSString *imageName=[NSString stringWithFormat:@"up_%d%d",(i/4+1),(i%4+1)];
            
            UIView *view=[[UIView alloc]initWithFrame:CGRectMake(between+(between+viewWidth)*(i%4),(between+viewHeight+labelHeight)*(i/4), viewWidth, viewHeight)];
            [self.contentView addSubview:view];
            
            //按钮
            _button=[[UIButton alloc]initWithFrame:CGRectMake(0,0,viewHeight,viewHeight)];
            [_button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            [view addSubview:_button];
            [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [_button becomeFirstResponder];
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
    if(_delegate&&[_delegate respondsToSelector:@selector(getWhichButtonInCell1:)])
    {
        [_delegate getWhichButtonInCell1:button];
    }
    
    NSLog(@"%ld",button.tag);
}
@end















