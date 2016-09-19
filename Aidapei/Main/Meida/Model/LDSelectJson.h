//
//  LDSelectJson.h
//  Aidapei
//
//  Created by Mr.Mac on 16/7/30.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LDSelectJson : NSObject

//图片URL
@property (nonatomic,strong) NSString *item_pic;

//喜爱数量
@property (nonatomic) NSInteger love;

@property (nonatomic,strong) NSString *content_id;

@property (nonatomic) CGFloat weight;

@property (nonatomic) CGFloat height;

//加入购物车数量
@property (nonatomic) NSInteger count_num;


//小scrollView的数据
@property (nonatomic,strong) NSString *iphoneimg;
@property (nonatomic,strong) NSString *link;



//搭配信息
@property (nonatomic,strong) NSString *num_iid;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *pic_url;
@property (nonatomic,strong) NSString *price;

//活动


@property (nonatomic,strong) NSString *img;
@property (nonatomic,strong) NSString *labelTitle;
@property (nonatomic,strong) NSString *timeoutForIphone;
@property (nonatomic,strong) NSString *links;
@property (nonatomic,strong) NSString *click;

@end
