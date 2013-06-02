//
//  ViewController.h
//  choiseQ
//
//  Created by Ken Yagura on 13/05/06.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iAd/iAd.h"

@interface ViewController : UIViewController<ADBannerViewDelegate> {
    ///// 広告用　/////
    BOOL bannerIsVisible;
    ///// ここまで広告用　/////

}

///// 広告用　/////
@property (nonatomic, assign) BOOL bannerIsVisible;
@property (weak, nonatomic) ADBannerView *adView;
///// ここまで広告用　/////

///// 広告用　/////
- (void)viewIAdBox:(ADBannerView *)_adView;
///// ここまで広告用　/////
@end
