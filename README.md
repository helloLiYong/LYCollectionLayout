# LY_CollectionLayout

[![CI Status](https://img.shields.io/travis/895825110@qq.com/LY_CollectionLayout.svg?style=flat)](https://travis-ci.org/895825110@qq.com/LY_CollectionLayout)
[![Version](https://img.shields.io/cocoapods/v/LY_CollectionLayout.svg?style=flat)](https://cocoapods.org/pods/LY_CollectionLayout)
[![License](https://img.shields.io/cocoapods/l/LY_CollectionLayout.svg?style=flat)](https://cocoapods.org/pods/LY_CollectionLayout)
[![Platform](https://img.shields.io/cocoapods/p/LY_CollectionLayout.svg?style=flat)](https://cocoapods.org/pods/LY_CollectionLayout)

## Example

主要实现代码：
LYAddPicViewLayout *layout = [[LYAddPicViewLayout alloc]init];
    self.layout = layout;
    //通过链式配置列数，行间距，列间距，四周边距。 链式配置会覆盖代理设置
    [layout setUpConfiguration:^(LYAddPicViewLayout *layout) {
        layout.colomnCountBlock(4).coloumMargeBlock(10).layoutEdgeInset(UIEdgeInsetsMake(10, 10, 10, 5)).rowMargeBlock(10);
    }];
    layout.delegate = self;
    LYAddPicCollectionView *collectionView = [[LYAddPicCollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout isAdd:YES];
    self.collectionView = collectionView;
    collectionView.imageArray = self.imageArray;
    [self.view addSubview:collectionView];

## Requirements

## Installation

LY_CollectionLayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LY_CollectionLayout'
```

## Author

895825110@qq.com, 895825110@qq.com

## License

LY_CollectionLayout is available under the MIT license. See the LICENSE file for more info.
