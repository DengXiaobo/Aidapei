//
//  LDCollectionViewLayout.h
//  Aidapei
//
//  Created by Mr.Mac on 16/7/30.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LDCollectionViewLayoutDelegate <NSObject>

- (CGFloat)heightForItemAtIndexPath:(NSIndexPath* )indexPath;

@end

@interface LDCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, weak) id<LDCollectionViewLayoutDelegate> delegate;



@end
