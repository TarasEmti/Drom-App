//
//  ViewController.h
//  EmtiDrom
//
//  Created by Тарас on 15.10.16.
//  Copyright © 2016 Тарас. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMCollectionView : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

{
    UICollectionView *_collectionView;
    NSMutableArray* picArray;
}

@end

