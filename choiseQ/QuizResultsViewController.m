//
//  QuizResultsViewController.m
//  choiseQ
//
//  Created by Ken Yagura on 13/05/08.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import "QuizResultsViewController.h"

@interface QuizResultsViewController ()

@end

@implementation QuizResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (IBAction)doHome:(id)sender {
}

- (IBAction)niseShare:(id)sender {
    //ゴミコード
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"このボタンいらんくね？" message:@"いらんくね？" delegate:self cancelButtonTitle:@"そう思う。"
                                          otherButtonTitles:@"そうかもしれない。", nil];
    [alert show];
}
@end
