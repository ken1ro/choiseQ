//
//  AnswerUIViewController.h
//  choiseQ
//
//  Created by Ken Yagura on 13/05/06.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface AnswerUIViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *answerTab;
@property (weak, nonatomic) IBOutlet UIButton *questionTab;
@property (weak, nonatomic) IBOutlet UIImageView *tofImg;
@property (weak, nonatomic) IBOutlet UIImageView *tofWordImg;
@property (weak, nonatomic) IBOutlet UILabel *yourAnswerLbl;

@end
