//
//  UIImage+lY_Extention.m
//  lYTools
//
//  Created by 李勇 on 2018/7/16.
//  Copyright © 2018年 李勇. All rights reserved.
//

#import "UIImage+lY_Extention.h"

@implementation UIImage (lY_Extention)
- (instancetype)circleImage
{
    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);

    // 上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);

    // 裁剪
    CGContextClip(ctx);

    // 绘制图片
    [self drawInRect:rect];

    // 获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    // 关闭图形上下文
    UIGraphicsEndImageContext();

    return image;
}

+ (instancetype)circleImage:(NSString *)name
{
    return [[self imageNamed:name] circleImage];
}
@end
