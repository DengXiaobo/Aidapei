//
//  MyViewController.m
//  Aidapei
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "MyViewController.h"
#import "dxbCollectionViewController.h"
#import "dxbConnectUSViewController.h"
#import "dxbSettingViewController.h"
#import <UIColor+Hex.h>
#import "Const.h"

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *TV;
    CGFloat headHeight;
    CGFloat section0;
    CGFloat scrollViewHeight;
}

@end

@implementation MyViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+50);
    scrollView.backgroundColor=[UIColor grayColor];
    scrollView.bounces=NO;
    scrollView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:scrollView];
    
    TV=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    TV.delegate=self;
    TV.dataSource=self;
    TV.scrollEnabled=NO;
    [scrollView addSubview:TV];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    //区头高度
    headHeight=10;
    //平均每个区的高度
    section0=self.view.frame.size.height/4.2;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 1;
    }
    else if (section==3)
    {
        return 2;
    }
    else
    {
        return 3;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return section0-64;
    }
    else
    {
        return section0/3;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width,headHeight+64)];
    headView.backgroundColor=[UIColor colorWithCSS:@"eeeeee"];
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
        return headHeight+64;
    }
    else
    {
        return headHeight;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *headCell=[tableView dequeueReusableCellWithIdentifier:@"headcell"];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(indexPath.section==0)
    {
        if(!headCell)
        {
            headCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headcell"];
            headCell.imageView.image=[UIImage imageNamed:@"geren_00"];
            headCell.textLabel.text=@"登录淘宝";
            headCell.textLabel.textColor=[UIColor colorWithCSS:@"797979"];
            headCell.textLabel.font=[UIFont systemFontOfSize:18];
            headCell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        return headCell;
    }
    else
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.font=[UIFont systemFontOfSize:15];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        if(indexPath.section==1)
        {
            NSArray *text=[[NSArray alloc]initWithObjects:@"我的订单",@"购物车",@"我的物流", nil];
            NSString *imageName=[NSString stringWithFormat:@"geren_0%ld",indexPath.row+1];
            cell.imageView.image=[UIImage imageNamed:imageName];
            cell.textLabel.text=text[indexPath.row];
        }
        else if (indexPath.section==2)
        {
            NSArray *text=[[NSArray alloc]initWithObjects:@"我的收藏",@"最近浏览",@"联系我们", nil];
            NSString *imageName=[NSString stringWithFormat:@"geren_0%ld",indexPath.row+4];
            cell.imageView.image=[UIImage imageNamed:imageName];
            cell.textLabel.text=text[indexPath.row];
        }
        else if(indexPath.section==3)
        {
            NSArray *text=[[NSArray alloc]initWithObjects:@"设置",@"常见问题", nil];
            NSString *imageName=[NSString stringWithFormat:@"geren_0%ld",indexPath.row+7];
            cell.imageView.image=[UIImage imageNamed:imageName];
            cell.textLabel.text=text[indexPath.row];
        }
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    cell.selected=!cell.selected;
    
    
    if(indexPath.section==2)
    {
        if(indexPath.row==0)
        {
            //收藏
            dxbCollectionViewController *collection=[dxbCollectionViewController new];
            [self.navigationController pushViewController:collection animated:YES];
        }
        else if (indexPath.row==2)
        {
            dxbConnectUSViewController *connect=[dxbConnectUSViewController new];
            [self.navigationController pushViewController:connect animated:YES];
        }
        else
        {
            UIViewController *VC=[UIViewController new];
            
            UIWebView *webview=[[UIWebView alloc]initWithFrame:self.view.frame];
            [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:browse]]];
            [VC.view addSubview:webview];
            
            [self.navigationController pushViewController:VC animated:YES];
        }
    }
    else if(indexPath.section==3)
    {
        if(indexPath.row==0)
        {
            dxbSettingViewController *setting=[dxbSettingViewController new];
            [self.navigationController pushViewController:setting animated:YES];
        }
        else
        {
            UIViewController *VC=[UIViewController new];
            
            UIWebView *webview=[[UIWebView alloc]initWithFrame:self.view.frame];
            [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:question]]];
            [VC.view addSubview:webview];
            
            [self.navigationController pushViewController:VC animated:YES];
        }
    }
    else
    {
        #pragma mark    -------处理页面跳转------
        
        NSURL *URL;
        NSArray *URLArray=@[Login,contact,shopping,logistics,browse,question];
        if(indexPath.section==0)
        {
            URL=[NSURL URLWithString:Login];
        }
        else if (indexPath.section==1)
        {
            URL=[NSURL URLWithString:URLArray[indexPath.row+1]];
        }
        UIViewController *VC=[UIViewController new];
        
        UIWebView *webview=[[UIWebView alloc]initWithFrame:self.view.frame];
        [webview loadRequest:[NSURLRequest requestWithURL:URL]];
        [VC.view addSubview:webview];
        
        self.tabBarController.tabBar.hidden=YES;
        [self.navigationController pushViewController:VC animated:YES];
    }
}

@end























