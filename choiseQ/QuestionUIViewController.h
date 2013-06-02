//
//  QuestionUIViewController.h
//  choiseQ
//
//  Created by Ken Yagura on 13/05/06.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "iAd/iAd.h"


@interface QuestionUIViewController : UIViewController<ADBannerViewDelegate>{
    NSString *selectedAnswerBtn;
    ///// 広告用　/////
    BOOL bannerIsVisible;
    ///// ここまで広告用　/////

}

@property (weak, nonatomic) IBOutlet UILabel *questionNoLbl;
@property (nonatomic ,retain) NSString *selectedAnswerBtn;
@property (weak, nonatomic) IBOutlet UITextView *QuestionTextView;

///// 広告用　/////
@property (nonatomic, assign) BOOL bannerIsVisible;
@property (weak, nonatomic) ADBannerView *adView;
///// ここまで広告用　/////



- (IBAction)selectA:(id)sender;
- (IBAction)selectB:(id)sender;
- (IBAction)selectC:(id)sender;
- (IBAction)selectD:(id)sender;
- (void)setSelectedAnswer:(NSString *)_selectedAnswerBtn;


///// 広告用　/////
- (void)viewIAdBox:(ADBannerView *)_adView;
///// ここまで広告用　/////

@end
