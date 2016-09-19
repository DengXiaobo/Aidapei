//
//  LDhttpEngine.h
//  Aidapei
//
//  Created by Mr.Mac on 16/7/30.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^complete)(NSError* _Nullable error,id _Nullable responseObject);

@interface LDhttpEngine : NSObject

//获取精选接口
+ (void)requsetSelectComplete:(complete)complete;

+ (void)requsetSelectScrollComplete:(complete)complete;

//获取搭配信息接口
+ (void)requsetMatchURL:(NSString *)URL Complete:(complete)complete;

//活动接口
+(void)requsetActionComplete:(complete)complete;


@end



NS_ASSUME_NONNULL_END
