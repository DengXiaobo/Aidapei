//
//  dxbDiscoverCell2.h
//  Aidapei
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol dxbDiscoverCell2Delegate;

@interface dxbDiscoverCell2 : UITableViewCell

@property (nonatomic,strong) UIButton *button;

@property (nonatomic,strong) UILabel *label;

@property (nonatomic,weak) id delegate;

@end

@protocol dxbDiscoverCell2Delegate <NSObject>

-(void)getWhichButtonInCell2:(UIButton *)button;

@end