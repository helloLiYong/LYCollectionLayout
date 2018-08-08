//
//  LYAddPicCollectionView.h
//  LY_CollectionLayout_Example
//
//  Created by 李勇 on 2018/8/7.
//  Copyright © 2018年 895825110@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYAddPicCollectionViewCell.h"

@interface LYAddPicCollectionView : UICollectionView

/**
 图片数组
 */
@property(nonatomic,strong)NSArray *imageArray;
/**图片的URL数组 */
@property(nonatomic,strong)NSArray *imageUrls;

/**
 加载远程图片

 @param imageUrls 图片url数组
 @param downOption 加载策略，用什么加载
 */
-(void)downLoadCollectionItemImageviewWithImageUrl:(NSArray *)imageUrls Option:(ImageViewDownLoadBlock)downOption;
/**下载图片的策略 */
@property(nonatomic,copy)ImageViewDownLoadBlock imageDownLoadBlock;

/**
 初始化方法

 @param frame frame
 @param layout 初始的layout
 @param isAdd 是否是添加图片策略，如果是远程url一般为NO
 @return 
 */
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout isAdd:(BOOL)isAdd;
@end
