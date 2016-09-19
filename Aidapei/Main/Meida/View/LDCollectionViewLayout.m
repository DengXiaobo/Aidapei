//
//  LDCollectionViewLayout.m
//  Aidapei
//
//  Created by Mr.Mac on 16/7/30.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "LDCollectionViewLayout.h"

@interface LDCollectionViewLayout () {
    
    NSMutableArray* _itemLayoutAttributes;
    
    //左右两列的高度。0，左边，1，右边。
    NSMutableArray* _heights;
}

@end

@implementation LDCollectionViewLayout

//计算每个 item 的 frame，封装在 UICollectionViewLayoutAttributes 对象中，然后保存起来。
- (void)prepareLayout {
    
    _itemLayoutAttributes = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    CGFloat space = 9.0f;
    
    CGFloat width = (self.collectionView.frame.size.width - space * 3) / 2;
    
    _heights = [[NSMutableArray alloc] initWithCapacity:2];
    
    //默认左右高度都为 10。
    [_heights addObject:@(9)];
    [_heights addObject:@(9)];
    
    
    //获取有多少个区
    NSInteger sections = [self.collectionView numberOfSections];
    
    //遍历每个区。
    for (NSInteger section = 0; section < sections; section++) {
        
        //获取区中有多少元素。
        NSInteger items = [self.collectionView numberOfItemsInSection:section];
        
        //遍历每个元素，为其设置 frame。
        for (NSInteger item = 0; item < items; item++) {
            
            NSIndexPath* indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            
            //通过 delegate 获得 item 的高度。
            CGFloat height = [_delegate heightForItemAtIndexPath:indexPath] + 23;
            
            CGFloat x = 0.0f;
            CGFloat y = 0.0f;
            
            CGFloat left = [_heights[0] floatValue];
            CGFloat right = [_heights[1] floatValue];
            
            //新的 item 放在较短的一列。
            if (left > right) {
                
                //放在右边。
                x = space * 2 + width;
                
                y = right + space;
                
                //更新右列的高度。原来的高度＋间距＋新增高度。
                _heights[1] = @(right + space + height);
            }else {
                
                //放在左边。
                x = space;
                
                y = left + space;
                
                //更新左列的高度。
                _heights[0] = @(left + space + height);
            }
            
            CGRect frame = CGRectMake(x, y, width, height);
            
            //把 frame 封装在 attr 中。
            UICollectionViewLayoutAttributes* attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            
            attr.frame = frame;
            
            [_itemLayoutAttributes addObject:attr];
        }
    }
    
    
    
    
}

//返回 collectionView 的 contentSize。
- (CGSize)collectionViewContentSize {
    
    //高度为左右两列，较长的一列的高度。
    return CGSizeMake(self.collectionView.frame.size.width, MAX([_heights[0] floatValue], [_heights[1] floatValue]));
}

//返回在 rect 区域内需要展示的 item 的 frame。
- (NSArray* )layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray* result = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (UICollectionViewLayoutAttributes* attr in _itemLayoutAttributes) {
        
        if (CGRectIntersectsRect(rect, attr.frame)) {
            
            //如果两个 rect 有交集，说明这个 item 需要显示在屏幕内。
            
            [result addObject:attr];
        }
    }
    
    return result;
}

@end