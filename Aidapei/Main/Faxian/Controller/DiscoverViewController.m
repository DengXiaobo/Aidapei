//
//  DiscoverViewController.m
//  Aidapei
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "DiscoverViewController.h"
#import "dxbDiscoverCell0.h"
#import "dxbDiscoverCell1.h"
#import "dxbDiscoverCell2.h"
#import "dxbDiscoverCell3.h"
#import "dxbNetwroking.h"
#import "Const.h"
#import "DiscoverModel.h"
#import "dxbDiscoverDetailViewController.h"

@interface DiscoverViewController ()<UITableViewDelegate,UITableViewDataSource,dxbDiscoverCell1Delegate,dxbDiscoverCell2Delegate,dxbDiscoverCell3Delegate>
{
    NSMutableArray *upModelArray;
    NSMutableArray *downModelArray;
    NSMutableArray *colorModelArray;
    
    UITableView *TV;
}

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    upModelArray=[[NSMutableArray alloc]initWithCapacity:0];
    downModelArray=[[NSMutableArray alloc]initWithCapacity:0];
    colorModelArray=[[NSMutableArray alloc]initWithCapacity:0];
    
    
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2.5-64);
    scrollView.bounces=NO;
    [self.view addSubview:scrollView];
    
    TV=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,scrollView.contentSize.height) style:UITableViewStylePlain];
    TV.delegate=self;
    TV.dataSource=self;
    TV.scrollEnabled=NO;
    [scrollView addSubview:TV];
    
    [self analysisDataWithInternet];
}

#pragma mark    --------返回单元格个数--------

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

#pragma mark    --------返回单元格高度--------

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==1)
    {
        return 120;
    }
    else if (indexPath.row==3)
    {
        return 110*5;
    }
    else if (indexPath.row==5)
    {
        return 110*2;
    }
    else if (indexPath.row==7)
    {
        return 110*5;
    }

    else
    {
        return 44;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *titleCell=[tableView dequeueReusableCellWithIdentifier:@"titleCell"];
    dxbDiscoverCell0 *cell0=[tableView dequeueReusableCellWithIdentifier:@"discoverCell0"];
    dxbDiscoverCell1 *cell1=[tableView dequeueReusableCellWithIdentifier:@"discoverCell1"];
    dxbDiscoverCell2 *cell2=[tableView dequeueReusableCellWithIdentifier:@"discoverCell2"];
    dxbDiscoverCell3 *cell3=[tableView dequeueReusableCellWithIdentifier:@"discoverCell3"];
    
    CGFloat cellWidth=[UIScreen mainScreen].bounds.size.width;
    
    if(indexPath.row%2==0)
    {
        if(!titleCell)
        {
            titleCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleCell"];
            NSArray *titleArray=@[@"hot_category",@"women_coat",@"women_trousers",@"women_colours"];
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cellWidth, titleCell.frame.size.height)];
            titleCell.imageView.image=[UIImage imageNamed:titleArray[indexPath.row/2]];
            [titleCell.contentView addSubview:imageView];
        }
        return titleCell;
    }
    else if(indexPath.row==1)
    {
        if(!cell0)
        {
            cell0=[[dxbDiscoverCell0 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"discoverCell0"];
        }
        return cell0;
    }
    else if(indexPath.row==3)
    {
        if(!cell0)
        {
            cell1=[[dxbDiscoverCell1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"discoverCell1"];
            cell1.delegate=self;
        }
        return cell1;
    }
    else if (indexPath.row==5)
    {
        if(!cell2)
        {
            cell2=[[dxbDiscoverCell2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"discoverCell2"];
            cell2.delegate=self;
        }
        return cell2;
    }
    else
    {
        if(!cell2)
        {
            cell3=[[dxbDiscoverCell3 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"discoverCell3"];
            cell3.delegate=self;
        }
        return cell3;
    }
}

#pragma mark    --------请求数据解析并封装模组--------

-(void)analysisDataWithInternet
{
    [dxbNetwroking requestPictureWithURL:DiscoverURL complete:^(NSError * _Nullable error, id  _Nullable responseObject) {
        if(!error)
        {
            NSArray *Ladies_coat=responseObject[@"Ladies_coat"];
            NSArray *Under_ms=responseObject[@"Under_ms"];
            NSArray *Color=responseObject[@"Color"];
            for(NSDictionary *result in Ladies_coat)
            {
                DiscoverModel *Model=[DiscoverModel new];
                Model.name=result[@"name"];
                Model.cun=result[@"cun"];
                [upModelArray addObject:Model];
            }
            
            for(NSDictionary *result in Under_ms)
            {
                DiscoverModel *Model=[DiscoverModel new];
                Model.name=result[@"name"];
                Model.cun=result[@"cun"];
                [downModelArray addObject:Model];
            }
            
            for(NSDictionary *result in Color)
            {
                DiscoverModel *Model=[DiscoverModel new];
                Model.name=result[@"name"];
                Model.cun=result[@"cun"];
                [colorModelArray addObject:Model];
            }
        }
    }];
    
    [TV reloadData];
}


#pragma mark    --------Cell的协议方法--------

//Cell1
-(void)getWhichButtonInCell1:(UIButton *)button
{
    DiscoverModel *model=upModelArray[button.tag-1];
    [self gotoDiscoverDetailViewController:model];
}

//Cell2
-(void)getWhichButtonInCell2:(UIButton *)button
{
    DiscoverModel *model=downModelArray[button.tag-1];
    [self gotoDiscoverDetailViewController:model];
}

//cell3
-(void)getWhichButtonInCell3:(UIButton *)button
{
    DiscoverModel *model=colorModelArray[button.tag-1];
    [self gotoDiscoverDetailViewController:model];}


#pragma mark    --------传值并跳转页面--------

-(void)gotoDiscoverDetailViewController:(DiscoverModel *)model
{
    NSString *string=[NSString stringWithFormat:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/zuimei_fenlei/zuimeidapei_fenlei_json.php?content_id=%@",model.cun];
    dxbDiscoverDetailViewController *viewController=[dxbDiscoverDetailViewController new];
    viewController.URLString=string;
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
















