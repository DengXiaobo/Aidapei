//
//  dxbNetwroking.h
//  Aidapei
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^complete)(NSError *_Nullable error,id _Nullable responseObject);

@interface dxbNetwroking : NSObject

//请求图片
+(void)requestPictureWithURL:(NSString *)URLString complete:(complete)complete;

//请求详细页面
+(void)requestDetailWebWithURL:(NSString *)URLString content_id:(NSString *)content_id complete:(complete)complete;

//请求“发现”二级页面
+(void)requestDiscoverDetailWebWithURL:(NSString *)URLString content_id:(NSString *)content_id complete:(complete)complete;

//请求“美搭——专题”一级页面
+(void)requestPictureToMeidaZhuanTi:(NSString *)URLString page:(NSInteger)page complete:(complete)complete;


@end

NS_ASSUME_NONNULL_END
