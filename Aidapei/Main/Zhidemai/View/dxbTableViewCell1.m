//
//  dxbTableViewCell1.m
//  Aidapei
//
//  Created by mac on 16/7/30.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "dxbTableViewCell1.h"

@implementation dxbTableViewCell1

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
        CGFloat scrollViewHeigh=80;
        CGFloat scrollViewWidht=[UIScreen mainScreen].bounds.size.width;
        CGFloat between=3;
        CGFloat btnWidth=(scrollViewWidht-between*10)/5;
        
        UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,scrollViewWidht, scrollViewHeigh)];
        scrollView.contentSize=CGSizeMake((btnWidth+2*between)*11-28, scrollViewHeigh);
        scrollView.backgroundColor=[UIColor blueColor];
        [self.contentView addSubview:scrollView];
        
        
        for(int i=0;i<11;i++)
        {
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(between+(btnWidth+between)*i, 0, btnWidth, scrollViewHeigh)];
            
            NSString *normalImageName=[NSString stringWithFormat:@"category_%d",i+1];
            NSString *selectImageName=[NSString stringWithFormat:@"category_%d_c",i+1];
            
            [button setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
            button.tag=i+1;
            
            [scrollView addSubview:button];
        }
        
        
    }
    return self;
}
@end


















