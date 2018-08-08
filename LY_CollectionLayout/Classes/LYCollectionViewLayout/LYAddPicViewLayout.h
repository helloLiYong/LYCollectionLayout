//
//  INSAddPicViewFlowLayout.h
//  Insurance
//
//  Created by 李勇 on 2018/8/1.
//  Copyright © 2018年 com.uqiauto. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYAddPicViewLayout;

@protocol LYAddPicViewLayoutDelegate<NSObject>
@required

/**
 返回实际的总高度

 @param height 高度
 */
-(void)totolHeight:(CGFloat)height;
@optional

/**
 实现代理方法可以自定义列数，默认是4列
 */
-(NSInteger)addPicViewColoumCount;
/**
 实现代理方法可以自定义每行的距离，默认为5
 */
-(NSInteger)addPicViewRowMarge;
/**
 实现代理方法可以自定义每列的距离，默认为5
 */
-(NSInteger)addPicViewColoumMarge;
/**
 实现代理方法可以自定义四周的边距默认上下左右全是5
 */
-(UIEdgeInsets)addLayOutEdgeInset;

/**
 实现代理方法可以每个item的高度，默认和宽度一样
 高度不同就是瀑布流格式
 @param layout layout
 @param index item的index
 @param itemWidth item的宽度
 */
- (CGFloat)addPicViewLayout:(LYAddPicViewLayout *)layout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;
@end
@interface LYAddPicViewLayout : UICollectionViewLayout
/**代理 */
@property(nonatomic,weak)id <LYAddPicViewLayoutDelegate> delegate;
/**图片数组 */
@property(nonatomic,strong)NSArray *imageArray;
/**图片url数组 */
@property(nonatomic,strong)NSArray *imageUrls;
@property(nonatomic,copy)void(^configuraBlock)(LYAddPicViewLayout *layout);

//----------
//链式编程一次性初始化配置
//-----------
-(void)setUpConfiguration:(void(^)(LYAddPicViewLayout *layout))configuraBlock;


/**列数block */
@property(nonatomic,copy)LYAddPicViewLayout*(^colomnCountBlock)(NSInteger count);
/**每行的边距block */
@property(nonatomic,copy)LYAddPicViewLayout*(^rowMargeBlock)(CGFloat rowMarge);

/**每列的边距block */
@property(nonatomic,copy)LYAddPicViewLayout*(^coloumMargeBlock)(CGFloat coloumMarge);
/**四周边距layOut */
@property(nonatomic,copy)LYAddPicViewLayout*(^layoutEdgeInset)(UIEdgeInsets edgeInsets);

@end
