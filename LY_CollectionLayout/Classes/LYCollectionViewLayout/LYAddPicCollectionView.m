
#import "LYAddPicCollectionView.h"
#import "LYAddPicViewLayout.h"
@interface LYAddPicCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)LYAddPicViewLayout *layout;
/**是否是添加图片策略 */
@property(nonatomic,assign)BOOL isAdd;
@end
@implementation LYAddPicCollectionView
static NSString *_cellID = @"INSAddPicView";

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout isAdd:(BOOL)isAdd{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.isAdd = isAdd;
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource =self;
        [self registerClass:[LYAddPicCollectionViewCell class] forCellWithReuseIdentifier:_cellID];
    }

    return self;
}
-(void)downLoadCollectionItemImageviewWithImageUrl:(NSArray *)imageUrls Option:(ImageViewDownLoadBlock)downOption{
    if (imageUrls.count == 0)  return;
    __weak typeof(self) weakSelf = self;
    weakSelf.imageUrls = imageUrls;
    if (downOption) {
        weakSelf.imageDownLoadBlock = downOption;
    }
    self.layout.imageUrls = imageUrls;
    [self reloadData];
}
-(void)setImageUrls:(NSArray *)imageUrls{
    _imageUrls = imageUrls;
    self.layout.imageUrls = imageUrls;
    [self reloadData];
}
-(void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    self.layout.imageArray = imageArray;
    [self reloadData];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.isAdd) {
        if (self.imageUrls.count > 0) {
            return self.imageUrls.count + 1;
        }else{
            return self.imageArray.count + 1;
        }
    }else{
        if (self.imageUrls.count > 0) {
            return self.imageUrls.count;
        }else{
            return self.imageArray.count ;
        }
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LYAddPicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellID forIndexPath:indexPath];
    cell.isAdd = self.isAdd;
    cell.index = indexPath.item;
    cell.imageViewDownLoadBlock = self.imageDownLoadBlock;
    if (self.isAdd) {
        if (self.imageUrls.count > 0) {
            if (indexPath.item < self.imageUrls.count) {
                cell.image =  self.imageUrls[indexPath.item];
            }else{
                cell.image = nil;
            }
        }else{
            if (indexPath.item < self.imageArray.count) {
                cell.image =  self.imageArray[indexPath.item];
            }else{
                cell.image = nil;
            }
        }
    }else{
        if (self.imageUrls.count > 0) {
            cell.imageUrl =  self.imageUrls[indexPath.item];
        }else{
            cell.image =  self.imageArray[indexPath.item];
        }
    }
    return cell;
}

-(void)totolHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height += 10;
    self.frame = frame;
}
@end
