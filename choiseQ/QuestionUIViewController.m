//
//  QuestionUIViewController.m
//  choiseQ
//
//  Created by Ken Yagura on 13/05/06.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import "QuestionUIViewController.h"
#import "DataModel.h"
#define SCREEN_TYPE_3_5 @"iphone4"
#define SCREEN_TYPE_4_0 @"iphone5"

@interface QuestionUIViewController ()

@end

@implementation QuestionUIViewController
@synthesize questionNoLbl;
@synthesize selectedAnswerBtn;

///// 広告用　/////
@synthesize bannerIsVisible;
///// ここまで広告用　/////

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//view初期化時
- (void)viewWillAppear:(BOOL)animated{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    NSLog(@"Question Number: %@", [appDelegate.qList objectAtIndex:appDelegate.qCount]);

    //出題数をカウント
    appDelegate.qCount ++;
    NSNumber *qCount = [appDelegate.qList objectAtIndex:appDelegate.qCount - 1];
    
    //DBから問題文、選択肢の取得
    NSString *question = [DataModel getQuestion:qCount];
    NSString *choiseA  = [DataModel getChoiseA:qCount];
    NSString *choiseB  = [DataModel getChoiseB:qCount];
    NSString *choiseC  = [DataModel getChoiseC:qCount];
    NSString *choiseD  = [DataModel getChoiseD:qCount];

    self.questionNoLbl.text = [NSString stringWithFormat:@"第 %d 問", appDelegate.qCount];
    //self.QuestionTextView.text = [NSString stringWithFormat:@"%@\n\nA: %@\nB: %@\nC: %@\nD: %@", question, choiseA, choiseB, choiseC, choiseD];
    self.QuestionTextView.text = [NSString stringWithFormat:@"%@", question];
    self.ChoiseATextView.text = [NSString stringWithFormat:@"%@", choiseA];
    self.ChoiseBTextView.text = [NSString stringWithFormat:@"%@", choiseB];
    self.ChoiseCTextView.text = [NSString stringWithFormat:@"%@", choiseC];
    self.ChoiseDTextView.text = [NSString stringWithFormat:@"%@", choiseD];
    
    //    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    if([appDelegate.screenType isEqual: SCREEN_TYPE_3_5]){
        [self.QuestionTextView setFrame:CGRectMake(self.QuestionTextView.frame.origin.x, self.QuestionTextView.frame.origin.y, self.QuestionTextView.frame.size.width, 110)];
        
    }else{
        NSLog(@"trest");
        /*[self.QuestionTextView setFrame:CGRectMake(self.QuestionTextView.frame.origin.x, self.QuestionTextView.frame.origin.y, self.QuestionTextView.frame.size.width, 190)];
        */
        
        CGRect frame = self.QuestionTextView.frame;
        frame.size.height = 190;//self.QuestionTextView.contentSize.height;
        self.QuestionTextView.frame = frame;
    }
    NSLog(@"QuestionTextView is %f",self.QuestionTextView.frame.size.height);
    NSLog(@"QuestionTextView is c%f",self.QuestionTextView.contentSize.height);
    NSLog(@"Optimize textView to screen type --> %@",appDelegate.screenType);

}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view.
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

- (void)viewDidUnload {
    [self setQuestionTextView:nil];
    [self setQuestionNoLbl:nil];
    [super viewDidUnload];
}

#pragma mark - 解答ボタンを押した時
/*//////////////////////////////////////////////////////////
 解答ボタンを押した時に呼ばれる
*///////////////////////////////////////////////////////////
- (IBAction)selectA:(id)sender {
    [self setSelectedAnswer:@"a"];

}

- (IBAction)selectB:(id)sender {
    [self setSelectedAnswer:@"b"];

}

- (IBAction)selectC:(id)sender {
    [self setSelectedAnswer:@"c"];

}

- (IBAction)selectD:(id)sender {
    [self setSelectedAnswer:@"d"];
}

/*//////////////////////////////////////////////////////////
 解答ボタンを押した時に呼ばれる
 選択した解答をdelegateに入れて、次画面への遷移を呼び出す。
 *///////////////////////////////////////////////////////////

- (void)setSelectedAnswer:(NSString *)_selectedAnswerBtn{
    self.selectedAnswerBtn = _selectedAnswerBtn;
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    appDelegate.dSelectedAnswer = self.selectedAnswerBtn;
    [self performSegueWithIdentifier:@"toAnswerView" sender:self];

    
}

#pragma mark - 画面遷移時
/*//////////////////////////////////////////////////////////
 画面遷移時に呼ばれる
*///////////////////////////////////////////////////////////
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //後で消して。
    /*画面遷移時に条件つけて別画面に遷移する場合に使う用
    if ([[segue identifier] isEqualToString:@"segJunle"]){
    }else if([[segue identifier] isEqualToString:@"segArea"]){
    }
    */

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
