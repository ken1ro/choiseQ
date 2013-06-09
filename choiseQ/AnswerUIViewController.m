//
//  AnswerUIViewController.m
//  choiseQ
//
//  Created by Ken Yagura on 13/05/06.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import "AnswerUIViewController.h"

@interface AnswerUIViewController ()

@end


@implementation AnswerUIViewController
@synthesize tofImg;
@synthesize tofWordImg;
@synthesize tabSwitch;

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
    //後で消す
    //debug
    NSLog(@"AnswerUIViewController viewWillAppear");
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSString *yourAnswer = appDelegate.dSelectedAnswer;
    //前画面で選んだ選択肢を表示
    self.yourAnswerLbl.text = yourAnswer;
    //正解か不正解かを判定する。
    
    if ([self judgeTOF:yourAnswer]) {
        //正解なら○と正解を表示
        tofImg.image = [UIImage imageNamed:@"maru.png"];
        tofWordImg.image = [UIImage imageNamed:@"True.png"];
        
    }else{
        //不正解なら×と不正解を表示
        tofImg.image = [UIImage imageNamed:@"batsu.png"];
        tofWordImg.image = [UIImage imageNamed:@"False.png"];

    }
    
    //解説タブか、問題タブか。初期は解説タブ
    self.tabSwitch = 1;
    [self selectTabSwitch];

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
    [self setAnswerTab:nil];
    [self setQuestionTab:nil];
    [self setTofImg:nil];
    [self setTofWordImg:nil];
    [self setYourAnswerLbl:nil];
    [self setAnswerTextView:nil];
    [super viewDidUnload];
}

/*//////////////////////////////////////////////////////////
 正解か不正解かを判定する。
 引数：ユーザの選択肢
 返値：正解なら１、不正解なら０
 *///////////////////////////////////////////////////////////
- (int) judgeTOF:(NSString *)_yourAnser{
    int judged = 0;
    NSString *correctAnswer = @"a";
    
    //DBから正解を持ってくる
    //correctAnswer = ???
    
    //判定
    if ([_yourAnser isEqualToString:correctAnswer]){
        judged = 1;
    }else{
        judged = 0;
    }
    
    return judged;
}

/*//////////////////////////////////////////////////////////
 解説表示タブを押下時に呼ばれる。
 tabSwitchに１（＝解説）を入れて、
 selectTabSwitchを呼び出す。
*///////////////////////////////////////////////////////////

- (IBAction)doKaisetsu:(id)sender {
    self.tabSwitch = 1;
    [self selectTabSwitch];
}

/*//////////////////////////////////////////////////////////
 問題は...表示タブを押下時に呼ばれる。
 tabSwitchに２（＝問題）を入れて、
 selectTabSwitchを呼び出す。
 *///////////////////////////////////////////////////////////
- (IBAction)doMondai:(id)sender {
    self.tabSwitch = 2;
    [self selectTabSwitch];
}

/*//////////////////////////////////////////////////////////
 Shareボタン押下時に呼ばれる。
 以下の選択肢を表示
 １．「Facebookに投稿する。」
 ２．「Twitterに投稿する。」
 ３．「あとは。。。」（これは拡張用）
 ４．「キャンセル」
 *///////////////////////////////////////////////////////////
- (IBAction)doShare:(id)sender {
    //選択肢を表示
    UIActionSheet *shareActionSheet = [[UIActionSheet alloc] init];
    shareActionSheet.title = @"この問題を・・・";
    shareActionSheet.delegate = self;
    [shareActionSheet addButtonWithTitle:@"Facebookに投稿する。"];
    [shareActionSheet addButtonWithTitle:@"Twitterに投稿する。"];
    [shareActionSheet addButtonWithTitle:@"あとは。。。"];
    [shareActionSheet addButtonWithTitle:@"キャンセル"];
    shareActionSheet.cancelButtonIndex = 4;
    shareActionSheet.destructiveButtonIndex = 4;
    shareActionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [shareActionSheet showInView:self.view.window];
}


/*//////////////////////////////////////////////////////////
 Nextボタン押下時に呼ばれる。
 問題回答数によって、次画面に遷移
 *///////////////////////////////////////////////////////////
