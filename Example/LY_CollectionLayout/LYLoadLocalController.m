
#import "LYLoadLocalController.h"
#import <LY_CollectionLayout/LYCollectionViewLayoutHeader.h>
#import "UIImageView+WebCache.h"
#import <LY_tool/UIView+lY_Extension.h>
@interface LYLoadLocalController ()<LYAddPicViewLayoutDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
/**本地图片数组 */
@property(nonatomic,strong)NSMutableArray *imageArray;
/**collectionView */
@property(nonatomic,weak)LYAddPicCollectionView *collectionView;
/**<#注释#> */
@property(nonatomic,weak)LYAddPicViewLayout *layout;
@end

@implementation LYLoadLocalController
-(NSMutableArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return  _imageArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"Untitled"];
    UIImage *image2 = [UIImage imageNamed:@"Untitled2"];
    UIImage *image3 = [UIImage imageNamed:@"Untitled3"];
    UIImage *image4 = [UIImage imageNamed:@"Untitled4"];
    UIImage *image5 = [UIImage imageNamed:@"Untitled2"];
    UIImage *image6 = [UIImage imageNamed:@"Untitled3"];
    UIImage *image7 = [UIImage imageNamed:@"Untitled4"];
    [self.imageArray addObject:image];
    [self.imageArray addObject:image2];
    [self.imageArray addObject:image3];
    [self.imageArray addObject:image4];
    [self.imageArray addObject:image5];
    [self.imageArray addObject:image6];
    [self.imageArray addObject:image7];

    LYAddPicViewLayout *layout = [[LYAddPicViewLayout alloc]init];
    self.layout = layout;
    //通过链式配置列数，行间距，列间距，四周边距。 链式配置会覆盖代理设置
    [layout setUpConfiguration:^(LYAddPicViewLayout *layout) {
        layout.colomnCountBlock(4).coloumMargeBlock(10).layoutEdgeInset(UIEdgeInsetsMake(10, 10, 10, 5)).rowMargeBlock(10);
    }];
    layout.delegate = self;
    LYAddPicCollectionView *collectionView = [[LYAddPicCollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout isAdd:YES];
    self.collectionView = collectionView;
    collectionView.backgroundColor = [UIColor redColor];
    collectionView.imageArray = self.imageArray;
    [self.view addSubview:collectionView];


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KAddPicClickAddNotiClick) name:@"KAddPicClickAddNoti" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KAddPicClickImageShowBigImageClick) name:@"KAddPicClickImageShowBigImageNoti" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KAddPicClickDeleImageClick:) name:@"KAddPicClickDeleImageNoti" object:nil];
}
#pragma mark ---- 通过代理配置列数，行间距，列间距，四周边距
-(NSInteger)addPicViewColoumCount{
    return 3;

}
-(NSInteger)addPicViewRowMarge{
    return 10;
}
-(NSInteger)addPicViewColoumMarge{
    return 10;
}
-(UIEdgeInsets)addLayOutEdgeInset{
    return UIEdgeInsetsMake(20,0, 20, 0);
}
- (CGFloat)addPicViewLayout:(LYAddPicViewLayout *)layout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth{
    return itemWidth;
}
-(void)KAddPicClickAddNotiClick{
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"选择图片" message:@"" preferredStyle:(UIAlertControllerStyleActionSheet)];
    UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"相机" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
        ipc.delegate = self;
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:ipc animated:YES completion:nil];
    }];

    UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"相册" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
        ipc.delegate = self;
        ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:ipc animated:YES completion:nil];
    }];
    UIAlertAction *alertAction3 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {

    }];

    [alertCon addAction:alertAction1];
    [alertCon addAction:alertAction2];
    [alertCon addAction:alertAction3];


    [self presentViewController:alertCon animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.imageArray addObject:image];
    self.collectionView.imageArray = self.imageArray;
}
-(void)totolHeight:(CGFloat)height{
    if (height < self.collectionView.ly_height) {
        self.collectionView.ly_height = height + 5;
    }
}
-(void)KAddPicClickImageShowBigImageClick{
    [self dismissViewControllerAnimated:YES completion:nil];

}
-(void)KAddPicClickDeleImageClick:(NSNotification *)sender{
    NSInteger index = [sender.object integerValue];
    [self.imageArray removeObjectAtIndex:index];
    self.collectionView.imageArray = self.imageArray;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
