//
//  dxbNetwroking.m
//  Aidapei
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "dxbNetwroking.h"
#import <AFNetworking.h>

@implementation dxbNetwroking

//请求图片
+(void)requestPictureWithURL:(NSString *)URLString complete:(complete)complete
{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        complete(nil,dict);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"图片请求失败——%@",error);
    }];
}

//详细页面——返回字典
+(void)requestDetailWebWithURL:(NSString *)URLString numiid:(NSString *)numID complete:(complete)complete
{
    NSDictionary *dict=@{
                         @"app_id":@"141273368",
                         @"app_oid":@"59a2c561033c70eb380a27ddab0e769f13c8483c",
                         @"app_dtoken":@"",
                         @"app_version":@"3.1.6",
                         @"app_channel":@"appstore",
                         @"sche":@"aidapei",
                         @"id":numID};
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    [manager GET:URLString parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网页请求失败——%@",error);
    }];
}

+(void)requestDiscoverDetailWebWithURL:(NSString *)URLString content_id:(NSString *)content_id complete:(complete)complete
{
    NSDictionary *dict=@{@"content_id":content_id};
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:URLString parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray *mutableArray=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        complete(nil,mutableArray);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网页请求失败——%@",error);
    }];
}

//请求“美搭——专题”一级页面
+(void)requestPictureToMeidaZhuanTi:(NSString *)URLString page:(NSInteger)page complete:(complete)complete
{
    NSString *Page=[NSString stringWithFormat:@"%ld",page];
    NSDictionary *dict=@{@"page":Page};
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:URLString parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *array=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        complete(nil,array);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网页请求失败——%@",error);
    }];
}




@end
























