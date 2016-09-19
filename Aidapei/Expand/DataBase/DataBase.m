//
//  DataBase.m
//  Aidapei
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "DataBase.h"
#import <FMDB.h>

@interface DataBase ()
{
    FMDatabase *db;
}

@end

@implementation DataBase

+(instancetype)sharedDataBase
{
    static DataBase* database = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        database=[[DataBase alloc]init];
    });
    return database;
}

#pragma mark    --------创建数据库文件--------

-(instancetype)init
{
    self=[super init];
    if(self)
    {
        
        NSFileManager *manager=[NSFileManager defaultManager];
        NSString *dbFilePath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/collection.sqlite"];
        if(![manager fileExistsAtPath:dbFilePath])
        {
            [manager createFileAtPath:dbFilePath contents:nil attributes:nil];
        }
        
        db=[[FMDatabase alloc]initWithPath:dbFilePath];
        
        [db open];
        
        NSString *createTableSQL=@"CREATE TABLE IF NOT EXISTS Collection ('love' string,'count_num' string ,'height' string,'image' data,id integer NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE)";
        
        BOOL result=[db executeUpdate:createTableSQL];
        
        NSLog(@"%@",result?@"创建成功":@"创建表失败");
        [db close];
    }
    return self;
}

-(void)insertDataToCollection:(NSString *)height data:(NSData *)image love:(NSString *)love car:(NSString *)count_num
{
    [db open];
    NSString *insertSQL=@"INSERT INTO Collection (love, count_num, height , image) VALUES (?, ?, ? ,?)";
    BOOL result=[db executeUpdate:insertSQL];
    NSLog(@"%@",result?@"插入数据成功":@"插入数据失败");
    [db close];
}

-(void)deleteDataToCollection:(NSString *)height data:(NSData *)image love:(NSString *)love car:(NSString *)count_num
{
    
}



@end



























