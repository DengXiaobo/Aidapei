//
//  dxbSettingViewController.m
//  Aidapei
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "dxbSettingViewController.h"
#import <UIColor+Hex.h>

@interface dxbSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *TV;
}

@end

@implementation dxbSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TV=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    TV.delegate=self;
    TV.dataSource=self;
    [self.view addSubview:TV];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        if(indexPath.row==1||indexPath.row==3||indexPath.row==4||indexPath.row==6)
        {
            if(indexPath.row==1)
            {
                cell.textLabel.text=@"当前版本";
                cell.detailTextLabel.text=@"3.2.2";
            }
            else if(indexPath.row==3)
            {
                cell.textLabel.text=@"关于我们";
            }
            else if(indexPath.row==4)
            {
                cell.textLabel.text=@"好友分享";
            }
            else
            {
                cell.textLabel.text=@"清除缓存";
            }
        }
        else
        {
            cell.backgroundColor=[UIColor colorWithCSS:@"eeeeee"];
        }
    }
    return cell;
}

#pragma mark    --------单元格选中方法--------

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
}
@end

















