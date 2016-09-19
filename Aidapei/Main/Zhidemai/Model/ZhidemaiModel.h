//
//  ZhidemaiModel.h
//  Aidapei
//
//  Created by mac1 on 7/31/16.
//  Copyright © 2016 com.Aidapei.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZhidemaiModel : NSObject

//标题
@property(nonatomic,copy)NSString * title;
//图片
@property(nonatomic,copy)NSString * pic_url;
//现价
@property(nonatomic,assign)CGFloat now_price;
//原价
@property(nonatomic,assign)CGFloat origin_price;
//详细页面
@property (nonatomic,copy) NSString *num_iid;

@end
