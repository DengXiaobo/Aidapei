//
//  dxbTableViewCell3.h
//  Aidapei
//
//  Created by mac on 16/7/30.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol dxbTableViewCell2Delegate;

@interface dxbTableViewCell2 : UITableViewCell

@property (nonatomic,strong) UIImageView *leftImage;

@property (nonatomic,strong) UIImageView *rightImage;

@property (nonatomic,strong) UILabel *leftLabel;

@property (nonatomic,strong) UILabel *rightLabel;

@property (nonatomic,strong) UILabel *Loriginal;

@property (nonatomic,strong) UILabel *Lcurrent;

@property (nonatomic,strong) UILabel *Roriginal;

@property (nonatomic,strong) UILabel *Rcurrent;

@property (nonatomic,weak) id delegate;

@end

@protocol dxbTableViewCell2Delegate <NSObject>
//传cell中点击的哪个view
-(void)getViewFromCell:(UIView *)view;

@end
