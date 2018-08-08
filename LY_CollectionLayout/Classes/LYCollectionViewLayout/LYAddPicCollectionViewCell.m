
#import "LYAddPicCollectionViewCell.h"
#import  "LY_tool/UIView+lY_Extension.h"
@interface LYAddPicCollectionViewCell()
/**内容图片 */
@property(nonatomic,weak)UIImageView *imageView;
/**删除图片按钮 */
@property(nonatomic,weak)UIButton *deleButton;

@end
@implementation LYAddPicCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        self.imageView = imageView;
        imageView.userInteractionEnabled = YES;


        UIButton *deleButton = [[UIButton alloc]init];
        self.deleButton = deleButton;
        [deleButton addTarget:self action:@selector(deleClick) forControlEvents:(UIControlEventTouchUpInside)];
        [deleButton setBackgroundImage:[UIImage imageNamed:@"delete"] forState:(UIControlStateNormal)];
        [imageView addSubview:deleButton];

        [self addSubview:imageView];
        [self addSubview:imageView];
    }

    return self;
}
-(void)setImage:(UIImage *)image{
    _image = image;
    if (self.isAdd) {
        if (image == nil) {
            self.imageView.image = [UIImage imageNamed:@"addImage"];
            self.deleButton.hidden = YES;
            UITapGestureRecognizer *addClickTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addClick)];
            [self.imageView addGestureRecognizer:addClickTap];
        }else{
            self.imageView.image = self.image;
            self.deleButton.hidden = NO;
            UITapGestureRecognizer *addClickTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageShow)];
            [self.imageView addGestureRecognizer:addClickTap];
        }
    }else{
        self.imageView.image = self.image;
        self.deleButton.hidden = YES;
        UITapGestureRecognizer *addClickTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageShow)];
        [self.imageView addGestureRecognizer:addClickTap];
    }
}
-(void)setImageUrl:(NSString *)imageUrl{
    _imageUrl = imageUrl;
    if (self.isAdd) {

        self.deleButton.hidden = NO;

    }else{
        self.deleButton.hidden = YES;
    }
    UITapGestureRecognizer *addClickTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageUrlshow)];
    [self.imageView addGestureRecognizer:addClickTap];

    if (self.imageViewDownLoadBlock) {
        self.imageViewDownLoadBlock(self.imageView, imageUrl);
    }
}
-(void)addClick{
    NSLog(@"点击了添加图片按钮---请监听名称为KAddPicClickAddNoti的通知");

    [[NSNotificationCenter defaultCenter] postNotificationName:@"KAddPicClickAddNoti" object:nil];
}
-(void)imageUrlshow{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"index"] = @(self.index);
    dic[@"selectImage"] = self.imageUrl;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"KAddPicClickImageUrlShowBigImage" object:nil userInfo:dic];
    NSLog(@"---请监听名称为KAddPicClickImageUrlShowBigImage的通知userInfo=%@",dic);
}
-(void)imageShow{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"index"] = @(self.index);
    dic[@"selectImage"] = self.image;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"KAddPicClickImageShowBigImageNoti" object:nil userInfo:dic];
    NSLog(@"---请监听名称为KAddPicClickImageShowBigImage的通知userInfo=%@",dic);
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;

    self.deleButton.ly_width = self.deleButton.currentBackgroundImage.size.width;
    self.deleButton.ly_height = self.deleButton.currentBackgroundImage.size.height;
    self.deleButton.ly_x = self.imageView.ly_width - self.deleButton.ly_width;
    self.deleButton.ly_y = 0;
}
-(void)deleClick{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"KAddPicClickDeleImageNoti" object:@(self.index)];
    NSLog(@"点击了删除图片按钮---请监听名称为KAddPicClickDeleImageNoti的通知noti.objc=%zd",self.index);

}
@end
