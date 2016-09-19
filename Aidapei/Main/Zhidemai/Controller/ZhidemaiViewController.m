//
//  ZhidemaiViewController.m
//  Aidapei
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "ZhidemaiViewController.h"
#import "dxbTableViewCell0.h"
#import "dxbTableViewCell2.h"
#import "dxbNetwroking.h"
#import "ZhidemaiModel.h"
#import <UIImageView+WebCache.h>
#import <UIColor+Hex.h>
#import <MBProgressHUD.h>
#import "Const.h"

@interface ZhidemaiViewController ()<UITableViewDataSource,UITableViewDelegate,dxbTableViewCell2Delegate>
{
    NSMutableArray *resultModel;
    UITableView *TV;
    UIView *bgView;
}

@end

@implementation ZhidemaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark    -----------变量初始化-----------
    
    bgView=[[UIView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:bgView];
    resultModel=[[NSMutableArray alloc]initWithCapacity:0];
    
    TV=[[UITableView alloc]initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    TV.delegate=self;
    TV.dataSource=self;
    [self.view addSubview:TV];
    
/*                    进入值得买页面后的初次请求图片
 
#pragma mark    -----------请求图片及封装模组-----------
    [dxbNetwroking requestPictureWithURL:ZhidemaiURLString complete:^(NSError * _Nullable error, id  _Nullable responseObject) {
        if(!error)
        {
            NSArray *list=responseObject[@"list"];
            for(NSDictionary *dict in list)
            {
                ZhidemaiModel *model=[ZhidemaiModel new];
                model.title=dict[@"title"];
                model.pic_url=dict[@"pic_url"];
                model.now_price=[dict[@"now_price"]floatValue];
                model.origin_price=[dict[@"origin_price"]floatValue];
                model.num_iid=dict[@"num_iid"];
                [resultModel addObject:model];
            }
        }
        [TV reloadData];
        
        //隐藏刷新
        [self dismissProgressHUD];
    }];
*/
}

#pragma mark    --------区个数--------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

#pragma mark    --------单元格个数--------

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==1)
    {
        NSLog(@"%ld",resultModel.count);
        return resultModel.count;
    }
    else
    {
        return 1;
    }
}

#pragma mark    --------区头高度--------

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section==1)
    {
        return cell2Hend;
    }
    else
    {
        return 0;
    }
}

#pragma mark    ---------区尾高度-------

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section==0)
    {
        return headHeight;
    }
    else
    {
        return 0;
    }
}

#pragma mark    --------自定义区头--------

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section==1)
    {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width,cell2Hend)];
        
        CGFloat scrollViewHeigh=80;
        CGFloat scrollViewWidht=[UIScreen mainScreen].bounds.size.width;
        CGFloat between=3;
        CGFloat btnWidth=(scrollViewWidht-between*10)/5;
        
        UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,scrollViewWidht, scrollViewHeigh)];
        scrollView.bounces=NO;
        scrollView.contentSize=CGSizeMake((btnWidth+2*between)*11-28, scrollViewHeigh);
        [view addSubview:scrollView];
        
        for(int i=0;i<11;i++)
        {
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(between+(btnWidth+between)*i, 0, btnWidth, scrollViewHeigh)];
            
            NSString *normalImageName=[NSString stringWithFormat:@"category_%d",i+1];
            NSString *selectImageName=[NSString stringWithFormat:@"category_%d_c",i+1];
            
            [button setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(downloadPictureFromURL:) forControlEvents:UIControlEventTouchUpInside];
            button.tag=i+5001;
            
            [scrollView addSubview:button];
        }
        return view;
    }
    else
    {
        return nil;
    }
}

