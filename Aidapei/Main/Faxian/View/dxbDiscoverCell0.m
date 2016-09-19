//
//  dxbDiscoverCell0.m
//  Aidapei
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "dxbDiscoverCell0.h"
#import <UIColor+Hex.h>

@implementation dxbDiscoverCell0

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
        CGFloat between=15;
        CGFloat btnWidth=([UIScreen mainScreen].bounds.size.width-5*between)/4;
        CGFloat btnHeight=20;
        
        NSArray *array=@[@"秋冬外套",@"气质风衣",@"时髦牛仔裤",@"遮小肚腩",@"遮粗手臂",@"显腰身",@"雪纺",@"舒适棉麻",@"最潮截短款"];
        for(int i=0;i<9;i++)
        {
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(between+(between+btnWidth)*(i%4),between+(between+btnHeight)*(i/4), btnWidth, btnHeight)];
            [button setTitle:array[i] forState:UIControlStateNormal];
            button.titleLabel.font=[UIFont systemFontOfSize:15];
            [button setTitleColor:[UIColor colorWithCSS:@"787878"] forState:UIControlStateNormal];
            [self.contentView addSubview:button];
        }
    }
    return self;
}

@end
