

#import <UIKit/UIKit.h>

@interface UIView (lY_Extension)
@property (nonatomic, assign) CGSize ly_size;
@property (nonatomic, assign) CGFloat ly_width;
@property (nonatomic, assign) CGFloat ly_height;
@property (nonatomic, assign) CGFloat ly_x;
@property (nonatomic, assign) CGFloat ly_y;
@property (nonatomic, assign) CGFloat ly_centerX;
@property (nonatomic, assign) CGFloat ly_centerY;

@property (nonatomic, assign) CGFloat ly_right;
@property (nonatomic, assign) CGFloat ly_bottom;

+ (instancetype)viewFromXib;

- (BOOL)intersectWithView:(UIView *)view;
@end
