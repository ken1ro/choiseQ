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
#import "iAd/iAd.h"

@interface OthersViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate,ADBannerViewDelegate>{
    OthersItem *tmpItem;
    ///// 広告用　/////
    BOOL bannerIsVisible;
    ///// ここまで広告用　/////
}
@property (weak, nonatomic) IBOutlet UICollectionView *_collectionView;
@property (retain, nonatomic) OthersItemList *items;
@property (retain, nonatomic) OthersItem *tmpItem;

///// 広告用　/////
@property (nonatomic, assign) BOOL bannerIsVisible;
@property (weak, nonatomic) ADBannerView *adView;
///// ここまで広告用　/////

///// 広告用　/////
- (void)viewIAdBox:(ADBannerView *)_adView;
///// ここまで広告用　/////


@end


__strong NSMutableArray *_items;