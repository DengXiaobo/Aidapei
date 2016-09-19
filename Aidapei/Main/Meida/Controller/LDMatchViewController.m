//
//  LDMatchViewController.m
//  Aidapei
//
//  Created by Mr.Mac on 16/8/3.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "LDMatchViewController.h"
#import <UIImageView+WebCache.h>
#import "LDhttpEngine.h"
#import "LDTaoBaoViewController.h"
#import "DataBase.h"

@interface LDMatchViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    UIBarButtonItem *_rightButton;
    
    NSMutableArray *_result;
    
    CGFloat _height;
    
    UITableView *_tableView;
}

@end

@implementation LDMatchViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    _result = [[NSMutableArray alloc]initWithCapacity:0];
    
    self.navigationItem.title = @"搭配信息";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"total_back_btn"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];

    self.navigationItem.leftBarButtonItem = leftButton;
    
    _rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"like"] style:UIBarButtonItemStylePlain target:self action:@selector(collect)];
    
    self.navigationItem.rightBarButtonItem = _rightButton;
    
    _height = self.select.height * 2;

  
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    _tableView.bounces = NO;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    [self matchJson];
    
}

#pragma mark -------搭配信息
-(void)matchJson{
    
   // NSString *contentId = self.select.content_id;
    
    //NSString *URL = [NSString stringWithFormat:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/zuimei_jingxuan/zuimei_jingxuan_json.php?&content_id=%@",self.select.content_id];
    
    [LDhttpEngine requsetMatchURL:_URLString Complete:^(NSError * _Nullable error, id  _Nullable responseObject) {
        
        NSArray *data = responseObject[@"data"];
        
        for (NSDictionary *dict in data) {
            
            LDSelectJson *match = [[LDSelectJson alloc]init];
            
            match.num_iid = dict[@"num_iid"];
            
            match.title = dict[@"title"];
            
            match.pic_url = dict[@"pic_url"];
            
            match.price = dict[@"price"];
            //NSLog(@"%@",match.title);
            
            
            [_result addObject:match];
            
            
        }
        
        [_tableView reloadData];
        
        
    }];
    
    
    
}





-(void)back{
    
    self.tabBarController.tabBar.hidden = NO;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)collect{
    
    DataBase *dataBase=[DataBase sharedDataBase];
    NSString *imageHeight=[NSString stringWithFormat:@"%f",_DiscoverDetailmodel.height];
    
    UIImageView *imageView=[[UIImageView alloc]init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:_DiscoverDetailmodel.item_pic]];
    
    NSData *data=UIImageJPEGRepresentation(imageView.image, 0.5);
    [dataBase insertDataToCollection:imageHeight data: data love:_DiscoverDetailmodel.love car:_DiscoverDetailmodel.count_num];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return _result.count + 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
   
    
    
    if (indexPath.section == 0) {
        
        
        return _height;
        
        
    }else{
        
        
        return 60;
        
      }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (indexPath.section == 0) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 0, self.view.frame.size.width - 24, _height)];
        
        NSString *URL = self.select.item_pic;
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:URL]];
        
        [cell.contentView addSubview:imageView];
        
    }else{
        
        if (_result.count > 0) {
            LDSelectJson *match = _result[indexPath.section - 1];
            
            UIImageView *topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 0, 58, 60)];
            
            [topImageView sd_setImageWithURL:[NSURL URLWithString:match.pic_url]];
            [cell.contentView addSubview:topImageView];
            
            
            UILabel *topLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(topImageView.frame)+10, 0, 220, 30)];
            topLabel.textAlignment = NSTextAlignmentLeft;
            topLabel.text = match.title;
            topLabel.font = [UIFont systemFontOfSize:13];
            [cell.contentView addSubview:topLabel];
            
            
            UILabel *bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(topImageView.frame)+10, 30, 150, 30)];
            bottomLabel.text = match.price;
            bottomLabel.textColor = [UIColor redColor];
            bottomLabel.font = [UIFont systemFontOfSize:13];
            bottomLabel.textAlignment = NSTextAlignmentLeft;
            [cell.contentView addSubview:bottomLabel];
            
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, self.view.frame.size.width - 24, 60);
            [button setImage:[UIImage imageNamed:@"dapei_shangpin"] forState:UIControlStateNormal];
            button.tag = indexPath.section;
            
            
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.contentView addSubview:button];
        }
        
        
    }
      
    return cell;
    
}

-(void)buttonClick:(UIButton*)sender{
    
    
    
    LDSelectJson *match = _result[sender.tag - 1];
    
   
    
    NSString *URL = [NSString stringWithFormat:@"%@%@",self.urlstring,match.num_iid];
    
    
    
    LDTaoBaoViewController *taobaoVC = [[LDTaoBaoViewController alloc]init];
    
    taobaoVC.URL = URL;
    
    taobaoVC.text = match.title;
    
    
    [self.navigationController pushViewController:taobaoVC animated:YES];
    
    
    
    
    
}



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return nil;
    }else if (section == 1){
        
        NSString *string = @"搭配商品链接";
        
        return string;
        
    }else{
        
        
        return nil;
        
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        
        return 0;
        
    }else if (section == 1){
        
        
        return 36;
    }else{
        
        
        return 10;
        
    }
        
    
    
}

@end
