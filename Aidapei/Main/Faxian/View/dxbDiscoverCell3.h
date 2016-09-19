//
//  dxbDiscoverCell3.h
//  Aidapei
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol dxbDiscoverCell3Delegate;

@interface dxbDiscoverCell3 : UITableViewCell

@property (nonatomic,strong) UIButton *button;

@property (nonatomic,strong) UILabel *label;

@property (nonatomic,weak) id delegate;

@end

@protocol dxbDiscoverCell3Delegate <NSObject>

-(void)getWhichButtonInCell3:(UIButton *)button;

@end

