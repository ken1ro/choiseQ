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

- (IBAction)selectA:(id)sender {
}

- (IBAction)selectB:(id)sender {
}

- (IBAction)selectC:(id)sender {
}

- (IBAction)selectD:(id)sender {
}
- (void)viewDidUnload {
    [self setQuestionTextView:nil];
    [super viewDidUnload];
}
@end
