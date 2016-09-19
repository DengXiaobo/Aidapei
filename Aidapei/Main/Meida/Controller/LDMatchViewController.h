//
//  LDMatchViewController.h
//  Aidapei
//
//  Created by Mr.Mac on 16/8/3.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDSelectJson.h"
#import "DiscoverDetailModel.h"

@interface LDMatchViewController : UIViewController

@property (nonatomic,strong) LDSelectJson *select;

@property (nonatomic,strong) DiscoverDetailModel *DiscoverDetailmodel;

@property (nonatomic,copy) NSString *URLString;


@property (nonatomic,copy) NSString *urlstring;


@end