//单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return cell0Height;
    }
    else
    {
        return cell1Height;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZhidemaiModel *leftImage;
    ZhidemaiModel *rightImage;
    
    if(resultModel.count>0)
    {
        leftImage=resultModel[indexPath.row*2];
        rightImage=resultModel[indexPath.row*2+1];
    }
    
    dxbTableViewCell0 *cell0=[tableView dequeueReusableCellWithIdentifier:@"cell0"];
    dxbTableViewCell2 *cell2=[tableView dequeueReusableCellWithIdentifier:@"cell2"];
    
    //tag值重新赋值（防重用）
    cell2.tag=indexPath.row+1;
    cell2.leftImage.image=nil;
    cell2.rightImage.image=nil;
    cell2.leftLabel.text=nil;
    cell2.rightLabel.text=nil;
    cell2.Loriginal.text=nil;
    cell2.Lcurrent.text=nil;
    cell2.Roriginal.text=nil;
    cell2.Rcurrent.text=nil;
    
    [self setValueToCell:cell2 leftImage:leftImage rightImage:rightImage];
    
    if(indexPath.section==0)
    {
        if(!cell0)
        {
            cell0=[[dxbTableViewCell0 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"];
        }
        return cell0;
    }
    else
    {
        if(!cell2)
        {
            cell2=[[dxbTableViewCell2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
            cell2.tag=indexPath.row+1;
        }
        
        if(resultModel.count>0)
        {
            cell2.delegate=self;

            [self setValueToCell:cell2 leftImage:leftImage rightImage:rightImage];
        }
        return cell2;
    }
}

#pragma mark    ------给Cell赋值的方法-------

-(void)setValueToCell:(dxbTableViewCell2 *)cell2 leftImage:(ZhidemaiModel *)leftImage rightImage:(ZhidemaiModel *)rightImage
{
    //设置图片
    [cell2.leftImage sd_setImageWithURL:[NSURL URLWithString:leftImage.pic_url]];
    [cell2.rightImage sd_setImageWithURL:[NSURL URLWithString:rightImage.pic_url]];
    
    //设置标题
    cell2.leftLabel.text=leftImage.title;
    cell2.rightLabel.text=rightImage.title;
    
    //设置价格
    cell2.Lcurrent.text=[NSString stringWithFormat:@"原价%.f",leftImage.origin_price];
    cell2.Loriginal.text=[NSString stringWithFormat:@"￥%.f",leftImage.now_price];
    
    cell2.Rcurrent.text=[NSString stringWithFormat:@"原价%.f",rightImage.origin_price];
    cell2.Roriginal.text=[NSString stringWithFormat:@"￥%.f",rightImage.now_price];
}

#pragma mark    --------切换商品信息--------

-(void)downloadPictureFromURL:(UIButton *)button
{
    
    //显示刷新
    [self showProgressHUD];
    
    [resultModel removeAllObjects];
    NSString *String=[NSString stringWithFormat:@"%@%ld",ZhidemaiURLString,button.tag-5001];
    [dxbNetwroking requestPictureWithURL:String complete:^(NSError * _Nullable error, id  _Nullable responseObject) {
        if(!error)
        {
            NSArray *list=responseObject[@"list"];
            for(NSDictionary *dict in list)
            {
                ZhidemaiModel *model=[ZhidemaiModel new];
                model.title=dict[@"title"];
                model.pic_url=dict[@"pic_url"];
                model.now_price=[dict[@"now_price"]floatValue];
                model.origin_price=[dict[@"origin_price"]floatValue];
                model.num_iid=dict[@"num_iid"];
                [resultModel addObject:model];
            }
        }
        [TV reloadData];
        
        //隐藏刷新
        [self dismissProgressHUD];
    }];
}

#pragma mark    --------刷新控件的展示和隐藏--------

-(void)showProgressHUD
{
    bgView.backgroundColor=[UIColor grayColor];
    bgView.alpha=0.5;
    [self.view bringSubviewToFront:bgView];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)dismissProgressHUD
{
    [self.view sendSubviewToBack:bgView];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    dxbTableViewCell2 *cell=[tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
}

#pragma mark    --------跳转到详细页面---------

-(void)getViewFromCell:(UIView *)view
{
    dxbTableViewCell2*cell=(dxbTableViewCell2 *)view.superview.superview;
    
    if(view.tag==10001)
    {
        ZhidemaiModel *leftModel=resultModel[(cell.tag-1)*2];
        [self gotoDetailWebview:leftModel];
    }
    else
    {
        ZhidemaiModel *rightModel=resultModel[(cell.tag-1)*2+1];
        [self gotoDetailWebview:rightModel];
    }
}

//属性传值（把下一页面要用到的URL传过去）
-(void)gotoDetailWebview:(ZhidemaiModel *)model
{
    UIViewController *detail=[UIViewController new];
    
    NSString *string=[NSString stringWithFormat:@"http://cloud.yijia.com/goto/item.php?app_id=141273368&app_oid=59a2c561033c70eb380a27ddab0e769f13c8483c&app_dtoken=(null)&app_version=3.1.6&app_channel=appstore&sche=aidapei&id=%@",model.num_iid];
    UIWebView *webview=[[UIWebView alloc]initWithFrame:self.view.frame];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:string]]];
    [detail.view addSubview:webview];
    
    [self.navigationController pushViewController:detail animated:YES];
}


@end













