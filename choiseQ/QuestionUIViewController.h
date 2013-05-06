//
//  QuestionUIViewController.h
//  choiseQ
//
//  Created by Ken Yagura on 13/05/06.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionUIViewController : UIViewController
- (IBAction)selectA:(id)sender;
- (IBAction)selectB:(id)sender;
- (IBAction)selectC:(id)sender;
- (IBAction)selectD:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *QuestionTextView;

@end
