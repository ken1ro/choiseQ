//
//  QuestionUIViewController.m
//  choiseQ
//
//  Created by Ken Yagura on 13/05/06.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import "QuestionUIViewController.h"

@interface QuestionUIViewController ()

@end

@implementation QuestionUIViewController
@synthesize questionNoLbl;
@synthesize selectedAnswerBtn;

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
    NSLog(@"QuestionUIViewController viewWillAppear");

    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    //出題数をカウント
    appDelegate.qCount ++;
    self.questionNoLbl.text = [NSString stringWithFormat:@"第 %d 問", appDelegate.qCount];
    

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
@end
