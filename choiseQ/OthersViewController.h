//
//  OthersViewController.h
//  choiseQ
//
//  Created by Ken Yagura on 13/07/21.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OthersItem.h"
#import "OthersItemList.h"
#import "OthersCollectionViewCell.h"

@interface OthersViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>{
    OthersItem *tmpItem;
}
@property (weak, nonatomic) IBOutlet UICollectionView *_collectionView;
@property (retain, nonatomic) OthersItemList *items;
@property (retain, nonatomic) OthersItem *tmpItem;

@end


__strong NSMutableArray *_items;