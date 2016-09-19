//
//  dxbDiscoverCell1.h
//  Aidapei
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol dxbDiscoverCell1Delegate;

@interface dxbDiscoverCell1 : UITableViewCell

@property (nonatomic,strong) UIButton *button;

@property (nonatomic,strong) UILabel *label;

@property (nonatomic,weak)id delegate;

@end

@protocol dxbDiscoverCell1Delegate <NSObject>

-(void)getWhichButtonInCell1:(UIButton *)button;

@end
