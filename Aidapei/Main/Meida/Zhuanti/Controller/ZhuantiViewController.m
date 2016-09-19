//
//  ZhuantiViewController.m
//  Aidapei
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "ZhuantiViewController.h"
#import "dxbNetwroking.h"
#import "Const.h"
#import "mdztModel.h"
#import <UIImageView+WebCache.h>

@interface ZhuantiViewController ()
{
    UITableView *TV;
    
    NSMutableArray *resultArray;
}

@end

@implementation ZhuantiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(UIScrollView *)getThreeViewInSelect
{
    NSInteger cellCount=14;
    CGFloat between=10;
    
    resultArray=[[NSMutableArray alloc]initWithCapacity:0];

    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.contentSize=CGSizeMake(self.view.frame.size.width,viewHeight*cellCount);
    
    [dxbNetwroking requestPictureToMeidaZhuanTi:mdztURL page:0 complete:^(NSError * _Nullable error, id  _Nullable responseObject) {
        
        for(NSDictionary *dict in responseObject)
        {
            static NSInteger i=0;
            
            NSArray *data=dict[@"data"];
            
            UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, (between+viewHeight)*i, self.view.frame.size.width,viewHeight)];
            [view addSubview:[self showCelltoView:data]];
            [scrollView addSubview:view];
            
            _leftLable.text=dict[@"title"];
            
            i++;
        }
        
    }];
    
    return scrollView;
    
}

-(UIView *)showCelltoView:(NSArray *)data
{
    CGFloat viewWidth=[UIScreen mainScreen].bounds.size.width;
    CGFloat upViewHeight=60;
    
    CGFloat between=5;
    CGFloat imageWidth=(viewWidth-4*between)/3;
    CGFloat imageHeight=(viewHeight-2*between-upViewHeight)/2;
    
    UIView *CellView=[[UIView alloc]initWithFrame:CGRectMake(between,between, viewWidth, viewHeight)];
    
    //背景View
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(between,between, viewWidth-between*2, viewHeight-between)];
    [CellView addSubview:view];
    
    //标题所在的View
    UIView *upView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, viewWidth, upViewHeight)];
    [view addSubview:upView];
    
    //左侧Label
    _leftLable=[[UILabel alloc]initWithFrame:CGRectMake(10, upViewHeight/3, viewWidth/2,upViewHeight/3)];
    [upView addSubview:_leftLable];
    
    //右侧Label
    _rightLable=[[UILabel alloc]initWithFrame:CGRectMake(viewWidth-110, upViewHeight/3, 100,upViewHeight/3)];
    _rightLable.text=@"查看更多";
    [upView addSubview:_rightLable];
    
    
    //图片所在的View
    UIView *downView=[[UIView alloc]initWithFrame:CGRectMake(0, upView.frame.size.height, viewWidth, viewHeight-upViewHeight-between)];
    [view addSubview:downView];
    
    //图片
    for(int i=0;i<6;i++)
    {
        UIImageView *Image=[[UIImageView alloc]initWithFrame:CGRectMake((between+imageWidth)*(i%3),((between/2)+imageWidth)*(i/3), imageWidth, imageHeight)];
        [downView addSubview:Image];
        [Image sd_setImageWithURL:[NSURL URLWithString:data[i]]];
    }
    return CellView;
}

@end






















