//
//  QuestionUIViewController.h
//  choiseQ
//
//  Created by Ken Yagura on 13/05/06.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface QuestionUIViewController : UIViewController{
    NSString *selectedAnswerBtn;
}

@property (weak, nonatomic) IBOutlet UILabel *questionNoLbl;
@property (nonatomic ,retain) NSString *selectedAnswerBtn;
@property (weak, nonatomic) IBOutlet UITextView *QuestionTextView;

- (IBAction)selectA:(id)sender;
- (IBAction)selectB:(id)sender;
- (IBAction)selectC:(id)sender;
- (IBAction)selectD:(id)sender;
- (void)setSelectedAnswer:(NSString *)_selectedAnswerBtn;

@end
