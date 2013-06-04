//
//  AnswerUIViewController.h
//  choiseQ
//
//  Created by Ken Yagura on 13/05/06.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import "AppDelegate.h"
#import "iAd/iAd.h"

@interface AnswerUIViewController : UIViewController<UIActionSheetDelegate,ADBannerViewDelegate>{
    ///// 広告用　/////
    BOOL bannerIsVisible;
    ///// ここまで広告用　/////

    
}
@property (weak, nonatomic) IBOutlet UIButton *answerTab;
@property (weak, nonatomic) IBOutlet UIButton *questionTab;
@property (weak, nonatomic) IBOutlet UIImageView *tofImg;
@property (weak, nonatomic) IBOutlet UIImageView *tofWordImg;
@property (weak, nonatomic) IBOutlet UILabel *yourAnswerLbl;
@property (nonatomic, assign) int tabSwitch;
@property (weak, nonatomic) IBOutlet UIScrollView *answerScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *answerImg;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;
///// 広告用　/////
@property (nonatomic, assign) BOOL bannerIsVisible;
@property (weak, nonatomic) ADBannerView *adView;
///// ここまで広告用　/////

///// 広告用　/////
- (void)viewIAdBox:(ADBannerView *)_adView;
///// ここまで広告用　/////


- (int) judgeTOF:(NSString *)_yourAnser;
- (IBAction)doKaisetsu:(id)sender;
- (IBAction)doMondai:(id)sender;
- (IBAction)doShare:(id)sender;
- (IBAction)doNext:(id)sender;
- (IBAction)doHome:(id)sender;

@end
