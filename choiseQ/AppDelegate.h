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
//選択した答えを次画面に引き継ぐための変数
@property (nonatomic, retain) NSString *dSelectedAnswer;
//現在の問題数をカウントする変数
@property (nonatomic, assign) int qCount;

@end
