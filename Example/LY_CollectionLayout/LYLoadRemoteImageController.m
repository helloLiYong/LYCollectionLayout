
#import "LYLoadRemoteImageController.h"
#import <LY_CollectionLayout/LYCollectionViewLayoutHeader.h>
#import  <LY_tool/UIView+lY_Extension.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface LYLoadRemoteImageController ()<LYAddPicViewLayoutDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
/**collectionView */
@property(nonatomic,weak)LYAddPicCollectionView *collectionView;
/**<#注释#> */
@property(nonatomic,strong)NSMutableArray *imageUrls;

@end

@implementation LYLoadRemoteImageController
-(NSMutableArray *)imageUrls{
    if (_imageUrls == nil) {
        _imageUrls = [NSMutableArray array];
    }
    return _imageUrls;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KAddPicClickImageUrlShowBigImageClick:) name:@"KAddPicClickImageUrlShowBigImage" object:nil];

    NSString *string1 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533628711623&di=82f362b0050130ec15d19b084ab35c2a&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20150907%2Fmp30906533_1441629699374_2.jpeg";
    NSString *string2 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533628711622&di=98cf9dab3cac5b3195f0cdebbc78c44d&imgtype=0&src=http%3A%2F%2Fs7.sinaimg.cn%2Fmw690%2F006LDoUHzy7auXtxWOG16%26690";
    NSString *string3 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533628711620&di=42dfd1ceb98d7c85d25f61957523bd79&imgtype=0&src=http%3A%2F%2Fs13.sinaimg.cn%2Fbmiddle%2F64863d5b4817bf7bc8dbc%26690";
    NSString *string4 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533628711618&di=7876bd9a699ac5e2d1a8312270527357&imgtype=0&src=http%3A%2F%2Fwww.shtimg.com%2Fforum%2F201507%2F09%2F111753hmplmt7672milmmp.jpg";
    NSArray *imageUrls = @[string1,string2,string3,string4];
    [self.imageUrls addObjectsFromArray:imageUrls];
    LYAddPicViewLayout *layout = [[LYAddPicViewLayout alloc]init];
    layout.delegate = self;
    LYAddPicCollectionView *collectionView = [[LYAddPicCollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout isAdd:YES];
    self.collectionView = collectionView;
    [collectionView downLoadCollectionItemImageviewWithImageUrl:imageUrls Option:^(UIImageView *imageView, NSString *imageUrl) {
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    }];
    collectionView.backgroundColor = [UIColor redColor];
    [self.view addSubview:collectionView];


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KAddPicClickAddNotiClick) name:@"KAddPicClickAddNoti" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KAddPicClickDeleImageClick:) name:@"KAddPicClickDeleImageNoti" object:nil];


    // Do any additional setup after loading the view.
}
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
-(void)KAddPicClickImageUrlShowBigImageClick:(NSNotification *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)totolHeight:(CGFloat)height{
    
    if (height < self.collectionView.ly_height) {
        self.collectionView.ly_height = height + 5;
    }

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
    [self.imageUrls addObject:@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1534327347&di=5626e3f063309c9966cd02a2e502bade&src=http://s8.sinaimg.cn/middle/8ee3e0acxb0171b491f27&690"];
    self.collectionView.imageUrls = self.imageUrls;
}

-(void)KAddPicClickDeleImageClick:(NSNotification *)sender{
    NSInteger index = [sender.object integerValue];
    [self.imageUrls removeObjectAtIndex:index];
    self.collectionView.imageUrls = self.imageUrls;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
