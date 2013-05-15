//
//  AnswerUIViewController.h
//  choiseQ
//
//  Created by Ken Yagura on 13/05/06.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface AnswerUIViewController : UIViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIButton *answerTab;
@property (weak, nonatomic) IBOutlet UIButton *questionTab;
@property (weak, nonatomic) IBOutlet UIImageView *tofImg;
@property (weak, nonatomic) IBOutlet UIImageView *tofWordImg;
@property (weak, nonatomic) IBOutlet UILabel *yourAnswerLbl;
@property (nonatomic, assign) int tabSwitch;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;

- (int) judgeTOF:(NSString *)_yourAnser;
- (IBAction)doKaisetsu:(id)sender;
- (IBAction)doMondai:(id)sender;
- (IBAction)doShare:(id)sender;
- (IBAction)doNext:(id)sender;
- (IBAction)doHome:(id)sender;

@end
