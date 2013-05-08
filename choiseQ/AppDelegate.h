//
//  AppDelegate.h
//  choiseQ
//
//  Created by Ken Yagura on 13/05/06.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSString *dSelectedAnswer;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSString *dSelectedAnswer;

@end
