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
    self.yourAnswerLbl.text = appDelegate.dSelectedAnswer;
    NSLog(@"view");

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
    [super viewDidUnload];
}
@end
