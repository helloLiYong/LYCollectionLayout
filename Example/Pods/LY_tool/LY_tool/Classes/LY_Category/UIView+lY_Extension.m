
#import "UIView+lY_Extension.h"

@implementation UIView (lY_Extension)

- (CGSize)ly_size
{
    return self.frame.size;
}

- (void)setLy_size:(CGSize)ly_size
{
    CGRect frame = self.frame;
    frame.size = ly_size;
    self.frame = frame;
}

- (CGFloat)ly_width
{
    return self.frame.size.width;
}

- (CGFloat)ly_height
{
    return self.frame.size.height;
}

- (void)setLy_width:(CGFloat)ly_width
{
    CGRect frame = self.frame;
    frame.size.width = ly_width;
    self.frame = frame;
}

- (void)setLy_height:(CGFloat)ly_height
{
    CGRect frame = self.frame;
    frame.size.height = ly_height;
    self.frame = frame;
}

- (CGFloat)ly_x
{
    return self.frame.origin.x;
}

- (void)setLy_x:(CGFloat)ly_x
{
    CGRect frame = self.frame;
    frame.origin.x = ly_x;
    self.frame = frame;
}

- (CGFloat)ly_y
{
    return self.frame.origin.y;
}

- (void)setLy_y:(CGFloat)ly_y
{
    CGRect frame = self.frame;
    frame.origin.y = ly_y;
    self.frame = frame;
}

- (CGFloat)ly_centerX
{
    return self.center.x;
}

- (void)setLy_centerX:(CGFloat)ly_centerX
{
    CGPoint center = self.center;
    center.x = ly_centerX;
    self.center = center;
}

- (CGFloat)ly_centerY
{
    return self.center.y;
}

- (void)setLy_centerY:(CGFloat)ly_centerY
{
    CGPoint center = self.center;
    center.y = ly_centerY;
    self.center = center;
}

- (CGFloat)ly_right
{

    return CGRectGetMaxX(self.frame);
}

- (CGFloat)ly_bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setLy_right:(CGFloat)ly_right
{
    self.ly_x = ly_right - self.ly_width;
}

- (void)setLy_bottom:(CGFloat)ly_bottom
{
    self.ly_y = ly_bottom - self.ly_height;
}

+ (instancetype)viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (BOOL)intersectWithView:(UIView *)view
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect selfRect = [self convertRect:self.bounds toView:window];
    CGRect viewRect = [view convertRect:view.bounds toView:window];
    return CGRectIntersectsRect(selfRect, viewRect);
}
@end
