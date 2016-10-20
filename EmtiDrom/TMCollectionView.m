//
//  ViewController.m
//  EmtiDrom
//
//  Created by Тарас on 15.10.16.
//  Copyright © 2016 Тарас. All rights reserved.
//

#import "TMCollectionView.h"
#import "TMImageCache.h"

@interface TMCollectionView ()

@property (assign, nonatomic) CGFloat cellSize;

@end

@implementation TMCollectionView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    picArray = [NSMutableArray arrayWithCapacity:6];
    [self refreshArray];
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor greenColor];
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:layout];
    
    _collectionView.refreshControl = [[UIRefreshControl alloc] init];
    _collectionView.refreshControl.backgroundColor = [UIColor redColor];
    _collectionView.refreshControl.tintColor = [UIColor whiteColor];
    [_collectionView.refreshControl addTarget:self action:@selector(refreshView) forControlEvents:UIControlEventValueChanged];
    
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"dromCell"];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    _collectionView.frame = self.view.frame;
    _cellSize = [_collectionView bounds].size.width;
    
    [_collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return picArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"dromCell" forIndexPath:indexPath];

    NSString* picURLstring = [NSString stringWithString:[picArray objectAtIndex:indexPath.row]];
    UIImage* pic;
    
    if ([[TMImageCache sharedImageCache] DoesExist:picURLstring]) {
        
        pic = [[TMImageCache sharedImageCache] GetImage:picURLstring];
    } else {
        
        NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:picURLstring]];
        pic = [[UIImage alloc] initWithData:data];
        
        [[TMImageCache sharedImageCache] AddImage:pic imageURL:picURLstring];
    }
    
    UIImageView* picView = [[UIImageView alloc] initWithFrame:cell.bounds];
    picView.image = pic;
    
    [cell.contentView addSubview:picView];
    cell.backgroundColor = [UIColor whiteColor];
    
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [picArray removeObjectAtIndex:indexPath.row];
    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(_cellSize, _cellSize);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 10.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 10.0f;
}

- (void)refreshView {
    
    [self refreshArray];
    [_collectionView.refreshControl endRefreshing];
}


- (void)refreshArray {
    
    [picArray removeAllObjects];
    
    NSString* picURL1 = [NSString stringWithFormat:@"https://pp.vk.me/c638130/v638130073/5a71/NeDdaqPlJ_U.jpg"];
    [picArray addObject:picURL1];
    NSString* picURL2 = [NSString stringWithFormat:@"https://pp.vk.me/c638130/v638130073/5960/PvKaF0Ul880.jpg"];
    [picArray addObject:picURL2];
    NSString* picURL3 = [NSString stringWithFormat:@"https://pp.vk.me/c638130/v638130073/5911/BPO1SuF36sM.jpg"];
    [picArray addObject:picURL3];
    NSString* picURL4 = [NSString stringWithFormat:@"https://pp.vk.me/c837637/v837637951/55e7/GBPEa6m7ZMc.jpg"];
    [picArray addObject:picURL4];
    NSString* picURL5 = [NSString stringWithFormat:@"https://pp.vk.me/c638130/v638130073/5877/g9Igar3RjCQ.jpg"];
    [picArray addObject:picURL5];
    NSString* picURL6 = [NSString stringWithFormat:@"https://pp.vk.me/c638130/v638130073/55cb/K9ATWEWxCEw.jpg"];
    [picArray addObject:picURL6];
    
    [_collectionView reloadData];
}

@end
