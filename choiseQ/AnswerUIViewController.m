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

- (void) actionSheet:(UIActionSheet *)shareActionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            // １番目のボタンが押されたときの処理を記述する
            //　つまり、Facebookに投稿する。の時
            break;
        case 1:
            // ２番目のボタンが押されたときの処理を記述する
            // つまり、Facebookに投稿する。の時
            break;
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
        [self.answerTab setBackgroundImage:[UIImage imageNamed:@"kaisetsu_tab_on.gif"] forState:UIControlStateNormal];
        [self.questionTab setBackgroundImage:[UIImage imageNamed:@"monndai_tab_off.gif"] forState:UIControlStateNormal];
        
        //ここで表示する文章を変える。
        self.answerTextView.text =@"解説をここに表示する。";
        
    }else{
        [self.answerTab setBackgroundImage:[UIImage imageNamed:@"kaisetsu_tab_off.gif"] forState:UIControlStateNormal];
        [self.questionTab setBackgroundImage:[UIImage imageNamed:@"monndai_tab_on.gif"] forState:UIControlStateNormal];
        
        //ここで表示する文章を変える。
        self.answerTextView.text =@"問題をここに表示する。";
        
    }
}

@end
