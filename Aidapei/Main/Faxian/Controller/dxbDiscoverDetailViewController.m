//
//  dxbDiscoverDetailViewController.m
//  Aidapei
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "dxbDiscoverDetailViewController.h"
#import "LDMatchViewController.h"
#import "LDCollectionViewLayout.h"
#import "dxbNetwroking.h"
#import "DiscoverDetailModel.h"
#import "LDSelectJson.h"
#import "Const.h"
//
#import "MeidaViewController.h"
#import "LDSelectCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import <UIColor+Hex.h>
#import "LDMatchViewController.h"

@interface dxbDiscoverDetailViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,LDCollectionViewLayoutDelegate>
{
    CGFloat _screenWidth;
    
    CGFloat _smallScrollHeight;
    
    CGFloat _secondCellHeight;
    
    NSMutableArray *_buttons;
    
    NSMutableArray *_views;
    
    NSMutableArray* _heights;
    
    UICollectionView *collection;
    
    //dxb
    NSMutableArray *resultArray;
}

@end

@implementation dxbDiscoverDetailViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    resultArray=[[NSMutableArray alloc]initWithCapacity:0];
    
    //屏幕宽度
    _screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    _smallScrollHeight = 90;
    
    _secondCellHeight = 500;
    
    
    LDCollectionViewLayout*layout = [[LDCollectionViewLayout alloc]init];
    
    layout.delegate = self;
    
    collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, _screenWidth, self.view.frame.size.height) collectionViewLayout:layout];
    
    collection.delegate = self;
    
    collection.dataSource = self;
    
    collection.backgroundColor = [UIColor colorWithCSS:@"f1f1f1"];
    
    [collection registerClass:[LDSelectCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    
    [self.view addSubview:collection];
    
    //解析数据展示图片
    [self analysisDetailDataWithInternet];
}

#pragma mark    --------解析数据并封装模组--------

-(void)analysisDetailDataWithInternet
{
    [dxbNetwroking requestPictureWithURL:_URLString complete:^(NSError * _Nullable error, id  _Nullable responseObject) {
        if(!error)
        {
            CGFloat space=9.0;
            
            _heights = [[NSMutableArray alloc] initWithCapacity:2];
            
            [_heights addObject:@(9)];
            [_heights addObject:@(9)];
            
            NSArray *array=responseObject;
            for(NSDictionary *result in array)
            {
                DiscoverDetailModel *model=[DiscoverDetailModel new];
                model.item_pic=result[@"item_pic"];
                model.love=result[@"love"];
                model.content_id=result[@"content_id"];
                model.count_num=result[@"count_num"];
                model.weight=result[@"weight"];
                model.height=[result[@"height"]floatValue]/2;
                [resultArray addObject:model];
                
                CGFloat left = [_heights[0] floatValue];
                CGFloat right = [_heights[1] floatValue];
                
                //图片高度
                CGFloat height=model.height*2;
                if (left > right) {
                    
                    //更新右列的高度。原来的高度＋间距＋新增高度。
                    _heights[1] = @(right + space + height);
                }else {
                    
                    //更新左列的高度。
                    _heights[0] = @(left + space + height);
                }
                
                _secondCellHeight = MAX([_heights[0] floatValue], [_heights[1] floatValue]);
            }
            [collection reloadData];
        }
    }];
    
    [collection reloadData];
}

#pragma mark -------UICollectionViewDataSource协议
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return resultArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LDSelectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    
    DiscoverDetailModel *model = resultArray[indexPath.item];
    
    //ULR
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.item_pic]];
    cell.imageView.autoresizingMask=UIViewAutoresizingFlexibleHeight;
    
    //收藏
    [cell.leftButton setTitle:[NSString stringWithFormat:@"%@",model.love] forState:UIControlStateNormal];
    cell.leftButton.autoresizingMask=UIViewAutoresizingFlexibleTopMargin;
    
    //添加购物车
    [cell.rightButton setTitle:[NSString stringWithFormat:@"%@",model.count_num] forState:UIControlStateNormal];
    cell.rightButton.autoresizingMask=UIViewAutoresizingFlexibleTopMargin;
    
    return cell;
    
}

#pragma mark -------LDCollectionViewLayoutDelegate协议

- (CGFloat)heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DiscoverDetailModel *model = resultArray[indexPath.item];
    
    CGFloat height = model.height;
    
    return height;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LDSelectJson *model=resultArray[indexPath.item];
    NSString *URLString=[NSString stringWithFormat:@"%@%@",DiscoverThreeURL,model.content_id];
    
    LDMatchViewController *LDMatch=[LDMatchViewController new];
    LDMatch.select=model;
    LDMatch.urlstring=@"http://cloud.yijia.com/goto/item.php?app_id=141273368&app_oid=11baea23eedc88f48cf9768919605cbd7bc1831c&app_dtoken=(null)&app_version=3.1.6&app_channel=appstore&sche=aidapei&id=";
    LDMatch.URLString=URLString;
    
    //传二级页面的model到三级页面，用于收藏
    DiscoverDetailModel *detailModel=resultArray[indexPath.item];
    LDMatch.DiscoverDetailmodel=detailModel;
    self.tabBarController.tabBar.hidden=YES;
    [self.navigationController pushViewController:LDMatch animated:YES];
}

@end
















