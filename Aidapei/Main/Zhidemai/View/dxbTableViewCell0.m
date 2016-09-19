//
//  dxbTableViewCell0.m
//  Aidapei
//
//  Created by mac on 16/7/30.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "dxbTableViewCell0.h"

@implementation dxbTableViewCell0

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
        CGFloat viewHeight=150;
        CGFloat viewWidth=[UIScreen mainScreen].bounds.size.width;
        
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0,10,viewWidth,viewHeight)];
        [self.contentView addSubview:view];
        
        UIImageView *leftImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,(viewWidth-1)/2, viewHeight)];
        leftImage.image=[UIImage imageNamed:@"20yuan"];
        UIImageView *rightImmage=[[UIImageView alloc]initWithFrame:CGRectMake(leftImage.frame.size.width+1, 0, (viewWidth-1)/2, viewHeight)];
        rightImmage.image=[UIImage imageNamed:@"renqi"];
        [view addSubview:leftImage];
        [view addSubview:rightImmage];
    }
    return self;
}

@end