- (IBAction)doNext:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    int questionCount = appDelegate.qCount;
    int questionCountLimit = 5;

    if(questionCount < questionCountLimit){
        //解答問題数（questionCount）が指定問題数（questionCountLimit)より小さければ
        //問題を繰り返すために、問題画面に遷移する。
        [self performSegueWithIdentifier:@"toQuestionView" sender:self];

        
    }else{
        //そうでなければ、クイズ結果画面に遷移する。
        appDelegate.qCount = 0;
        [self performSegueWithIdentifier:@"toQuizResultView" sender:self];        
        
    }

}

- (IBAction)doHome:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    appDelegate.qCount = 0;
}


/*//////////////////////////////////////////////////////////
 Shareボタン押下後のActionSheetのボタン押下時に呼ばれる。

*///////////////////////////////////////////////////////////
- (void) actionSheet:(UIActionSheet *)shareActionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            // １番目のボタンが押されたときの処理を記述する
            //　つまり、Facebookに投稿する。の時
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) { //利用可能チェック
        NSString *serviceType = SLServiceTypeFacebook;
        SLComposeViewController *composeCtl = [SLComposeViewController composeViewControllerForServiceType:serviceType];
        [composeCtl setInitialText:@"facebook投稿テストだよ"];
        [composeCtl addImage:[UIImage imageNamed:@"ball.jpg"]];
        
        //[composeCtl setCompletionHandler:^(SLComposeViewControllerResult result) {
            
            //if (result == SLComposeViewControllerResultDone) {
            //    NSLog(@"投稿に成功しました。");//投稿成功時の処理
            //} else if (result == SLComposeViewControllerResultCancelled) {
            //    NSLog(@"投稿をキャンセルしました.");
            //}
        //}];
        
        [self presentViewController:composeCtl animated:YES completion:nil];
    }
            //break;
        case 1:
            // ２番目のボタンが押されたときの処理を記述する
            // つまり、twitterに投稿する。の時
                if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) { //利用可能チェック
        NSString *serviceType = SLServiceTypeTwitter;
        SLComposeViewController *composeCtl = [SLComposeViewController composeViewControllerForServiceType:serviceType];
        [composeCtl setInitialText:@"twitter投稿テストだよ"];
        [composeCtl addImage:[UIImage imageNamed:@"ball.jpg"]];
        
        //[composeCtl setCompletionHandler:^(SLComposeViewControllerResult result) {
            
            //if (result == SLComposeViewControllerResultDone) {
            //    NSLog(@"投稿に成功しました。");//投稿成功時の処理
            //} else if (result == SLComposeViewControllerResultCancelled) {
            //    NSLog(@"投稿をキャンセルしました.");
            //}
        //}];
            
        [self presentViewController:composeCtl animated:YES completion:nil];
    }
            //break;
        case 2:
            // ３番目のボタンが押されたときの処理を記述する
            // つまり、、、追加する時。
            break;
    }
    
}

/*//////////////////////////////////////////////////////////
 解説表示か、問題表示かを切り替える。
 tabSwitchが
 -１なら解説を表示。
 -２なら問題を表示。
 *///////////////////////////////////////////////////////////
- (void) selectTabSwitch{
    if (self.tabSwitch == 1){
        [self.answerTab setBackgroundImage:[UIImage imageNamed:@"kaisetsu_tab_on_2.png"] forState:UIControlStateNormal];
        [self.questionTab setBackgroundImage:[UIImage imageNamed:@"mondai_tab_off_2.png"] forState:UIControlStateNormal];
        
        //ここで表示する文章を変える。
        self.answerTextView.text =@"解説をここに表示する。";
        
    }else{
        [self.answerTab setBackgroundImage:[UIImage imageNamed:@"kaisetsu_tab_off_2.png"] forState:UIControlStateNormal];
        [self.questionTab setBackgroundImage:[UIImage imageNamed:@"mondai_tab_on_2.png"] forState:UIControlStateNormal];
        
        //ここで表示する文章を変える。
        self.answerTextView.text =@"問題をここに表示する。";
        
    }
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
        banner.frame = CGRectOffset(CGRectZero, 0, self.view.frame.size.height-banner.frame.size.height-40);
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
