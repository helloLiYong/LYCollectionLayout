

#import "LYAddPicViewLayout.h"

@interface LYAddPicViewLayout()
/** 存放所有cell的布局属性 */
@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *attrsArray;
@property(nonatomic,assign)CGFloat contentHeight;
/**列数 */
@property(nonatomic,assign)NSInteger coloumCount;

@property(nonatomic,assign)NSInteger rowMarge;
@property(nonatomic,assign)NSInteger coloumMarge;
@property(nonatomic,strong)NSMutableArray *columnHeights;
/**<#type#> */
@property(nonatomic,assign)UIEdgeInsets defaultEdgeInset;
-(void)defaultEdgeInset;
@end
@implementation LYAddPicViewLayout

-(void)setUpConfiguration:(void (^)(LYAddPicViewLayout *))configuraBlock{

    self.configuraBlock = configuraBlock;
    if (configuraBlock) {
        configuraBlock(self);
    }


    [self.collectionView reloadData];

}
-(LYAddPicViewLayout *(^)(NSInteger))colomnCountBlock{
    return ^(NSInteger colomnCount){
        self.coloumCount = colomnCount;
        return self;
    };
}
-(LYAddPicViewLayout *(^)(CGFloat))rowMargeBlock{
    return ^(CGFloat rowMarge){
        self.rowMarge = rowMarge;
        return self;
    };
}
-(LYAddPicViewLayout *(^)(CGFloat))coloumMargeBlock{
    return ^(CGFloat coloumMarge){
        self.coloumMarge = coloumMarge;
        return self;
    };
}
-(LYAddPicViewLayout *(^)(UIEdgeInsets))layoutEdgeInset{
    return ^(UIEdgeInsets inset){
        self.defaultEdgeInset = inset;
        return self;
    };
}

-(NSInteger)coloumCount{
    if (self.configuraBlock) {
        return _coloumCount;
    }else{
        NSInteger count = 0;
        if ([self.delegate respondsToSelector:@selector(addPicViewColoumCount)]) {
            count = [self.delegate addPicViewColoumCount];

        }else{
            count = 4;
        }
        return count;
    }

}
-(NSInteger)rowMarge{

    if (self.configuraBlock) {
        return _rowMarge;
    }else{
        NSInteger marge = 0;
        if ([self.delegate respondsToSelector:@selector(addPicViewRowMarge)]){
            marge = [self.delegate addPicViewRowMarge];

        }else{
            marge = 5;
        }
        return marge;
    }
}
-(NSInteger)coloumMarge{
    if (self.configuraBlock) {
        return _coloumMarge;
    }else{
        NSInteger marge = 0;
        if ([self.delegate respondsToSelector:@selector(addPicViewColoumMarge)]) {
            marge = [self.delegate addPicViewColoumMarge];
        }else{
            marge = 5;
        }
        return marge;
    }
}
-(UIEdgeInsets)defaultEdgeInset{
    if (self.configuraBlock == nil) {
        if ([self.delegate respondsToSelector:@selector(addLayOutEdgeInset)]) {
            return  [self.delegate addLayOutEdgeInset];
        }else{
            return UIEdgeInsetsMake(10, 10, 10, 10);
        }
    }else{
        return _defaultEdgeInset;
    }
}
- (NSMutableArray *)columnHeights
{
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}
-(void)prepareLayout{
    [super prepareLayout];
    [self.columnHeights removeAllObjects];
    [self.attrsArray removeAllObjects];
    for (int i = 0; i<self.coloumCount; i++) {
        [self.columnHeights addObject:@(10)];
    }
    NSInteger count  = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attri = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attri];
    }
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attrsArray;
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attri = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    // collectionView的宽度
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    CGFloat width = (collectionViewW - self.defaultEdgeInset.left - self.defaultEdgeInset.right - (self.coloumCount - 1) * self.coloumMarge) / self.coloumCount;
    CGFloat height = width;
    if ([self.delegate respondsToSelector:@selector(addPicViewLayout:heightForItemAtIndex:itemWidth:)]) {
        height = [self.delegate addPicViewLayout:self heightForItemAtIndex:indexPath.item itemWidth:width];
    }
    NSInteger desColumn = 0;
    CGFloat minHeightColum = [self.columnHeights[desColumn] doubleValue];

    for (int i = 1;  i < self.coloumCount; i++) {
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        if (minHeightColum > columnHeight) {
            desColumn = i;
            minHeightColum = columnHeight;

        }
    }
    CGFloat x = self.defaultEdgeInset.left + (self.coloumMarge + width) * desColumn;

    CGFloat y =  self.rowMarge + minHeightColum;
    if (indexPath.item / self.coloumCount == 0) {
        y =  self.defaultEdgeInset.top;
    }
    attri.frame = CGRectMake(x, y, width, height);

    self.columnHeights[desColumn] = @(CGRectGetMaxY(attri.frame));
    CGFloat colH = [self.columnHeights[0] doubleValue];
    for (int i = 1; i<self.columnHeights.count; i++) {
        if (colH < [self.columnHeights[i] doubleValue]) {
            colH = [self.columnHeights[i] doubleValue];
        }
    }
    self.contentHeight = colH;

    return attri;
}
-(CGSize)collectionViewContentSize{
    if ([self.delegate respondsToSelector:@selector(totolHeight:)]) {
        [self.delegate totolHeight:self.contentHeight];
    }
    return CGSizeMake(0, self.contentHeight);
}
@end
