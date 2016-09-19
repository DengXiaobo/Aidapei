//
//  LDhttpEngine.m
//  Aidapei
//
//  Created by Mr.Mac on 16/7/30.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "LDhttpEngine.h"

#import <AFNetworking/AFNetworking.h>
#import "Const.h"

@implementation LDhttpEngine

//获取精选接口
+ (void)requsetSelectComplete:(complete)complete{
    
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    //指定返回二进制数据
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    NSString *URL = @"http://app.api.repaiapp.com/sx/yangshijie/jiekou/zuimei_jingxuan/zuimei_jingxuan_json.php?app_id=141273368&app_oid=28f0a1ca67a5c8025961a2ab667e0c563aacd06d&app_dtoken=(null)&app_version=3.1.6&app_channel=appstore&sche=aidapei&page=4";
    
    
    
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSMutableDictionary *result=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        
        
        complete(nil,result);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        complete(error,nil);
        NSLog(@"获取精选接口失败==%@",error);
        
    }];
    
}

+ (void)requsetSelectScrollComplete:(complete)complete{
    

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    
    //指定返回二进制数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *URL = @"http://cloud.yijia.com/yunying/zhuanti.php?app_id=141273368&app_oid=11baea23eedc88f48cf9768919605cbd7bc1831c&app_dtoken=(null)&app_version=3.1.6&app_channel=appstore&sche=aidapei";
    
    
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        complete(nil,dict);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        NSLog(@"error = %@",error);
        
    }];
    
}

+ (void)requsetMatchURL:(NSString *)URL Complete:(complete)complete{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    //指定返回二进制数据

    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    

    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSMutableDictionary *result=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //NSString* data = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        complete(nil,dict);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    
        NSLog(@"error = %@",error);
    
    }];
    
    
}

+(void)requsetActionComplete:(complete)complete{
    
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    //指定返回二进制数据
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    NSString *URL = @"http://app.api.repaiapp.com/sx/yangshijie/h5gai/xj_html_huodong/huodong_flag.php?app_id=141273368&app_oid=11baea23eedc88f48cf9768919605cbd7bc1831c&app_dtoken=(null)&app_version=3.1.6&app_channel=appstore&sche=aidapei";
    
    
    
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSMutableDictionary *result=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        
        
        complete(nil,result);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        complete(error,nil);
        NSLog(@"获取精选接口失败==%@",error);
        
    }];

    
    
    
}

@end
