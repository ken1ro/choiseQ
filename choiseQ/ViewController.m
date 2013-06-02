//
//  ViewController.m
//  choiseQ
//
//  Created by Ken Yagura on 13/05/06.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end



@implementation ViewController
@synthesize bannerIsVisible;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //後で消す
    //debug
    NSLog(@"ViewController viewDidLoad");
    
    
    //////////////////////////    広告表示用    //////////////////////////
    ADBannerView *adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    //最初は画面外に表示
    adView.frame = CGRectOffset(adView.frame, 0.0f, self.view.frame.size.height);
    adView.delegate = self;
    // 縦向き    adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    // 横向き    adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    [self.view addSubview:adView];
    [self viewIAdBox:adView];
    //////////////////////////// ここまで広告　//////////////////////////////

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - iAd Delegate
/*//////////////////////////////////////////////////////////
 広告表示用の諸々の関数
 広告表示する場合はここから下が必要
 *///////////////////////////////////////////////////////////


-(void)viewIAdBox:(ADBannerView *)_adView{
    /*** 広告の配置 ***/
    bannerIsVisible = NO;
    
    
}
// 広告のロード
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"Info in %@ : loaded adbanner .. ",NSStringFromClass([self class]));
    // 広告が表示されていない場合は表示する
    if (!bannerIsVisible) {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        banner.frame = CGRectOffset(CGRectZero, 0, self.view.frame.size.height-banner.frame.size.height);
        [UIView commitAnimations];
        bannerIsVisible = YES;
    }
}

// 広告のタップ
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    // いつでも広告表示OK
    return YES;
}

// 広告読み込みエラー
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"Err in %@ : error in loading adbanner .. ",NSStringFromClass([self class]));
    if (bannerIsVisible == YES) {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        banner.frame = CGRectOffset(CGRectZero, 0, self.view.frame.size.height+banner.frame.size.height);
        [UIView commitAnimations];
        bannerIsVisible = NO;
    }
}
/*//////////////////////////////////////////////////////////
 広告表示用の諸々の関数
 広告表示する場合はここから上が必要
 *///////////////////////////////////////////////////////////

@end
