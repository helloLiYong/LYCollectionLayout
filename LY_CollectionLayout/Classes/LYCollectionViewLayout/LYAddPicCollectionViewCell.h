//
//  LYAddPicCollectionViewCell.h
//  LY_CollectionLayout_Example
//
//  Created by 李勇 on 2018/8/7.
//  Copyright © 2018年 895825110@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  void(^ImageViewDownLoadBlock)(UIImageView *imageView,NSString *imageUrl);
@interface LYAddPicCollectionViewCell : UICollectionViewCell
/**cell的内容图片 */
@property(nonatomic,strong)UIImage *image;
/**cell的位置 */
@property(nonatomic,assign)NSInteger index;
/**图片的url地址 */
@property(nonatomic,copy)NSString *imageUrl;
/**是否是添加图片策略 */
@property(nonatomic,assign)BOOL isAdd;
-(instancetype)initWithFrame:(CGRect)frame;
/**图片下载策略 */
@property(nonatomic,copy)ImageViewDownLoadBlock imageViewDownLoadBlock;

@end
