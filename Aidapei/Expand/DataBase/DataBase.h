//
//  DataBase.h
//  Aidapei
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBase : NSObject

+(instancetype)sharedDataBase;

//插入数据
-(void)insertDataToCollection:(NSString *)height data:(NSData *)image love:(NSString *)love car:(NSString *)count_num;

//删除数据
-(void)deleteDataToCollection:(NSString *)height data:(NSData *)image love:(NSString *)love car:(NSString *)count_num;

@end
